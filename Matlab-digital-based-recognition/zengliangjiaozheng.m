%������sample:��ʶ����Ʒ����
%����ֵ��y:��ʶ����Ʒ�������
%�������ܣ�����У���㷨
function y=zengliangjiaozheng(sample);
clc;
load temple pattern;
w=zero(26,10);%��ʼ��Ȩֵ
d=[];
maxpos=0;
maxval=0;
r=[];
flag=1;
num1=0;
num2=0;
f=1;
n=[];m=[];
while flag
    flag=0;
    num2=num2+1;
    for j=1:20
        for i=1:10
            num1=num1+1;
            %��ʼ������r,��ǰ���r(i)Ϊ1
            r=[0 0 0 0 0 0 0 0 0 0];
            r(i)=1;
            f=1;
            pattern(i).feature(26,j)=1;%ĩλ��Ϊ1
            for k=1:10
                m=pattern(i).feature(:,j);
                d(k)=w(:,k)'*m;
            end
            %�ж��Ƿ�Ϊ���ֵ��������flagΪ1
            for k=1:10
                if k~=i
                    if d(i)<=d(k)
                        flag=1;
                    end 
                end
            end
            %У��Ȩֵ
            for k=1:10
                if r(k)>d(k)
                    w(:,k)=w(:,k)+pattern(i).feature(:,j)/num1;
                else
                    w(:,k)=w(:,k)-pattern(i).feature(:,j)/num1;
                end
            end
        end
    end
    if num2>400
        flag=0;
    end
end
sample(26)=1;
h=[];
%�����б���
for k=1:10
    h(k)=w(:,k)'*sample';
end
[maxval,maxpos]=max(h);
y=maxpos-1;