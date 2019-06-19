clear all;
clc;
nClass=10;
nSamples=10;
load('Coefficient.mat');
SamplesPath='/Users/markfound/Documents/Program/MATLAB/NeuralNetworkNumRecognition/Samples/'; %图片路径
flag=1;
for i=1:nClass
    for j=1:nSamples
        Pos=strcat(SamplesPath,num2str(i-1),'/',num2str(i-1),'-',num2str(j),'.bmp'); %图片路径
        Src_Img=imread(Pos);
        One_Features=Get_Features(Src_Img,5,5);  %5*5提取特征
        One_Features=reshape(One_Features,1,25,1);   %reshape成1*25的行向量
        Net{1}=One_Features;
Net{2}=1./(1+exp(-1*(Net{1}*Coefficient{1}+Coefficient{3})));
Net{3}=1./(1+exp(-1*(Net{2}*Coefficient{2}+Coefficient{4})));
[Tem Label]=max(Net{3});
if Label~=i
    disp('boom!');
end
    end
end
