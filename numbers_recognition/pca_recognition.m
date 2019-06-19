clear all;
clc;
sample=load_numbers;

evalResponse1 = input('请选取手写数字（输入0至9）  ');
while evalResponse1>9 || evalResponse1<0
    display('输入数据不合理，请重新填写 ');
    evalResponse1 = input('请选取手写数字（输入0至9）  ');
end
display(strcat('已确认数字',num2str(evalResponse1)));



evalResponse2 = input('选取该数字的第几版本？（输入1至3）  ');
while evalResponse2>3 || evalResponse2<1
    display('输入数据不合理，请重新填写');
    evalResponse2 = input('选取该数字的第几版本？（输入1至3）  ');
end
display(strcat('已确认该数字版本',num2str(evalResponse2)));

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
    display('认证数字为0');
    mode1=0;
elseif i>=6 && i<=10
    display('认证数字为1');
    mode1=1;
elseif i>=11 &&i<=15
    display('认证数字为2');
    mode1=2;
elseif i>=16 &&i<=20
    display('认证数字为3');
    mode1=3;
elseif i>=21 &&i<=25
    display('认证数字为4');
    mode1=4;
elseif i>=26 &&i<=30
    display('认证数字为5');
    mode1=5;
elseif i>=31 &&i<=35
    display('认证数字为6');
    mode1=6;
elseif i>=36 &&i<=40
    display('认证数字为7');
    mode1=7;
elseif i>=41 &&i<=45
    display('认证数字为8');
    mode1=8;
elseif i>=46 &&i<=50
    display('认证数字为9');
    mode1=9;
end
mode2=rem(i,5);               %求余数
if mode2==0
    mode2=5;
end
cd('train'); 
figure;
seek=imread(strcat( strcat('num',strcat(num2str(mode1),strcat('_',num2str(mode2)))),'.jpg'));
cd ..
imshow(seek);





