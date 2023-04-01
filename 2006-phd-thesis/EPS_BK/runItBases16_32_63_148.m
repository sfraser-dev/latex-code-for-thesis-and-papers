function runItBases16_32_63_148();

%getML148JpgMatFilesAndThenPlot('bab','ml148jpgBab','Baboon');
%getML148JpgMatFilesAndThenPlot('fish','ml148jpgFish','Fishingboat');
%getML148JpgMatFilesAndThenPlot('len','ml148jpgLen','Lena');
%getML148JpgMatFilesAndThenPlot('pent','ml148jpgPent','Pentagon');
%getML148JpgMatFilesAndThenPlot('pep','ml148jpgPep','Peppers');

%getML63JpgMatFilesAndThenPlot('bab','ml63jpgBab','Baboon');
%getML63JpgMatFilesAndThenPlot('fish','ml63jpgFish','Fishingboat');
%getML63JpgMatFilesAndThenPlot('len','ml63jpgLen','Lena');
%getML63JpgMatFilesAndThenPlot('pent','ml63jpgPent','Pentagon');
%getML63JpgMatFilesAndThenPlot('pep','ml63jpgPep','Peppers');

%getML32JpgMatFilesAndThenPlot('bab','ml32jpgBab','Baboon');
%getML32JpgMatFilesAndThenPlot('fish','ml32jpgFish','Fishingboat');
%getML32JpgMatFilesAndThenPlot('len','ml32jpgLen','Lena');
%getML32JpgMatFilesAndThenPlot('pent','ml32jpgPent','Pentagon');
%getML32JpgMatFilesAndThenPlot('pep','ml32jpgPep','Peppers');

getStrongGausMatFilesAndThenPlot('bab','gausBab','Baboon');
getStrongGausMatFilesAndThenPlot('fish','gausFish','Fishingboat');
getStrongGausMatFilesAndThenPlot('len','gausLen','Lena');
getStrongGausMatFilesAndThenPlot('pent','gausPent','Pentagon');
getStrongGausMatFilesAndThenPlot('pep','gausPep','Peppers');

%getWeakGausMatFilesAndThenPlot('bab','gausBab','Baboon');
%getWeakGausMatFilesAndThenPlot('fish','gausFish','Fishingboat');
%getWeakGausMatFilesAndThenPlot('len','gausLen','Lena');
%getWeakGausMatFilesAndThenPlot('pent','gausPent','Pentagon');
%getWeakGausMatFilesAndThenPlot('pep','gausPep','Peppers');

%getJpgMatFilesAndThenPlot('bab','jpgBab','Baboon');
%getJpgMatFilesAndThenPlot('fish','jpgFish','Fishingboat');
%getJpgMatFilesAndThenPlot('len','jpgLen','Lena');
%getJpgMatFilesAndThenPlot('pent','jpgPent','Pentagon');
%getJpgMatFilesAndThenPlot('pep','jpgPep','Peppers');

%%%%%
function getML148JpgMatFilesAndThenPlot(imgHandleStr,theDirStr,nameStr)
%% Get mat files
theStr=sprintf('cd %s',theDirStr); eval(theStr); 

load BCH148_148_1_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%s148=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH457_148_85_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec457=decodedNCStoreAv;',imgHandleStr); eval(theStr);
load BCH457_148_85_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc457=encodedNCStoreAv;',imgHandleStr); eval(theStr);

cd ..
%% Plotting graphs
jpgQualStore=10:5:100;
xval=50; yval=-0.4;	% Location of text in figure
ax1=0; ax2=100; ax3=-0.5; ax4=1;	% Axis values for plots

figure,
theStr=sprintf('theVec=%s148;',imgHandleStr); eval(theStr);    
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(148,148,1):rep.=3',nameStr);
text(xval,yval,theStr);
theStr=sprintf('print -deps ml148%s148',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec457;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc457;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(457,148,85):rep.=0',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps ml148%s457',imgHandleStr); eval(theStr); 


%%%%%
function getML63JpgMatFilesAndThenPlot(imgHandleStr,theDirStr,nameStr)
%% Get mat files
theStr=sprintf('cd %s',theDirStr); eval(theStr); 

