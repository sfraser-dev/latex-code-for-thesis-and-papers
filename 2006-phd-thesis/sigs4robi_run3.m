TitleSizeVal=18;
xLabFS=20; yLabFS=xLabFS;
pointFS=16;


Fs=200;
t=(1:200)/Fs;
s1=cos(2*pi*t*5); s2=cos(2*pi*t*10); s3=cos(2*pi*t*20); s4=cos(2*pi*t*50);
s=s1+s2+s3+s4;
figure, plot(t,s);
xlabel('t','FontSize',xLabFS);
ylabel('x(t)','FontSize',yLabFS);
title('Cosine signal with 5, 10, 20 and 50 Hertz at all times','FontSize',TitleSizeVal);
h=gca;
set(h,'FontSize',pointFS);
%set(h,'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
print -deps sigStat.eps

[b,a]=ellip(4,0.1,40,[10 20]*2/Fs);
[H,w]=freqz(b,a,512);


S=fft(s,512);
w=(0:255)/256*(Fs/2);
figure, plot(w,abs([S(1:256)']));
xlabel('Frequency (Hertz)','FontSize',xLabFS);
ylabel('Magnitude of Fourier transform','FontSize',yLabFS);
title('Fourier transform of stationary signal','FontSize',TitleSizeVal);    
h=gca;
set(h,'FontSize',pointFS);
%set(h,'XTick',[0 10 20 30 40 50 60 70 80 90 100]);
print -deps sigStatFT.eps


Fs=200;
t=(1:200)/Fs;
s1=cos(2*pi*t*5); s2=cos(2*pi*t*10); s3=cos(2*pi*t*20); s4=cos(2*pi*t*50); 
s=[s1(1:50) s2(1:50) s3(1:50) s4(1:50)];
%s=s1+s2+s3+s4;
figure, plot(t,s);
%str1=sprintf('Cosine signal with 5, 10, 20 and 50 Hertz\nat different intervals');
%title(str1,'FontSize',TitleSizeVal);
title('Cosine signal with 5, 10, 20 and 50 Hertz at different intervals','FontSize',TitleSizeVal);
xlabel('t','FontSize',xLabFS);
ylabel('x(t)','FontSize',yLabFS);
h=gca;
set(h,'FontSize',pointFS);
%set(h,'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
print -deps sigNonStat.eps

[b,a]=ellip(4,0.1,40,[10 20]*2/Fs);
[H,w]=freqz(b,a,512);

sf=filter(b,a,s);

S=fft(s,512);
w=(0:255)/256*(Fs/2);
figure, plot(w,abs([S(1:256)']));
xlabel('Frequency (Hertz)','FontSize',xLabFS);
ylabel('Magnitude of Fourier transform','FontSize',yLabFS);
title('Fourier transform of non-stationary signal','FontSize',TitleSizeVal);    
h=gca;
set(h,'FontSize',pointFS);
%set(h,'XTick',[0 10 20 30 40 50 60 70 80 90 100]);
print -deps sigNonStatFT.eps

