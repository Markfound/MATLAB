clear all;
clc;
nClass=10;
nSamples=10;
SamplesPath='/Users/markfound/Documents/Program/MATLAB/NeuralNetworkNumRecognition/Samples/'; %图片路径
for i=1:nClass
    for j=1:nSamples
        Pattern.Label((i-1)*nSamples+j,:)=zeros(1,10);
        Pattern.Label((i-1)*nSamples+j,i)=1;
        Pos=strcat(SamplesPath,num2str(i-1),'/',num2str(i-1),'-',num2str(j),'.bmp'); %图片路径
        Src_Img=imread(Pos);
        One_Features=Get_Features(Src_Img,5,5);  %5*5提取特征
        One_Features=reshape(One_Features,1,25,1);   %reshape成1*25的行向量
        Pattern.Data((i-1)*nSamples+j,:)=One_Features;
    end
end
save('Pattern_Data.mat','Pattern');  %保存作为比对数据库
clear all;
clc;
close all;

