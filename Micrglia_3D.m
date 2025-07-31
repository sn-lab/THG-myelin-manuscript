%% Define global variable for pixel distribution
global closest_distances_pixels_wk6pt5;

% Bleb coordinates	
blebs = [	
95.03847, 45.49893, 1;	
82.65891, 72.21126, 1;	
59.99997, 99.47313, 1;	
56.17449, 99.96942, 4;	
30.29499, 44.81733, 4;	
87.07014, 70.07913, 4;	
103.2837, 103.45836, 6;	
47.11986, 90.9723, 6;	
102.10155, 108.37653, 7;	
63.5379, 90.9936, 7;	
45.33705, 68.4369, 3;	
89.5452, 47.62041, 10;	
79.45965, 31.32378, 10;	
99.89913, 15.65124, 10;	
81.9198, 21.97521, 11;	
6.56679, 42.58083, 11;	
71.96205, 53.91669, 10;	
69.09933, 67.27605, 10;	
99.30912, 16.08576, 12;	
64.55391, 59.30559, 14;	
60.11286, 42.28476, 18;	
97.15782, 8.91405, 18;	
61.64433, 97.50075, 18;	
71.67024, 34.62954, 19;	
65.90007, 92.49099, 20;	
52.45338, 76.92708, 21;	
31.86906, 61.67415, 21;	
96.84471, 15.3786, 20;	
91.50054, 20.68017, 20;	
97.77339, 46.28916, 17;	
57.56112, 103.50948, 16;	
62.7711, 79.97298, 22;	
56.65587, 102.57867, 26;	
38.11422, 73.86201, 26;	
88.60587, 16.90581, 30;	
91.2492, 44.87697, 28;	
52.18287, 109.71204, 29;	
111.12423, 35.68389, 31;	
52.42143, 68.28141, 36;	
91.87968, 8.85441, 41;	
104.157, 76.53729, 42;	
68.98431, 63.89361, 42;	
35.34735, 5.67219, 41;	
74.10483, 44.64693, 45;	
16.79079, 59.37588, 25;	
36.91503, 74.0175, 25;	
102.39123, 5.50392, 38;	
93.02988, 54.77934, 25;	
110.50014, 29.61126, 24;	
14.1645, 100.57221, 24;	
98.30163, 83.48961, 26;	
58.24485, 26.5185, 41;	
78.32862, 93.67527, 3;	
33.21309, 14.34555, 8	
];	
% Microglia coordinates	
microglia = [	
49.75893, 5.751, 1;	
12.83112, 10.41144, 1;	
98.93211, 29.29815, 1;	
6.1983, 69.80649, 1;	
85.2426, 99.74577, 1;	
50.38941, 6.30693, 2;	
13.85352, 11.67879, 2;	
8.33895, 70.06635, 2;	
85.10841, 99.42627, 2;	
50.44053, 6.82878, 3;	
36.36336, 10.02804, 3;	
15.18477, 11.03979, 3;	
13.25925, 12.17295, 3;	
20.62692, 47.85684, 3;	
33.64122, 74.9973, 3;	
83.83041, 99.42414, 3;	
34.58055, 110.60025, 3;	
21.1509, 49.01982, 4;	
52.34475, 73.35081, 4;	
32.45907, 75.98775, 4;	
81.58326, 88.72941, 4;	
65.19291, 52.38735, 5;	
52.20204, 70.53069, 5;	
32.35044, 73.01214, 5;	
30.7785, 74.66928, 5;	
71.51475, 77.66406, 5;	
79.98789, 89.05104, 5;	
64.37073, 30.6933, 6;	
87.14256, 45.83547, 6;	
64.81803, 52.9944, 6;	
51.88254, 70.36881, 6;	
32.05437, 73.06113, 6;	
70.02588, 78.79722, 6;	
78.88242, 89.23848, 6;	
64.28766, 29.20443, 7;	
9.54879, 41.35608, 7;	
85.68138, 48.7344, 7;	
69.64887, 79.42344, 7;	
63.48891, 27.30447, 8;	
85.49181, 48.28923, 8;	
96.69774, 80.7483, 8;	
84.45663, 46.33602, 9;	
84.93162, 51.60351, 9;	
102.74481, 54.89223, 9;	
109.65666, 99.77985, 9;	
106.02288, 103.4328, 9;	
66.38571, 22.27767, 10;	
80.73339, 44.93661, 10;	
84.24576, 46.32324, 10;	
101.06424, 54.28092, 10;	
98.16318, 58.70067, 10;	
106.85784, 102.05682, 10;	
102.72351, 21.99651, 11;	
69.80436, 32.36109, 11;	
85.0509, 46.49364, 11;	
99.14511, 54.94548, 11;	
46.12515, 69.95985, 11;	
28.42272, 85.58553, 11;	
68.62221, 30.73164, 12;	
98.77875, 54.5919, 12;	
10.05999, 67.21215, 12;	
46.64274, 71.13135, 12;	
26.76771, 86.07969, 12;	
31.40046, 27.27891, 13;	
56.05095, 24.71226, 13;	
99.14724, 53.78889, 13;	
9.47637, 66.74781, 13;	
107.1603, 68.85651, 13;	
30.10968, 27.67722, 14;	
55.98279, 26.05842, 14;	
82.37775, 31.25988, 14;	
99.82245, 52.37883, 14;	
7.15041, 65.16309, 14;	
57.91257, 3.97884, 15;	
111.46077, 6.11523, 15;	
56.68143, 26.03712, 15;	
82.80801, 31.15764, 15;	
90.10752, 4.55181, 16;	
111.01986, 6.60726, 16;	
96.26535, 13.99623, 16;	
108.78549, 25.50888, 16;	
82.87617, 30.96168, 16;	
90.40359, 4.29834, 17;	
53.96781, 24.25005, 17;	
108.82809, 25.43433, 17;	
35.38356, 38.34852, 17;	
37.35594, 111.01986, 17;	
41.35395, 113.11365, 17;	
106.39563, 3.90642, 18;	
53.82936, 24.282, 18;	
81.11679, 34.69557, 18;	
37.40493, 111.13914, 18;	
53.79102, 23.65578, 19;	
80.77812, 35.48154, 19;	
100.08444, 11.17824, 20;	
101.1324, 12.88863, 20;	
95.2536, 13.25499, 20;	
89.82636, 28.36095, 20;	
81.20838, 35.42829, 20;	
87.97326, 99.49443, 20;	
105.12828, 3.94263, 21;	
18.95274, 4.6647, 21;	
99.63075, 11.9067, 21;	
111.1434, 13.74702, 21;	
95.02995, 19.65777, 21;	
91.22364, 27.60054, 21;	
80.99751, 34.90431, 21;	
97.2132, 81.40434, 21;	
92.54211, 84.96144, 21;	
88.00947, 99.77559, 21;	
11.5659, 101.61378, 21;	
105.19218, 3.72324, 22;	
19.16787, 4.83723, 22;	
12.19425, 11.83215, 22;	
9.39543, 14.55642, 22;	
93.04479, 26.20752, 22;	
57.35451, 53.79954, 22;	
91.85412, 85.46199, 22;	
11.70009, 101.69472, 22;	
19.62369, 4.33455, 23;	
12.50949, 11.6511, 23;	
58.52388, 32.26311, 23;	
57.77412, 53.52264, 23;	
11.01636, 110.37021, 23;	
107.42229, 8.91618, 24;	
58.41738, 52.51089, 24;	
10.32198, 110.19555, 24;	
101.36457, 6.56892, 25;	
107.9058, 9.25272, 25;	
100.84059, 66.59019, 25;	
30.95955, 100.34217, 25;	
10.6926, 109.09221, 25;	
40.4274, 1.76577, 26;	
101.39652, 6.59235, 26;	
80.43732, 49.90377, 26;	
108.20613, 61.33122, 26;	
101.29641, 65.8809, 26;	
34.70409, 94.56774, 26;	
30.61662, 100.11426, 26;	
39.51576, 2.97348, 27;	
74.45841, 3.83613, 27;	
45.60543, 46.61505, 27;	
80.54169, 50.50017, 27;	
34.3356, 96.81702, 27;	
74.10057, 3.37392, 28;	
39.95241, 2.95005, 28;	
73.78746, 68.47098, 28;	
72.50733, 73.08243, 28;	
85.70694, 58.86042, 29;	
81.88359, 62.27055, 29;	
75.09954, 68.01303, 29;	
82.1115, 71.50836, 29;	
76.55433, 72.27516, 29;	
74.89293, 3.48681, 30;	
78.88029, 10.6713, 30;	
79.97085, 64.13856, 30;	
85.78788, 100.962, 30;	
113.62485, 105.86313, 30;	
87.02967, 4.40484, 31;	
80.06244, 9.84699, 31;	
78.33288, 10.85448, 31;	
81.90489, 62.34936, 31;	
75.81522, 68.08758, 31;	
73.36785, 69.72342, 31;	
113.78886, 74.18577, 31;	
92.72103, 111.28398, 31;	
89.41314, 111.31806, 31;	
88.7997, 2.52192, 32;	
67.93209, 37.37724, 32;	
80.97621, 62.61348, 32;	
107.15604, 77.64276, 32;	
91.38339, 111.01986, 32;	
102.73203, 25.89015, 33;	
84.25428, 27.39606, 33;	
78.09219, 30.04152, 33;	
70.54134, 35.54118, 33;	
67.57638, 37.51569, 33;	
80.13273, 62.80944, 33;	
110.13378, 3.39948, 34;	
103.50096, 24.62706, 34;	
81.71958, 28.68684, 34;	
73.62984, 28.2012, 34;	
91.08306, 46.90047, 34;	
109.11564, 77.63424, 34;	
109.57572, 3.50172, 35;	
95.30472, 23.01465, 35;	
81.11253, 29.35992, 35;	
88.51428, 27.02544, 35;	
73.08456, 27.76029, 35;	
106.09104, 49.70142, 35;	
107.50536, 7.11846, 36;	
96.1482, 23.18931, 36;	
102.60423, 24.90396, 36;	
84.70797, 29.0319, 36;	
78.61404, 31.04475, 36;	
107.68215, 7.04178, 37;	
96.36546, 23.25534, 37;	
104.77044, 24.66966, 37;	
73.68735, 27.9882, 37;	
78.74184, 31.22793, 37;	
76.4031, 32.13744, 37;	
108.9069, 5.97252, 38;	
34.63593, 16.62039, 38;	
74.42859, 28.19268, 38;	
109.58211, 5.19507, 39;	
25.45989, 9.52749, 39;	
35.01933, 16.53306, 39;	
21.55347, 41.91201, 39;	
15.37647, 43.52442, 39;	
88.19904, 62.32593, 39;	
110.76213, 5.69775, 40;	
107.73753, 7.33359, 40;	
25.46202, 9.38691, 40;	
58.65168, 8.95452, 40;	
17.47878, 13.62348, 40;	
22.06254, 42.92163, 40;	
16.86534, 43.7289, 40;	
88.75923, 62.34936, 40;	
107.53731, 8.2005, 41;	
24.84645, 10.16436, 41;	
16.99314, 14.17941, 41;	
107.29236, 22.5354, 41;	
103.22619, 25.39599, 41;	
107.97396, 26.01369, 41;	
105.80136, 28.88706, 41;	
22.28619, 42.57657, 41;	
16.07511, 43.56063, 41;	
105.9888, 9.0525, 42;	
17.1891, 14.34342, 42;	
104.5617, 23.68986, 42;	
105.59049, 29.6709, 42;	
22.578, 43.06647, 42;	
75.30402, 1.94256, 43;	
104.49567, 22.85703, 43;	
15.28062, 48.81321, 43;	
107.84616, 13.22943, 44;	
66.66687, 13.91529, 44;	
104.74488, 15.90471, 44;	
104.17617, 21.54282, 44;	
98.49759, 18.79725, 44;	
57.26718, 6.82239, 45;	
55.26924, 8.51361, 45;	
102.39336, 9.94923, 45;	
106.78116, 15.93027, 45;	
67.15464, 14.40732, 45;	
98.56362, 19.56618, 45;	
102.88752, 22.48215, 45;	
57.19263, 7.58706, 46;	
102.01635, 10.64574, 46;	
108.20613, 14.91639, 46;	
94.3377, 13.66608, 46;	
100.54878, 24.10734, 46;	
101.56266, 11.14629, 47;	
108.38079, 14.12829, 47;	
94.42503, 13.76406, 47;	
107.64168, 7.01196, 48;	
94.1034, 14.17728, 48;	
93.83502, 14.95899, 49;	
110.68758, 16.04103, 50;	
90.35886, 19.32123, 51;	
70.2048, 38.21007, 51;	
89.92008, 20.10294, 52;	
71.21655, 37.83945, 52;	
106.13151, 89.58993, 52;	
89.72412, 20.19027, 53;	
70.05144, 38.23137, 53;	
106.28061, 90.25236, 53;	
90.38016, 20.60136, 54;	
106.37433, 90.9084, 54;	
77.77695, 7.90869, 55;	
89.57076, 14.59476, 55;	
99.66909, 14.6331, 55;	
90.42063, 20.80584, 55;	
95.80101, 21.939, 55;	
81.07206, 29.69007, 55;	
89.5026, 14.44566, 56;	
99.13659, 14.55855, 56;	
89.67087, 21.03375, 56;	
89.89239, 14.38815, 57	
];	
% Volume dimensions for boundary calculations
volume_size = [115, 115, 57];

