%���������ĵ�ŷ�Ͼ��뷨����
%�������ƣ�euclid()
%������sample:��ʶ����Ʒ����
%����ֵ��y:��ʶ����Ʒ�������
%�������ܣ�����ŷ����¾����㷨���������Ʒ����Ʒ���е���Ʒ���ƶ�
function y=euclid(sample);
clc;
load templet pattern;%������Ʒ��
d=0;%����
p=[];%�����Ĵ����
dmin=[inf,0];
%��������ֵ��
for i=1:10
    temp=mean(pattern(i).feature');
    p(:,i)=temp';
end
for i=1:10
    %���������Ʒ���������ŷ����¾���
    d=(sample'-p(:,i))'*(sample'-p(:,i));
    %����С���뼰�����
    if dmin(1)>d
        dmin(1)=d;
        dmin(2)=i-1;
    end 
end
%������
y=dmin(2);