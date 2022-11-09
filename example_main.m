result = 0;
for i = 1:100000000000
    result = result + i;
end

dir4fig = "./figs/";
if ~isfolder(dir4fig)
    mkdir(dir4fig);
end

figure(1)
logo;
saveas(figure(1),dir4fig+"MATLAB_logo.png");

figure(2)
image;
saveas(figure(2),dir4fig+"MATLAB_image.png");

close all;

% msg = 'Error occurred.';
% error(msg)