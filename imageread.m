
imdata = imread('image9.jpg');

imdatared = imdata(:,:,1);
figure;
imshow(imdata,[]);
imdatablue = imdata(:,:,2);
imdatagreen = imdata(:,:,3);
a = histogramforimageread(imdatared);
%b = histogram(imdatablue);
%c = histogram(imdatagreen);
figure; 
stem(a);
%figure;
%stem(b);
%figure;
%stem(c);

aa = quantizer(imdatared,8);
figure;
imshow(aa,[]);

%
b = histogramforimageread(imdatablue); % original pdf (imdatablue);
%
figure; 
%
stem(b);
bb = quantizer(imdatablue,8);
figure;
imshow(bb,[]);
%
c = histogramforimageread(imdatagreen);
%
figure; 
%
stem(c);
cc = quantizer(imdatagreen,8);
figure;
imshow(cc,[]);

imagenow(:,:,1)= uint8(aa);
imagenow(:,:,2)= uint8(bb);
imagenow(:,:,3)= uint8(cc);

figure;
imshow(imagenow,[]);