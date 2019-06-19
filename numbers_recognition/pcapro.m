function [y1,y2]=pcapro(sample,num1,num2,N)
%�������ƣ�pcapro����
%���룺           sample   ��ʶ����Ʒ����
%                 num1     ѡ���������
%                 num2     ���������ֵĵڼ����汾
%                 N        ���͵��µ�ά��
%����ֵ��         y1       ��Ʒ�⾭�����ɷַ����������������
%                y2        ��ʶ����Ʒ�����ɷַ����������������
%�������ܣ�       ����Ʒ��ʹ�����Ʒ�����ɷַ��������н�ά
%%%%%
[Dim,NumberofSample]=size(sample);
One=uint8(ones(1,size(sample,2)));
meanvalue=uint8(mean(sample,2));

character=sample-uint8(single(meanvalue)*single(One));
L=single(character)'*single(character);
[s_vector,s_matric]=eig(L);
s_vector=single(character)*single(s_vector);       %��������
s_vector=s_vector(:,end:-1:end-(N-1));             %��ά,ѡȡ����N����������
% y1=s_vector
%%%%%%% Calculating the signature for each image
num_character=zeros(size(sample,2),N)       %������һ���վ���ÿһ�д���һ���汾���ֵ�����

% num_character=zeros(50,N)       %������һ���վ���ÿһ�д���һ���汾���ֵ�����
for i=1:size(sample,2);
% for i=1:50;
    num_character(i,:)=single(character(:,i))'*s_vector;    % Each row in cv is the signature for one image. ÿһ�ж�Ӧһ��ͼ������
end
y1=num_character;
%%%%%%%�򿪴��������ͼƬ
cd('test');
% target=imread(strcat('num',strcat(num2str(num1),strcat('_',num2str(num2)))));
target=imread(strcat(strcat('num',strcat(num2str(num1),strcat('_',num2str(num2)))),'.bmp'));
target=rgb2gray(target);
figure;
imshow(target);
target1(:,1)=reshape(target,size(sample,1),1);
cd ..

%%%%%%%%%�Դ����ͼƬ���д���
t_character=target1-meanvalue;
t_vector=single(t_character)'*s_vector;
y2=t_vector;




% p=r-m;                              % Subtract the mean  ��ѡ�е�ͼƬr��ȥƽ��ͼ��
% s=single(p)'*V;
% z=[];
% for i=1:size(v,2)
%     z=[z,norm(cv(i,:)-s,2)];
% %     if(rem(i,20)==0),imshow(reshape(v(:,i),112,92)),end;
% %     drawnow;
% end
% 
% [a,i]=min(z);
% subplot(122);
% imshow(reshape(v(:,i),112,92));title('Found!','FontWeight','bold','Fontsize',16,'color','red');