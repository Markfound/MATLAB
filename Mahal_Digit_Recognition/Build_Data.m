clear all;
clc;
nClass=10;
nSamples=10;
Pos_Front='Samples/';
for i=1:nClass
    Pattern(i).label=i-1;
    for j=1:nSamples
    Pos_Behind=strcat(num2str(i-1),'/',num2str(i-1),'-',num2str(j),'.bmp');
    Pos=strcat(Pos_Front,Pos_Behind);
    Src_Img=imread(Pos);
    One_Features=Get_Features(Src_Img,5,5);
    One_Features=reshape(One_Features,1,25,1);
    Pattern(i).Data(:,j)=One_Features;
    end
end
save('Pattern_Data.mat','Pattern');
clear all;
clc;

