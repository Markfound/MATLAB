function [y1,y2]=center_dist_pro(sample,num1,num2)
%函数名称：center_dist_pro（）
%输入：           sample   待识别样品特征
%                 num1     选择检验数字
%                 num2     待检验数字的第几个版本
%                
%返回值：         y1        类中心（2500*10）
%                y2        选中的样品矩阵（2500*1的列矩阵）

center_class=zeros(2500,10);
for i=1:10
    for j=1:5
        center_class(:,i)=sample(:,(i-1)*5+j);
    end
end
center_class=center_class/5;     %计算得出10个类中心
y1=center_class;                 %将类中心值返回

cd('test');
target=imread(strcat(strcat('num',strcat(num2str(num1),strcat('_',num2str(num2)))),'.bmp'));
target=rgb2gray(target);
figure;
imshow(target);
target1(:,1)=reshape(target,size(sample,1),1);
cd ..
y2=target1;

        
