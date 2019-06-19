function [ Label ] = NeuralNetworkRecognition(Img)
clc;
load('Coefficient.mat');      %加载数据库
Src_Features=Get_Features(Img,5,5);  %对源图片进行特征处理
Minn=inf;
Label=0; 
Src_Features=reshape(Src_Features,1,25,1);
Net{1}=Src_Features;
Net{2}=1./(1+exp(-1*(Net{1}*Coefficient{1}+Coefficient{3})));
Net{3}=1./(1+exp(-1*(Net{2}*Coefficient{2}+Coefficient{4})));
[Tem Label]=max(Net{3});
Label=Label -1;
end