% Calculate the closest microglia for each bleb while considering edge effects
num_blebs = size(blebs, 1);
closest_distances_blebs = [];

for i = 1:num_blebs
    bleb_coords = blebs(i, :);
    
    % Distance to the nearest microglia
    distances = sqrt(sum((microglia - bleb_coords).^2, 2));
    min_distance = min(distances);
    
    % Calculate distance to the nearest boundary
    edge_distance = min([bleb_coords(1) - 1, volume_size(1) - bleb_coords(1), ...
                         bleb_coords(2) - 1, volume_size(2) - bleb_coords(2), ...
                         bleb_coords(3) - 1, volume_size(3) - bleb_coords(3)]);
                     
    % Only count if the nearest microglia is closer than the edge distance
    if min_distance < edge_distance
        closest_distances_blebs(end + 1) = min_distance;
    end
end

% Calculate the closest microglia for each pixel while considering edge effects
closest_distances_pixels = [];

for z = 1:volume_size(3)
    for y = 1:volume_size(2)
        for x = 1:volume_size(1)
            pixel_coords = [x, y, z];
            
            % Distance to the nearest microglia
            distances = sqrt(sum((microglia - pixel_coords).^2, 2));
            min_distance = min(distances);
            
            % Calculate distance to the nearest boundary
            edge_distance = min([x - 1, volume_size(1) - x, ...
                                 y - 1, volume_size(2) - y, ...
                                 z - 1, volume_size(3) - z]);
                             
            % Only count if the nearest microglia is closer than the edge distance
            if min_distance < edge_distance
                closest_distances_pixels(end + 1) = min_distance;
            end
        end
    end
