%initial_gui;
%guide;

im = dicomread('dcm_1.dcm');
imagesc(im);
display(size(im));
im_toned = tonemap(im, 'AdjustLightness', [0, 1], 'AdjustSaturation', .5);