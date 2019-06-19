function [ Result ] = Oula_Dis( Img , n, m, nClass, nSamples)
%Img原图分成n*m格，一共nClass类，每类nSamples个
load('Pattern_Data.mat');      %加载数据库
Src_Features=Get_Features(Img,n,m);  %对源图片进行特征处理
Minn=inf;
Label=0; 
for i=1:nClass
    for j=1:nSamples
        d=sum(sum((reshape(Pattern(i).Data(:,j),n,m,1)-Src_Features).^2));  %欧氏距离
        if d<Minn  %距离越小表示越相似
            Minn=d;
            Label=Pattern(i).label;
        end
    end
end
Result=Label;
end