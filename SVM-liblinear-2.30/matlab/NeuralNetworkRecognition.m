function [ Label ] = NeuralNetworkRecognition(Img)
clc;
load('Coefficient.mat');      %�������ݿ�
Src_Features=Get_Features(Img,5,5);  %��ԴͼƬ������������
Minn=inf;
Label=0; 
Src_Features=reshape(Src_Features,1,25,1);
Net{1}=Src_Features;
Net{2}=1./(1+exp(-1*(Net{1}*Coefficient{1}+Coefficient{3})));
Net{3}=1./(1+exp(-1*(Net{2}*Coefficient{2}+Coefficient{4})));
[Tem Label]=max(Net{3});
Label=Label -1;
end
