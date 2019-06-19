function [y1,y2]=pcapro(sample,num1,num2,N)
%函数名称：pcapro（）
%输入：           sample   待识别样品特征
%                 num1     选择检验数字
%                 num2     待检验数字的第几个版本
%                 N        降低的新的维度
%返回值：         y1       样品库经过主成分分析后的主分量矩阵
%                y2        待识别样品经主成分分析后的主分量向量
%函数功能：       对样品库和待测样品用主成分分析法进行降维
%%%%%
[Dim,NumberofSample]=size(sample);
One=uint8(ones(1,size(sample,2)));
meanvalue=uint8(mean(sample,2));

character=sample-uint8(single(meanvalue)*single(One));
L=single(character)'*single(character);
[s_vector,s_matric]=eig(L);
s_vector=single(character)*single(s_vector);       %特征向量
s_vector=s_vector(:,end:-1:end-(N-1));             %降维,选取其中N个特征向量
% y1=s_vector
%%%%%%% Calculating the signature for each image
num_character=zeros(size(sample,2),N)       %，建立一个空矩阵，每一行代表一个版本数字的特征

% num_character=zeros(50,N)       %，建立一个空矩阵，每一行代表一个版本数字的特征
for i=1:size(sample,2);
% for i=1:50;
    num_character(i,:)=single(character(:,i))'*s_vector;    % Each row in cv is the signature for one image. 每一行对应一幅图的特征
end
y1=num_character;
%%%%%%%打开待检测数字图片
cd('test');
% target=imread(strcat('num',strcat(num2str(num1),strcat('_',num2str(num2)))));
target=imread(strcat(strcat('num',strcat(num2str(num1),strcat('_',num2str(num2)))),'.bmp'));
target=rgb2gray(target);
figure;
imshow(target);
target1(:,1)=reshape(target,size(sample,1),1);
cd ..

%%%%%%%%%对待检测图片进行处理
t_character=target1-meanvalue;
t_vector=single(t_character)'*s_vector;
y2=t_vector;




% p=r-m;                              % Subtract the mean  用选中的图片r减去平均图像
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