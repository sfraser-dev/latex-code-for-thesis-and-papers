function negExp();
close all;
a=1:255;
b=exp(-1*a);
plot(a,b)
c=log10(b);
figure, plot(a,c)
