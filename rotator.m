%% Function that rotates a given image based on user input
%User draws a line to represent the new desired horizon or x-axis
%Nicole Chernavsky 2023
%---------------------------------------------------------------------
function [ch1R, theta] = rotator(ch1, outputFile)
    % Display the first channel only (ch1)
    figure; imshow(mat2gray(ch1));  % Display the first channel
    % User draws a line across the vessel in the first channel
    [cx, cy, ~] = improfile;  % User draws the line
    close;

    % Calculate the rotation angle based on the drawn line
    theta = (180/pi) * atan((cy(end) - cy(1)) / (cx(end) - cx(1)));

    % Rotate the first channel image
    ch1R = imrotate(mat2gray(ch1), theta);  % Rotate the first channel by the calculated angle

    % Annotate the image with the drawn line
    figure; imshow(mat2gray(ch1));
    hold on;
    plot(cx, cy, 'r', 'LineWidth', 0.5);  % Draw the red line
    hold off;

    % Save the annotated file
    frameAnnotated = getframe(gca);
    imwrite(frameAnnotated.cdata, outputFile);
    close;
end