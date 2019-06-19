function [ Result ] = Mahal_Dis( Img ,n,m,nClass,nSamples)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
clc;
load('Pattern_Data.mat');

Src_Features=Get_Features(Img,n,m);
Src_Features=reshape(Src_Features,n*m,1,1);

pData=[];
for i=1:nClass
    for j=i:nSamples
        pData(:,10*(i-1)+j)=Pattern(i).Data(:,j);
    end
end
%协方差矩阵
s_cov=cov(pData');
s_inv=inv(s_cov);

minn=inf;
d=0;
for i=1:nClass
    for j=1:nSamples
        d=(Src_Features-Pattern(i).Data(:,j))'*s_inv*(Src_Features-Pattern(i).Data(:,j));
        if(minn>d)
            minn=d;
            Result=Pattern(i).label;
        end
    end
end

end