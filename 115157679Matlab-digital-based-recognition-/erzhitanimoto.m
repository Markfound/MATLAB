%������sample:��ʶ����Ʒ����
%����ֵ��y:��ʶ����Ʒ�������
%�������ܣ����ն�ֵ��Tanimoto���뷨���������Ʒ����Ʒ���е���Ʒ���ƶ�
function y=erzhitanimoto(sample);
clc;
load templet pattern;
%����Ʒ���ж�ֵ��
for i=1:25
    if sample(i)>0.05
        sample(i)=1;
    else 
        sample(i)=0;
    end
end
for i=1:10
    for j=1:pattern(i).num
        for k=1:25
            if pattern(i).feature(k,j)>0.05
                pattern(i).feature(k,j)=1;
            else
                pattern(i)feature(k,j)=0;
            end
        end
    end
end
d=0;%����
dmax=[-inf,0];
for i=1:10
    for j=1:pattern(i).num
        %���������Ʒ����Ʒ����Ʒ���Tanimoto����
        d=(pattern(i).feature(:,j)'*sample')/(pattern(i).feature(:,j)'*...
            pattern(i).feature(:,j)+sample*sample'-pattern(i).feature(:,j)'*sample');
        %�������뼰�����
        if dmax(i)<d
            dmax(1)=d;
            dmax(2)=i-1;
        end
    end
end
%������
y=dmax(2);