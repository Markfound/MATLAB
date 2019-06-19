clc;
clear all;
load('Pattern_Data.mat');
global Pattern
Pos_Front='dataset/';
nSamples=[980 1135 1032 1010 982 892 958 1028 974 1009];
Tot=sum(nSamples);
Cnt=0;
for i=1:10
    Pos_Behind=strcat('test',num2str(i-1),'.mat');
    Pos=strcat(Pos_Front,Pos_Behind);
    load(Pos);
    name=strcat('test',num2str(i-1));
    Mat_Tem=[];
    eval(['Mat_Tem=test',num2str(i-1),';']);
    for j=1:nSamples(i)
        Src_Img=reshape(Mat_Tem(j,:),28,28,1);
        Src_Img=Src_Img';
        Label=Oula_Dis(Src_Img,5,5,10,nSamples(i));
        if(Label~=(i-1))
            Cnt=Cnt+1;
        end
    end
end
disp('正确率为：');
disp(1-Cnt/Tot);