load BCH63_63_1_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%s63=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH147_63_23_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec147=decodedNCStoreAv;',imgHandleStr); eval(theStr);
load BCH147_63_23_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc147=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH453_63_117_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec453=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH453_63_117_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc453=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

cd ..
%% Plotting graphs
jpgQualStore=10:5:100;
xval=50; yval=-0.4;	% Location of text in figure
ax1=0; ax2=100; ax3=-0.5; ax4=1;	% Axis values for plots

figure,
theStr=sprintf('theVec=%s63;',imgHandleStr); eval(theStr);    
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(63,63,1):rep.=7',nameStr);
text(xval,yval,theStr);
theStr=sprintf('print -deps ml63%s63',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec147;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc147;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(147,63,23):rep.=3',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps ml63%s147',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec453;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc453;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(453,63,117):rep.=0',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps ml63%s453',imgHandleStr); eval(theStr); 



%%%%%
function getML32JpgMatFilesAndThenPlot(imgHandleStr,theDirStr,nameStr)
%% Get mat files
theStr=sprintf('cd %s',theDirStr); eval(theStr); 

load BCH32_32_1_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%s32=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH67_32_11_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec67=decodedNCStoreAv;',imgHandleStr); eval(theStr);
load BCH67_32_11_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc67=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH148_32_31_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec148=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH148_32_31_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc148=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

load BCH458_32_127_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec458=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH458_32_127_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc458=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

cd ..
%% Plotting graphs
jpgQualStore=10:5:100;
xval=50; yval=-0.4;	% Location of text in figure
ax1=0; ax2=100; ax3=-0.5; ax4=1;	% Axis values for plots

figure,
theStr=sprintf('theVec=%s32;',imgHandleStr); eval(theStr);    
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(32,32,1):rep.=15',nameStr);
text(xval,yval,theStr);
theStr=sprintf('print -deps ml32%s32',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec67;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc67;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(67,32,11):rep.=7',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps ml32%s67',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec148;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc148;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(148,32,31):rep.=3',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps ml32%s148',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec458;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc458;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(458,32,127):rep.=0',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps ml32%s458',imgHandleStr); eval(theStr); 

%%%%%
function getStrongGausMatFilesAndThenPlot(imgHandleStr,theDirStr,nameStr)
%% Get mat files
theStr=sprintf('cd %s',theDirStr); eval(theStr); 
load BCH16_16_1_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%s16=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH31_16_7_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec31=decodedNCStoreAv;',imgHandleStr); eval(theStr);
load BCH31_16_7_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc31=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH63_16_23_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec63=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH63_16_23_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc63=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

load BCH148_16_39_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec148=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH148_16_39_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc148=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

load BCH442_16_127_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec442=decodedNCStoreAv;',imgHandleStr); eval(theStr);  
load BCH442_16_127_its20_jpg6.000000e-03_2.000000e-03_2.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc442=encodedNCStoreAv;',imgHandleStr); eval(theStr);  
cd ..

%% Plotting graphs
gausQualStore=0.006:0.002:0.02;
xval=0.012; yval=-0.4;	% Location of text in figure
ax1=0.006; ax2=0.02; ax3=-0.5; ax4=1;	% Axis values for plots

figure,
theStr=sprintf('theVec=%s16;',imgHandleStr); eval(theStr);    
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(16,16,1):rep.=29',nameStr);
text(xval,yval,theStr);
theStr=sprintf('print -deps SG%s16',imgHandleStr); eval(theStr);

