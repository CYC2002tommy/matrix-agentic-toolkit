% demo_tps_interpolation.m
% A clean, standalone demonstration of Thin Plate Spline (TPS) interpolation 
% for geospatial upscaling, independent of any specific physical models.

clear; clc; close all;

% 1. Create a simulated coarse geospatial grid (e.g., 10x10)
[lon_coarse, lat_coarse] = meshgrid(linspace(130.0, 131.0, 10), linspace(34.0, 33.0, 10));

% Generate some synthetic environmental data (e.g., a spatial gradient + noise)
data_coarse = peaks(10) + randn(10, 10) * 0.5; 

% Extract valid observation points as 1D arrays
obs_lon = lon_coarse(:)';
obs_lat = lat_coarse(:)';
obs_val = data_coarse(:)';

% 2. Define the target high-resolution fine grid (e.g., 200x200)
[lon_fine, lat_fine] = meshgrid(linspace(130.0, 131.0, 200), linspace(34.0, 33.0, 200));

% 3. Apply Thin Plate Spline (TPS) Interpolation
disp('Performing TPS Interpolation...');
try
    % tpaps is part of the Curve Fitting Toolbox
    % Fit the thin plate smoothing spline
    st = tpaps([obs_lon; obs_lat], obs_val);
    
    % Evaluate the spline over the fine grid
    data_fine_flat = fnval(st, [lon_fine(:)'; lat_fine(:)']);
    
    % Reshape back to 2D matrix
    data_fine = reshape(data_fine_flat, size(lon_fine, 1), size(lon_fine, 2));
catch ME
    warning('TPS failed (Curve Fitting Toolbox missing?). Falling back to griddata (v4).');
    % Fallback to biharmonic spline interpolation (similar to TPS)
    data_fine = griddata(obs_lon, obs_lat, obs_val, lon_fine, lat_fine, 'v4');
end

% 4. Visualization
figure('Position', [100, 100, 1000, 450], 'Color', 'w');

subplot(1, 2, 1);
imagesc(lon_coarse(1,:), lat_coarse(:,1), data_coarse);
axis xy; colormap(parula); colorbar;
title('Original Coarse Grid (10x10)');
xlabel('Longitude'); ylabel('Latitude');

subplot(1, 2, 2);
imagesc(lon_fine(1,:), lat_fine(:,1), data_fine);
axis xy; colormap(parula); colorbar;
title('TPS Interpolated Fine Grid (200x200)');
xlabel('Longitude'); ylabel('Latitude');

sgtitle('Thin Plate Spline (TPS) Spatial Upscaling Demo', 'FontWeight', 'bold');
