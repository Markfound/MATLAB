function [y1,y2]=center_dist_pro(sample,num1,num2)
%�������ƣ�center_dist_pro����
%���룺           sample   ��ʶ����Ʒ����
%                 num1     ѡ���������
%                 num2     ���������ֵĵڼ����汾
%                
%����ֵ��         y1        �����ģ�2500*10��
%                y2        ѡ�е���Ʒ����2500*1���о���

center_class=zeros(2500,10);
for i=1:10
    for j=1:5
        center_class(:,i)=sample(:,(i-1)*5+j);
    end
end
center_class=center_class/5;     %����ó�10��������
y1=center_class;                 %��������ֵ����

cd('test');
target=imread(strcat(strcat('num',strcat(num2str(num1),strcat('_',num2str(num2)))),'.bmp'));
target=rgb2gray(target);
figure;
imshow(target);
target1(:,1)=reshape(target,size(sample,1),1);
cd ..
y2=target1;

        