end

% Save the pixel distribution as a global variable for future use
closest_distances_pixels_wk6pt5 = closest_distances_pixels;

% Define bin edges to ensure both histograms have the same bins
bin_edges = linspace(0, max(closest_distances_pixels), 30); % 30 bins across the range

% Calculate histogram values without plotting (for manual normalization)
bleb_counts = histcounts(closest_distances_blebs, bin_edges);
pixel_counts = histcounts(closest_distances_pixels, bin_edges);

% Normalize both histograms to have a maximum height of 1
bleb_counts_normalized = bleb_counts / max(bleb_counts);
pixel_counts_normalized = pixel_counts / max(pixel_counts);

% Plot normalized histograms in the first figure
figure;

% Plot normalized bleb histogram
bar(bin_edges(1:end-1), bleb_counts_normalized, 'FaceAlpha', 0.5, 'DisplayName', 'Bleb Distances');
hold on;

% Plot normalized pixel histogram on the same axis for comparison
bar(bin_edges(1:end-1), pixel_counts_normalized, 'FaceAlpha', 0.1, 'DisplayName', 'Pixel Distances');

% Set plot labels and legend
title('Week 12 Normalized Histogram of Closest Microglia Distances');
xlabel('Distance to Closest Microglia (microns)');
ylabel('Normalized Count (Max = 1)');
legend;
hold off

