result1 = 0;
result2 = 0;
for i = 1:100
    result1 = result1 + i;
    result2 = result2 * i;
end

disp(['[result1 result2] = [', num2str([result1, result2]),']']);

%% make MATLAB logo by hand (https://www.mathworks.com/help/matlab/visualize/creating-the-matlab-logo.html)
L = 160*membrane(1,100);
f = figure('visible', 'off');
ax = axes;

s = surface(L);
s.EdgeColor = 'none';

ax.XLim = [1 201];
ax.YLim = [1 201];
ax.ZLim = [-53.4 160];

ax.CameraPosition = [-145.5 -229.7 283.6];
ax.CameraTarget = [77.4 60.2 63.9];
ax.CameraUpVector = [0 0 1];
ax.CameraViewAngle = 36.7;

ax.Position = [0 0 1 1];
ax.DataAspectRatio = [1 1 .9];

l1 = light;
l1.Position = [160 400 80];
l1.Style = 'local';
l1.Color = [0 0.8 0.8];
 
l2 = light;
l2.Position = [.5 -1 .4];
l2.Color = [0.8 0.8 0];

s.FaceColor = [0.9 0.2 0.2];

s.FaceLighting = 'gouraud';
s.AmbientStrength = 0.3;
s.DiffuseStrength = 0.6; 
s.BackFaceLighting = 'lit';

s.SpecularStrength = 1;
s.SpecularColorReflectance = 1;
s.SpecularExponent = 7;

axis off
f.Color = 'black';

%% make sample image by `image` command
g = figure('visible','off');
image;

%% save images

dir4fig = "./figs/";
if ~isfolder(dir4fig)
    mkdir(dir4fig);
end
saveas(f,dir4fig+"MATLAB_logo.png");
saveas(g,dir4fig+"MATLAB_image.png");

close all;

% msg = 'Error occurred.';
% error(msg)