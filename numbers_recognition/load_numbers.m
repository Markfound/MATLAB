function out=load_numbers()
% We load the database the first time we run the program.

persistent loaded;                           %�൱�ھ�̬����������ֵ��Ȼ�������ڴ浱��
persistent w;
if(isempty(loaded))
    v=zeros(2500,50);
    cd('train');
    for i=1:10
        for j=1:5
            a=imread(strcat( strcat('num',strcat(num2str(i-1),strcat('_',num2str(j)))),'.jpg'));
            a=rgb2gray(a);
            v(:,(i-1)*5+j)=reshape(a,2500,1);            %%������a����״�ı䣬����Ԫ�ظ�������
        end
    end
    cd ..
    w=uint8(v); % Convert to unsigned 8 bit numbers to save memory. 
end
loaded=1;  % Set 'loaded' to aviod loading the database again. 
out=w