clear all;
clc;
nClass=10;
nSamples=[5923 6742 5958 6131 5842 5421 5918 6265 5851 5949];
load('PrimaryData.mat');
for i=1:nClass
    Pattern(i).label=i-1;
    Mat_Tem=PrimaryData.Train(i).Data;
    for j=1:nSamples(i)
    %Src_Img=imread(Pos);
    Src_Img=reshape(Mat_Tem(j,:),28,28,1);
    Src_Img=Src_Img';
    One_Features=Get_Features(Src_Img,5,5);
    One_Features=reshape(One_Features,1,25,1);
    Pattern(i).Data(:,j)=One_Features;
    end
end
save('Pattern_Data.mat','Pattern');
clear all;
clc;