figure,
theStr=sprintf('theVec=%sDec31;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc31;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(31,16,7):rep.=15',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps SG%s31',imgHandleStr); eval(theStr);

figure,
theStr=sprintf('theVec=%sDec63;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc63;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(63,16,23):rep.=7',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps SG%s63',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec148;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc148;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(148,16,39):rep.=3',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps SG%s148',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec442;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc442;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(442,16,127):rep.=0',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps SG%s442',imgHandleStr); eval(theStr); 



%%%%%
function getWeakGausMatFilesAndThenPlot(imgHandleStr,theDirStr,nameStr)
%% Get mat files
theStr=sprintf('cd %s',theDirStr); eval(theStr); 
load BCH16_16_1_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%s16=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH31_16_7_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec31=decodedNCStoreAv;',imgHandleStr); eval(theStr);
load BCH31_16_7_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc31=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH63_16_23_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec63=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH63_16_23_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc63=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

load BCH148_16_39_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec148=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH148_16_39_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc148=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

load BCH442_16_127_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_decodedNCStoreAv.mat
theStr=sprintf('%sDec442=decodedNCStoreAv;',imgHandleStr); eval(theStr);  
load BCH442_16_127_its20_jpg1.000000e-03_1.000000e-03_1.000000e-02_encodedNCStoreAv.mat
theStr=sprintf('%sEnc442=encodedNCStoreAv;',imgHandleStr); eval(theStr);  
cd ..

%% Plotting graphs
gausQualStore=0.001:0.001:0.01;
xval=0.005; yval=-0.4;	% Location of text in figure
ax1=0.001; ax2=0.01; ax3=-0.5; ax4=1;	% Axis values for plots

figure,
theStr=sprintf('theVec=%s16;',imgHandleStr); eval(theStr);    
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(16,16,1):rep.=29',nameStr);
text(xval,yval,theStr);
theStr=sprintf('print -deps WG%s16',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec31;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc31;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(31,16,7):rep.=15',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps WG%s31',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec63;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc63;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(63,16,23):rep.=7',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps WG%s63',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec148;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc148;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(148,16,39):rep.=3',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps WG%s148',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec442;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc442;',imgHandleStr); eval(theStr);
plot(gausQualStore,theVec);
xlabel('Normalised Gaussian Variance'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(442,16,127):rep.=0',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps WG%s442',imgHandleStr); eval(theStr); 



%%%%%
function getJpgMatFilesAndThenPlot(imgHandleStr,theDirStr,nameStr)
%% Get mat files
theStr=sprintf('cd %s',theDirStr); eval(theStr); 
load BCH16_16_1_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%s16=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH31_16_7_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec31=decodedNCStoreAv;',imgHandleStr); eval(theStr);
load BCH31_16_7_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc31=encodedNCStoreAv;',imgHandleStr); eval(theStr);

load BCH63_16_23_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec63=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH63_16_23_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc63=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

load BCH148_16_39_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec148=decodedNCStoreAv;',imgHandleStr); eval(theStr); 
load BCH148_16_39_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc148=encodedNCStoreAv;',imgHandleStr); eval(theStr); 

load BCH442_16_127_its20_jpg10_5_100_decodedNCStoreAv.mat
theStr=sprintf('%sDec442=decodedNCStoreAv;',imgHandleStr); eval(theStr);  
load BCH442_16_127_its20_jpg10_5_100_encodedNCStoreAv.mat
theStr=sprintf('%sEnc442=encodedNCStoreAv;',imgHandleStr); eval(theStr);  
cd ..

%% Plotting graphs
jpgQualStore=10:5:100;
xval=50; yval=-0.4;	% Location of text in figure
ax1=0; ax2=100; ax3=-0.5; ax4=1;	% Axis values for plots

figure,
theStr=sprintf('theVec=%s16;',imgHandleStr); eval(theStr);    
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(16,16,1):rep.=29',nameStr);
text(xval,yval,theStr);
theStr=sprintf('print -deps JPG%s16',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec31;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc31;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(31,16,7):rep.=15',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps JPG%s31',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec63;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc63;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(63,16,23):rep.=7',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps JPG%s63',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec148;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc148;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(148,16,39):rep.=3',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps JPG%s148',imgHandleStr); eval(theStr); 

figure,
theStr=sprintf('theVec=%sDec442;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec,'--');
hold on;
theStr=sprintf('theVec=%sEnc442;',imgHandleStr); eval(theStr);
plot(jpgQualStore,theVec);
xlabel('JPEG Quality'); ylabel('Normalized Correlation');
axis([ax1 ax2 ax3 ax4]);
theStr=sprintf('%s: BCH(442,16,127):rep.=0',nameStr);
text(xval,yval,theStr);
hold off;
theStr=sprintf('print -deps JPG%s442',imgHandleStr); eval(theStr); 
