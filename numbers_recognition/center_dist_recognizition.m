clear all;
clc;
sample=load_numbers;                           %sample������ͼƬ�����ݣ�ÿһ��Ϊһ������

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

[center_class,test_num]=center_dist_pro(sample,evalResponse1,evalResponse2);
d=[];
center_class=uint8(center_class);
% test_num=double(test_num);
for i=1:10
    d=[d,single((test_num-center_class(:,i)))'*single((test_num-center_class(:,i)))];
end
[a,i]=min(d);
i=i-1;
display(strcat('��֤����Ϊ',num2str(i)));
    