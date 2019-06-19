clear all;
clc;
sample=load_numbers;                           %sample是所有图片的数据，每一列为一个数字

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

[center_class,test_num]=center_dist_pro(sample,evalResponse1,evalResponse2);
d=[];
center_class=uint8(center_class);
% test_num=double(test_num);
for i=1:10
    d=[d,single((test_num-center_class(:,i)))'*single((test_num-center_class(:,i)))];
end
[a,i]=min(d);
i=i-1;
display(strcat('认证数字为',num2str(i)));
    