% Plot cumulative distribution function (CDF) in a separate figure
figure;
cdfplot(closest_distances_blebs);
hold on;
cdfplot(closest_distances_pixels);

% Customize CDF plot
title('Week 12 Cumulative Distribution of Closest Microglia Distances');
xlabel('Distance to Closest Microglia (microns)');
ylabel('Cumulative Probability');
legend('Bleb Distances CDF', 'Pixel Distances CDF');
grid off;
hold off;

% Perform a Kolmogorov-Smirnov test
[h, p] = kstest2(closest_distances_pixels, closest_distances_blebs);

% Display the K-S test result
fprintf('K-S Test Result:\n');
if h == 1
    fprintf('The distributions are significantly different (p = %.5f).\n', p);
else
    fprintf('No significant difference between distributions (p = %.5f).\n', p);
end

%% no blebs just pixel
% Define microglia coordinates
microglia = [
    99.03009, 66.03639, 3;
    48.68754, 100.60629, 3;
    99.88209, 66.55824, 4;
    48.36378, 99.90126, 4;
    99.84375, 66.22809, 5;
    48.10179, 97.72866, 5;
    99.38793, 66.50073, 6;
    47.925, 97.1706, 6;
    64.01076, 43.20705, 7;
    99.45183, 66.30264, 7;
    47.7759, 96.59976, 7;
    60.19593, 43.21557, 8;
    97.88415, 67.73826, 8;
    47.3499, 96.67857, 8;
    62.25564, 43.01322, 9;
    99.11955, 66.29838, 9;
    96.23766, 71.29323, 9;
    47.07939, 96.2334, 9;
    63.05226, 42.90459, 10;
    96.44853, 72.60957, 10;
    46.66617, 96.0417, 10;
    62.87973, 43.14954, 11;
    46.33176, 95.7861, 11;
    64.46445, 42.1314, 12;
    46.31472, 94.47402, 12;
    62.17896, 43.80558, 13;
    111.02838, 108.38292, 19;
    106.55112, 107.96331, 20;
    104.74275, 107.97183, 21;
    60.64962, 96.92991, 22;
    104.0931, 107.75031, 22;
    60.46431, 96.44853, 23;
    60.74121, 95.60079, 24;
    28.32687, 22.84638, 25;
    61.0671, 95.56032, 25;
    26.36088, 23.98167, 26;
    61.2162, 97.01724, 26;
    25.76235, 24.01362, 27;
    24.46944, 24.23088, 28;
    23.53863, 24.45666, 29;
    22.91028, 24.74208, 30;
    82.23291, 33.95433, 32;
    82.62057, 33.85848, 33;
    84.08814, 32.51658, 34;
    83.31069, 87.0744, 40;
    47.1369, 13.36149, 41;
    83.1339, 86.55681, 41;
    47.10069, 13.28268, 42;
    82.69086, 86.90613, 42
];



