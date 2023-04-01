function marianKatyanaBabyBW();
I=imread('marianKatyanaBabyBW.jpg');
I=I(1:512,21:532);
figure, imshow(I)
IN=imnoise(I,'gaussian',0,0.01);
figure, imshow(IN)

while 0,
IN=double(IN);
s0=hole_wavelet2d(IN,0);
s1=hole_wavelet2d(s0,1);
s2=hole_wavelet2d(s1,2);
w0=IN-s0;
w1=s0-s1;
w2=s1-s2;
tw0=SoftThresh(w0,th0);
tw1=SoftThresh(w1,th1);
tw2=SoftThresh(w2,th2);
recon=s2+tw2+tw1;
figure, imshow(uint8(recon))
end

while 0
IN=double(IN);
qmf=MakeONFilter('Daubechies',20);
[ll1,lh1,hl1,hh1]=WAVDOWN(IN,qmf);
[ll2,lh2,hl2,hh2]=WAVDOWN(ll1,qmf);
[ll3,lh3,hl3,hh3]=WAVDOWN(ll2,qmf);
clear ll2 ll1;

lh1=lh1*0;
hl1=hl1*0;
hh1=hh1*0;

ll2=WAVUP(ll3,lh3,hl3,hh3,qmf);
ll1=WAVUP(ll2,lh2,hl2,hh2,qmf);
NEW=WAVUP(ll1,lh1,hl1,hh1,qmf);
figure, imshow(uint8(NEW));
end

qmf=MakeONFilter('Daubechies',20);
cl=5;
IN=double(IN);
fwt=FWT2_PO(IN,cl,qmf);
fwt_dn20=SoftThresh(fwt,20);
iwt20=IWT2_PO(fwt_dn20,cl,qmf);
figure, imshow(uint8(iwt20)); 
fwt_dn50=SoftThresh(fwt,50);
iwt50=IWT2_PO(fwt_dn50,cl,qmf);
figure, imshow(uint8(iwt50));

imwrite(uint8(I),'I.jpg','Quality',100);
imwrite(uint8(IN),'IN.jpg','Quality',100);
imwrite(uint8(iwt20),'iwt20.jpg','Quality',100);
imwrite(uint8(iwt50),'iwt50.jpg','Quality',100);
