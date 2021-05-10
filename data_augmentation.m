clear; clc; close all;

% Input images path
miFolder='./real_and_fake_face/training_real/'; 

% Output imges path
Resultados='./real/'; 

if ~isdir(miFolder)
errorMensaje = sprintf('Error: El folder no existe:\n%s', miFolder);
uiwait(warndlg(errorMensaje));
return;
end
filePatron = fullfile(miFolder, '*.jpg');
jpegFil = dir(filePatron);
mkdir(Resultados);
for k = 1:1081
baseFN = jpegFil(k).name;
fullFN = fullfile(miFolder, baseFN);
I=imread(fullFN);

% Augmentation types
I0 = flip(I, 2);
I1=imrotate(I, -45);
I2=imrotate(I, 60);

% Save
imwrite(I0,[Resultados,num2str(k),'_flip.png']);
imwrite(I1,[Resultados,num2str(k),'_rot_-45.png']);
imwrite(I2,[Resultados,num2str(k),'_rot_60.png']);
end