% Calculate the closest microglia for each pixel while considering edge effects
closest_distances_pixels = [];
% Volume dimensions for boundary calculations
volume_size = [115, 115, 67];

for z = 1:volume_size(3)
    for y = 1:volume_size(2)
        for x = 1:volume_size(1)
            pixel_coords = [x, y, z];
            
            % Distance to the nearest microglia
            distances = sqrt(sum((microglia - pixel_coords).^2, 2));
            min_distance = min(distances);
            
            % Calculate distance to the nearest boundary
            edge_distance = min([x - 1, volume_size(1) - x, ...
                                 y - 1, volume_size(2) - y, ...
                                 z - 1, volume_size(3) - z]);
                             
            % Only count if the nearest microglia is closer than the edge distance
            if min_distance < edge_distance
                closest_distances_pixels(end + 1) = min_distance;
            end
        end
    end
end

%% Plot pixel histograms
% Define bin edges based on the maximum distance across all data
all_distances = [closest_distances_pixels, closest_distances_pixels_wk3, closest_distances_pixels_wk5, ...
                 closest_distances_pixels_wk6pt5, closest_distances_pixels_wk8pt5, closest_distances_pixels_wk12];
bin_edges = linspace(0, max(all_distances), 30); % Adjust the number of bins as needed

% Calculate normalized histogram for each dataset
baseline_counts = histcounts(closest_distances_pixels, bin_edges, 'Normalization', 'probability');
wk3_counts = histcounts(closest_distances_pixels_wk3, bin_edges, 'Normalization', 'probability');
wk5_counts = histcounts(closest_distances_pixels_wk5, bin_edges, 'Normalization', 'probability');
wk6pt5_counts = histcounts(closest_distances_pixels_wk6pt5, bin_edges, 'Normalization', 'probability');
wk8pt5_counts = histcounts(closest_distances_pixels_wk8pt5, bin_edges, 'Normalization', 'probability');
wk12_counts = histcounts(closest_distances_pixels_wk12, bin_edges, 'Normalization', 'probability');

