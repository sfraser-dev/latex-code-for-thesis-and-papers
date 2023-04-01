function gaussPic();

I = imread('eight.tif');
IG=imnoise(I,'gaussian',0,0.005);
IGA=uint8(AV2_M(double(IG),5));

figure, imshow(IG); title('IG');
figure, imshow(IGA); title('IGA');

imwrite(IG,'eightGauss0p005.jpg');
imwrite(IGA,'eightGauss0p005_av5x5.jpg');
