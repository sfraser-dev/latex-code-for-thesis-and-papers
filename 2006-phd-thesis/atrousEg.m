function atrousEg();
I=MyReadImage('Lenna');
s0=hole_wavelet2d(I,0);
s1=hole_wavelet2d(s0,1);
s2=hole_wavelet2d(s1,2);
s3=hole_wavelet2d(s2,3);
w0=I-s0;
w1=s0-s1;
w2=s1-s2;
w3=s2-s3;

imwrite(uint8(I),'I.jpg');
imwrite(uint8(s0),'s0.jpg');
imwrite(uint8(s1),'s1.jpg');
imwrite(uint8(s2),'s2.jpg');
imwrite(uint8(s3),'s3.jpg');

imwrite(uint8(nav(w0)),'w0nav.jpg');
imwrite(uint8(nav(w1)),'w1nav.jpg');
imwrite(uint8(nav(w2)),'w2nav.jpg');
imwrite(uint8(nav(w3)),'w3nav.jpg');