% Plot normalized histograms
figure;

% Use bar plots for each normalized histogram, adjusting width and transparency for clarity
bar(bin_edges(1:end-1), wk8pt5_counts, 'FaceAlpha', 0.5,  'DisplayName', 'Week 8.5');
hold on;
bar(bin_edges(1:end-1), wk6pt5_counts, 'FaceAlpha', 0.5,  'DisplayName', 'Week 6.5');
bar(bin_edges(1:end-1), baseline_counts, 'FaceAlpha', 0.5, 'DisplayName', 'Baseline');
hold on;
%bar(bin_edges(1:end-1), wk3_counts, 'FaceAlpha', 0.5, 'DisplayName', 'Week 3', 'BarWidth', 1);
%bar(bin_edges(1:end-1), wk5_counts, 'FaceAlpha', 0.5,  'DisplayName', 'Week 5', 'BarWidth', 1);


%bar(bin_edges(1:end-1), wk12_counts, 'FaceAlpha', 0.5, 'DisplayName', 'Week 12');

% Set plot labels and legend
title('Pixel Distances to Nearest Microglia');
xlabel('Distance to Closest Microglia (microns)');
ylabel('Normalized Count');
legend;
hold off;

%% Compare pixels line
% Define bin edges based on the maximum distance across all data
all_distances = [closest_distances_pixels, closest_distances_pixels_wk3, closest_distances_pixels_wk5, ...
                 closest_distances_pixels_wk6pt5, closest_distances_pixels_wk8pt5, closest_distances_pixels_wk12];
bin_edges = linspace(0, max(all_distances), 30); % Adjust the number of bins as needed
bin_centers = bin_edges(1:end-1) + diff(bin_edges)/2; % Calculate bin centers for plotting

% Calculate normalized histogram for each dataset
baseline_counts = histcounts(closest_distances_pixels, bin_edges, 'Normalization', 'probability');
wk3_counts = histcounts(closest_distances_pixels_wk3, bin_edges, 'Normalization', 'probability');
wk5_counts = histcounts(closest_distances_pixels_wk5, bin_edges, 'Normalization', 'probability');
wk6pt5_counts = histcounts(closest_distances_pixels_wk6pt5, bin_edges, 'Normalization', 'probability');
wk8pt5_counts = histcounts(closest_distances_pixels_wk8pt5, bin_edges, 'Normalization', 'probability');
wk12_counts = histcounts(closest_distances_pixels_wk12, bin_edges, 'Normalization', 'probability');

% Group data for easier iteration
%counts = {baseline_counts, wk3_counts, wk5_counts, wk6pt5_counts, wk8pt5_counts, wk12_counts};
%labels = {'Baseline', 'Week 3', 'Week 5', 'Week 6.5', 'Week 8.5', 'Week 12'};
counts = {baseline_counts, wk6pt5_counts, wk12_counts};
labels = {'Baseline', 'Week 6.5', 'Week 12'};
% Default MATLAB color order
colors = lines(length(counts));

% Plot line distribution with shading
figure;
hold on;

for i = 1:length(counts)
    % Get current histogram counts and color
    current_counts = counts{i};
    current_color = colors(i, :); % Use default MATLAB color order
    
    % Plot shaded area without adding it to the legend
    fill([bin_centers, fliplr(bin_centers)], ...
         [current_counts, zeros(size(current_counts))], ...
         current_color, 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'HandleVisibility', 'off');
     
    % Plot outline of histogram distribution
    plot(bin_centers, current_counts, '-', 'LineWidth', 1.5, 'Color', current_color, 'DisplayName', labels{i});
end

% Set plot labels and legend
title('Pixel Distances to Nearest Microglia');
xlabel('Distance to Closest Microglia (microns)');
ylabel('Normalized Count');
legend('show'); % Only shows the lines
hold off;