%% function that normalizes a vector to values from 0 to 1
% Nicole Chernavsky 2022
%---------------------------------------------------------
function normal = normalizer(weird)
    weirdMin = min(weird);
    weirdMax = max(weird);
    normal = (weird - weirdMin)./(weirdMax-weirdMin);
end