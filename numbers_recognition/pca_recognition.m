clear all;
clc;
sample=load_numbers;

evalResponse1 = input('��ѡȡ��д���֣�����0��9��  ');
while evalResponse1>9 || evalResponse1<0
    display('�������ݲ�������������д ');
    evalResponse1 = input('��ѡȡ��д���֣�����0��9��  ');
end
display(strcat('��ȷ������',num2str(evalResponse1)));



evalResponse2 = input('ѡȡ�����ֵĵڼ��汾��������1��3��  ');
while evalResponse2>3 || evalResponse2<1
    display('�������ݲ�������������д');
    evalResponse2 = input('ѡȡ�����ֵĵڼ��汾��������1��3��  ');
end
display(strcat('��ȷ�ϸ����ְ汾',num2str(evalResponse2)));

[y1,y2]=pcapro(sample,evalResponse1,evalResponse2,30);
n=size(sample,2);
y1=single(y1);
d=[];
for loop=1:n
%     d[loop,1]=sqrt(sum((y2-y1(loop,:)).^2));
    d=[d,norm(y1(loop,:)-y2,2)];
end
[a,i]=min(d);
if i>=1 && i<=5
    display('��֤����Ϊ0');
    mode1=0;
elseif i>=6 && i<=10
    display('��֤����Ϊ1');
    mode1=1;
elseif i>=11 &&i<=15
    display('��֤����Ϊ2');
    mode1=2;
elseif i>=16 &&i<=20
    display('��֤����Ϊ3');
    mode1=3;
elseif i>=21 &&i<=25
    display('��֤����Ϊ4');
    mode1=4;
elseif i>=26 &&i<=30
    display('��֤����Ϊ5');
    mode1=5;
elseif i>=31 &&i<=35
    display('��֤����Ϊ6');
    mode1=6;
elseif i>=36 &&i<=40
    display('��֤����Ϊ7');
    mode1=7;
elseif i>=41 &&i<=45
    display('��֤����Ϊ8');
    mode1=8;
elseif i>=46 &&i<=50
    display('��֤����Ϊ9');
    mode1=9;
end
mode2=rem(i,5);               %������
if mode2==0
    mode2=5;
end
cd('train'); 
figure;
seek=imread(strcat( strcat('num',strcat(num2str(mode1),strcat('_',num2str(mode2)))),'.jpg'));
cd ..
imshow(seek);





