%������sample:��ʶ����Ʒ����
%����ֵ��y:��ʶ����Ʒ�������
%�������ܣ����ռн����Ҿ��뷨���������Ʒ����Ʒ���е���Ʒ���ƶ�
function y=anglecos(sample);
clc;
load templet pattern;
d=0;%����
dmax=[-inf,0];
for i=1:10
    for j=1:patter(i).num
        %���������Ʒ����Ʒ����Ʒ������Ҽн�
        d=(patter(i).feature(:,j)'*sample')/(sqrt(sum(patter(i).feature(:,j).^2))*sqrt(sum(sample.^2)));
        %�����нǼ������
        if dmax(1)<d
            dmax(1)=d;
            dmax(2)=i-1;
        end
    end
end
%������
y=dmax(2);