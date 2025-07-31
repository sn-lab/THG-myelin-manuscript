%% Calculate nodal width based on inflection points of a Gaussian fit
% Nuri Hong, Nicole Chernavsky 2024
%----------------------------------------------------------------------
function g = nodes()
    % Enter folder
    pname = '/Users/nurihong/Desktop/SN Lab/Nodes/forNodes/cuprizone/';
    zoom = 4; % Change based on tif stack
    conversion = 0.9038; % Change based on microscope

    % Create a folder for saving annotated duplicate files
    annotatedFolder = fullfile(pname, 'annotated_files');
    if ~exist(annotatedFolder, 'dir')
        mkdir(annotatedFolder);
    end

    % Check for .tif files in the selected folder
    files = dir([pname '*.tif']);
    displayProfile = true; % Set to true to enable plots and user interaction, false to disable

    % Initialize arrays and variables
    g.filenames = cell(length(files), 1);
    g.nodeWidths = cell(length(files), 1);  % Each file has a cell for multiple node widths
    g.theta = NaN(length(files), 1);  % Rotation angle
    g.myelin = cell(length(files), 1);  % Intensity profiles for myelin bundles

    try
        for j = 1:length(files)
            g.filenames{j} = files(j).name;

            nodeWidthsForFile = [];  % Store node widths for the current .tif file
            annotationCount = 0;    % Counter for annotations in the current file

            % Loop to allow multiple node analysis on the same .tif file
            while true
                % Read stack and select the first channel
                stack = tiffreadVolume([pname files(j).name]);
                numFrames = size(stack, 3);
                frameIdx = 1;

                % Allow user to move through frames
                while true
                    ch1 = stack(:, :, frameIdx);
                    figure; imshow(mat2gray(ch1));
                    title(sprintf('Frame %d of %d. Use arrow keys to navigate, press Enter to confirm.', frameIdx, numFrames));
                    waitforbuttonpress;
                    key = get(gcf, 'CurrentKey');
                    if strcmp(key, 'rightarrow')
                        frameIdx = min(frameIdx + 3, numFrames);
                    elseif strcmp(key, 'leftarrow')
                        frameIdx = max(frameIdx - 3, 1);
                    elseif strcmp(key, 'return')
                        close(gcf);
                        break;
                    end
                    close(gcf);
                end

                % Use the confirmed frame
                ch1 = stack(:, :, frameIdx);

                % Increment the annotation counter
                annotationCount = annotationCount + 1;

                % User-guided rotation and saving the annotated file

                annotatedFileName = sprintf('annotated_%s_node_%02d_frame_%03d.tif', files(j).name(1:end-4), annotationCount, (frameIdx+2)/3);
                annotatedFilePath = fullfile(annotatedFolder, annotatedFileName);

                [ch1R, theta] = rotator(ch1, annotatedFilePath);

                % Store the rotation angle
                g.theta(j) = theta;

                % Let the user draw a rectangle around the bundle
                figure; imshow(mat2gray(ch1R));
                title('Draw a rectangle around the node');
                hRect = imrect;
                rectPos = round(getPosition(hRect));
                close;

                % Extract region inside the rectangle
                x1 = rectPos(1);
                y1 = rectPos(2);
                rectWidth = rectPos(3);
                rectHeight = rectPos(4);
                region = ch1R(y1:y1+rectHeight-1, x1:x1+rectWidth-1);

                % Extract line profiles along the width of each row within the rectangle
                vesselTemp = zeros(rectHeight, rectWidth);  % Line profiles along the rectangle's width
                for i = 1:rectHeight
                    vesselTemp(i, :) = smoothdata(region(i, :), 'gaussian', 5);  % Adjust smoothing window if needed
                end

                % Average the smoothed profiles across rows
                vesselAvg = mean(vesselTemp, 1);

                % Convert pixel positions to microns
                pix2um = conversion / zoom;  % Conversion from pixels to microns
                x1 = (1:rectWidth) * pix2um;
                x2 = (1:0.1:rectWidth) * pix2um;  % Higher resolution for fitting

                % Gaussian fitting to the averaged, smoothed profile
                gaussV = fit(x1', vesselAvg', 'gauss4');

                % Smooth the Gaussian-fitted profile for analysis
                smoothV = feval(gaussV, x2);

                % Find all inflection points
                inflecPts = inflector(smoothV);

                % Display inflection points and allow user interaction
                if displayProfile
                    figure;
                    plot(x2, smoothV, 'b'); % Plot the smoothed Gaussian fit
                    hold on;
                    scatter(x2(inflecPts), smoothV(inflecPts), 'r', 'filled'); % Mark all inflection points
                    title('Inflection Points - Click Two Points to Measure Distance');
                    xlabel('Position (\mum)');
                    ylabel('Intensity');
                    hold off;

                    % Enable user interaction to select two points
                    [selectedX, ~] = ginput(2); % User clicks two points on the graph

                    % Calculate the distance between the selected points
                    distance = abs(selectedX(2) - selectedX(1)); % Calculate distance in microns
                    fprintf('Distance between selected points: %.4f microns\n', distance);

                    % Highlight the selected points on the graph
                    hold on;
                    scatter(selectedX, feval(gaussV, selectedX), 'g', 'filled');
                    hold off;
                end

                % Save the node width for printing
                nodeWidthsForFile = [nodeWidthsForFile; distance];

                % Print node widths in command window
                fprintf('Node widths for %s: %.4f microns\n', files(j).name, distance);

                % User input to analyze another node or move to the next file
                prompt = {'Enter 1 to analyze another node in this image', ...
                          'Enter 0 to move to the next image'};
                dlgtitle = 'Input';
                position = [.5 .25 .2 .2];
                z = mvdlg(prompt, dlgtitle, position);

                if strcmp(z{1}, '0')
                    break;  % Break the loop and move to the next file
                end
            end

            % Store the node widths collected for the current file
            g.nodeWidths{j} = nodeWidthsForFile;
        end

    catch e
        fprintf(1, 'Error occurred: %s\n', e.message);
    end
end
