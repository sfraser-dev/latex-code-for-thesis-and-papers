TitleSizeVal=14;
xLabFS=14; yLabFS=xLabFS;

Fs=100;
t=(1:100)/Fs;
s1=cos(2*pi*t*5); s2=cos(2*pi*t*10); s3=cos(2*pi*t*20); s4=cos(2*pi*t*50);
s=s1+s2+s3+s4;
figure, plot(t,s);
xlabel('t','FontSize',xLabFS);
ylabel('x(t)','FontSize',yLabFS);
title('Cosine signal with 5, 10, 20 and 50 Hertz at all times','FontSize',TitleSizeVal);
%print -deps sigStat.eps

[b,a]=ellip(4,0.1,40,[10 20]*2/Fs);
[H,w]=freqz(b,a,512);

sf=filter(b,a,s);

S=fft(s,512);
SF=fft(sf,512);
w=(0:255)/256*(Fs/2);
figure, plot(w,abs([S(1:256)']));
xlabel('Frequency (Hertz)','FontSize',xLabFS);
ylabel('Magnitude of Fourier transform','FontSize',yLabFS);
title('Fourier transform of stationary signal','FontSize',TitleSizeVal);    
%print -deps sigStatFT.eps


return

Fs=100;
t=(1:100)/Fs;
s1=cos(2*pi*t*5); s2=cos(2*pi*t*10); s3=cos(2*pi*t*20); s4=cos(2*pi*t*50);
s=[s1(1:25) s2(1:25) s3(26:50) s4(1:25)];
%s=s1+s2+s3+s4;
figure, plot(t,s);
title('Cosine signal with 5, 10, 20 and 50 Hertz at different intervals','FontSize',TitleSizeVal);
xlabel('t','FontSize',xLabFS);
ylabel('x(t)','FontSize',yLabFS);
%print -deps sigNonStat.eps

[b,a]=ellip(4,0.1,40,[10 20]*2/Fs);
[H,w]=freqz(b,a,512);

sf=filter(b,a,s);

S=fft(s,512);
SF=fft(sf,512);
w=(0:255)/256*(Fs/2);
%figure, plot(w,abs([S(1:256)' SF(1:256)']));
figure, plot(w,abs([S(1:256)']));
xlabel('Frequency (Hertz)','FontSize',xLabFS);
ylabel('Magnitude of Fourier transform','FontSize',yLabFS);
title('Fourier transform of non-stationary signal','FontSize',TitleSizeVal);    
%print -deps sigNonStatFT.eps

