function overshoot(th);
a=zeros(1,500);
b=ones(1,500);
c=[0:0.002:1];
c=1-c;
d=zeros(1,547);
e=[a b c d];
plot(e)
axis([0 2000 -0.2 1.2])

theMean=0;
theVar=0.0025;
en=e + sqrt(theVar)*randn(size(e)) + theMean;
figure, plot(en)
axis([0 2000 -0.2 1.2])

cl=4;
qmf=MakeONFilter('Symmlet',6);

fwt = FWT_PO(en,cl,qmf);
t_fwt = HardThresh(fwt,th);
ifwt=IWT_PO(t_fwt,cl,qmf);
figure, plot(ifwt)
axis([0 2000 -0.2 1.2])

enStore=zeros(prod(size(en)),size(en,2));
for i=1:length(en),
	enShift=shiftForwardByX(en,i-1);
	%enShift=filterSoft(enShift,cl,qmf,th);
	enShift=filterHard(enShift,cl,qmf,th);
	enShift=shiftBackByX(enShift,i-1);
	enStore(i,:)=enShift;
	fprintf('shifting: %d\n',i);
end; clear i;
averaged=sum(enStore) / length(en); 
figure, plot(averaged)
axis([0 2000 -0.2 1.2])

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


