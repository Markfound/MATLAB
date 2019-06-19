function [ Result ] = Oula_Dis( Img , n, m, nClass, nSamples)
%Imgԭͼ�ֳ�n*m��һ��nClass�࣬ÿ��nSamples��
load('Pattern_Data.mat');      %�������ݿ�
Src_Features=Get_Features(Img,n,m);  %��ԴͼƬ������������
Minn=inf;
Label=0; 
for i=1:nClass
    for j=1:nSamples
        d=sum(sum((reshape(Pattern(i).Data(:,j),n,m,1)-Src_Features).^2));  %ŷ�Ͼ���
        if d<Minn  %����ԽС��ʾԽ����
            Minn=d;
            Label=Pattern(i).label;
        end
    end
end
Result=Label;
end