clear all;
clc;
nClass=10;
nSamples=10;
SamplesPath='/Users/markfound/Documents/MATLAB/Oula_Digit_Recognition/Alph_Samples/'; %ͼƬ·��
for i=1:nClass
    Pattern(i).label=i-1;
    for j=1:nSamples
        Pos=strcat(SamplesPath,num2str(i-1),'/',num2str(i-1),'-',num2str(j),'.bmp'); %ͼƬ·��
        Src_Img=imread(Pos);
        One_Features=Get_Features(Src_Img,5,5);  %5*5��ȡ����
        One_Features=reshape(One_Features,1,25,1);   %reshape��1*25��������
        Pattern(i).Data(:,j)=One_Features;
    end
end
save('Pattern_Data.mat','Pattern');  %������Ϊ�ȶ����ݿ�
clear all;
clc;
close all;

