%������sample:��ʶ����Ʒ����
%����ֵ��y:��ʶ����Ʒ�������
%�������ܣ��������Ͼ����㷨���������Ʒ����Ʒ���е���Ʒ���ƶ�
function y=mahalanobis(sample);
clc;
load temple pattern;%������Ʒ��
pdata=[];
c=0;
%��Э�������
for i=1:10;
    for j=1:pattern(i).num
        c=c+1;
        pdata(:,c)=pattern(i).feature(:,j);
    end
end
%���������Э��������������
s_cov=cov(pdata');
s_inv=inv(s_cov);
d=0;%����
p=[];%�����Ĵ����
dmin=[inf,0];
%��������ֵ��
for i=1:10
    temp=mean(pattern(i).feature');
    p(:,i)=temp';
end
for i=1:10
    %���������Ʒ����Ʒ����Ʒ������Ͼ���
    d=(sample'-p(:,i))'*s_inv*(sample'-p(:,i));
    %����С���뼰�����
    if dmin(1)>d
        dmin(1)=d;
        dmin(2)=i-1;
    end
end
%������
y=dmin(2);