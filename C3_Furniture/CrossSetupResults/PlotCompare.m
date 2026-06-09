% PlotCompare.m
% -------------------------------------------------------------------------
% Reads multiple “Quest” directories and plots a given property
% side‑by‑side (columns = directories, rows = object‑instances).
% -------------------------------------------------------------------------
clear; clc;

% — CONFIGURE —
dirs = {'Quest2','Quest3','Quest3S'};    % your folders
base_dir = '.';                          % parent folder
%property_name = '% Prims Trivially Rejected';
property_name = '% Non-Base Level Textures';
objects_with_instances = { ...
%    'bed',1;  'bed',2;   'chair',1; 'chair',2;  'friger',1; 'friger',2; ...
%   'lamp',1; 'lamp',2;  'monitor',1;'monitor',2; 'pot',1;    'pot',2;   ...
%    'sofa',1; 'sofa',2;  'table',1; 'table',2;  'bookcase',1;'bookcase',2; ...
    'headboard',1;'headboard',2; 'plate',1; 'plate',2; 'sink',1; 'sink',2; ...
    'tablelamp',1; 'tablelamp',2; 'toilet',1; 'toilet',2; 'wallmirror',1; ...
    'wallmirror',2; 'blender',1; 'coffeemaker',1; 'dresser',1; ...
    'toaster',1; 'towelrack',1 ...
};
measurements_per_block = 10;               % how many measurement files per object

% — SET UP TILED LAYOUT —
nrows = size(objects_with_instances,1);
ncols = numel(dirs);
t = tiledlayout(nrows, ncols, ...
    'TileSpacing','compact','Padding','compact');

% — LOOP OVER EACH OBJECT‑INSTANCE & DIRECTORY —
for row = 1:nrows
    obj  = objects_with_instances{row,1};
    inst = objects_with_instances{row,2};
    fname_fmt = [obj,'_%d_%d_%d_%d.txt'];  % will fill: instance, speed, dist, meas#

    for col = 1:ncols
        ax = nexttile;
        hold(ax,'on');
        dir_path = fullfile(base_dir, dirs{col});

        % iterate measurement files 1..measurements_per_block
        for m = 1:measurements_per_block
            fname = sprintf(fname_fmt, inst, 1, 3, m);  % speed=1, dist=3
            fullpath = fullfile(dir_path, fname);
            if ~isfile(fullpath)
                continue;
            end

            % read & split into blocks on blank lines
            txt = fileread(fullpath);
            blocks = regexp(txt, '\r?\n\s*\r?\n', 'split');

            % extract the property per block
            vals = nan(numel(blocks),1);
            for b = 1:numel(blocks)
                lines = regexp(blocks{b}, '\r?\n', 'split');
                for L = lines
                    ln = strtrim(L{1});
                    if startsWith(ln, property_name)
                        parts  = regexp(ln, ':', 'split');
                        % FIX: remove commas & spaces in one go
                        numstr = regexprep(parts{2}, '[, ]', '');
                        v      = str2double(numstr);
                        vals(b)= v;
                        break;
                    end
                end
            end

            % drop NaNs, skip first 9 samples
            vals = vals(~isnan(vals));
            if numel(vals) > 9
                plot(ax, (10:numel(vals)), vals(10:end), 'LineWidth', 0.8);
            end
        end

        % formatting
        if row == 1
            title(ax, dirs{col}, 'Interpreter','none');
        end
        if col == 1
            ylabel(ax, sprintf('%s_%d', obj, inst), 'Interpreter','none');
        end
        set(ax, 'FontSize', 6);
        if col > 1
            yticks(ax, []);
        end
        if row < nrows
            xticks(ax, []);
        end
    end
end

% — GLOBAL LABELS —
xlabel(t, 'Sample index (skipping first 9)', 'FontWeight','bold');
ylabel(t, property_name, 'FontWeight','bold');
