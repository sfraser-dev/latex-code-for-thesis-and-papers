function overshoot(th);

theVar=0.0025;

cl=5;
qmf=MakeONFilter('Symmlet',6);

randn('seed',888888);

genFS=18;
textFS=22;
xval=150;
yvalSingleLine=1.1;
yvalDoubleLine=1.05;

a=zeros(1,80);
b=ones(1,50);
c=[0:0.02:1];
c=1-c;
d=zeros(1,75);
e=[a b c d];
length(e);
fprintf('length of e = %d\n',length(e));
plot(e)
axis([0 260 -0.2 1.2])
h=gca;
set(h,'FontSize',genFS);
text(xval,yvalSingleLine,'Original test signal','FontSize',textFS);
print -deps spin_orig

theMean=0;
en=e + sqrt(theVar)*randn(size(e)) + theMean;
figure, plot(en)
axis([0 260 -0.2 1.2])
h=gca;
set(h,'FontSize',genFS);
text(xval,yvalSingleLine,'Noisy test signal','FontSize',textFS);
print -deps spin_noisy

fwt = FWT_PO(en,cl,qmf);
t_fwt = HardThresh(fwt,th);
ifwt=IWT_PO(t_fwt,cl,qmf);
figure, plot(ifwt)
axis([0 260 -0.2 1.2])
h=gca;
set(h,'FontSize',genFS);
str1=sprintf('Hard thresholded\nonly');
text(xval,yvalDoubleLine,str1,'FontSize',textFS);
print -deps spin_fwt

enStore=zeros(prod(size(en)),size(en,2));
for i=1:length(en),
	enShift=shiftForwardByX(en,i-1);
	%enShift=filterSoft(enShift,cl,qmf,th);
	enShift=filterHard(enShift,cl,qmf,th);
	enShift=shiftBackByX(enShift,i-1);
	enStore(i,:)=enShift;
	fprintf('shifting %d\n',i);
end; clear i;
averaged=sum(enStore) / length(en); 
figure, plot(averaged)
axis([0 260 -0.2 1.2])
h=gca;
set(h,'FontSize',genFS);
str1=sprintf('Cycle spun with\nhard thresholding');
text(xval,yvalDoubleLine,str1,'FontSize',textFS);
print -deps spin_spun

%----------------------------------------------------------%
function iwt=filterSoft(row,cl,qmf,th);
wt=FWT_PO(row,cl,qmf);
twt=SoftThresh(wt,th);
iwt=IWT_PO(twt,cl,qmf);

%----------------------------------------------------------%
function iwt=filterHard(row,cl,qmf,th);
wt=FWT_PO(row,cl,qmf);
twt=HardThresh(wt,th);
iwt=IWT_PO(twt,cl,qmf);

%----------------------------------------------------------%
function new=shiftForwardByX(row,X);
new=zeros(size(row));
new(X+1:length(row))=row(1:length(row)-X);
new(1:X)=row(length(row)-X+1:length(row));

%----------------------------------------------------------%
function new=shiftBackByX(row,X);
new=zeros(size(row));
new=shiftForwardByX(row,length(row)-X);


