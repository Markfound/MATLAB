
clc;
for k=1:10
    PrimaryData.Test(k).Label=k-1;
    %[x y]=size(test0);
    eval(['PrimaryData.Test(k).Data=test',num2str(k-1),';']);
    PrimaryData.Test(k).Data=im2double(PrimaryData.Test(k).Data);
    %PrimaryData.Test(k).Data=PrimaryData.Test(k).Data./255.0;
    PrimaryData.Test(k).Data=im2bw(PrimaryData.Test(k).Data,0.03);
    PrimaryData.Test(k).Data=PrimaryData.Test(k).Data.*(-1);
    PrimaryData.Test(k).Data=PrimaryData.Test(k).Data+1;
    PrimaryData.Test(k).Data=PrimaryData.Test(k).Data.*255;
end
for k=1:10
    PrimaryData.Train(k).Label=k-1;
    %[x y]=size(test0);
    eval(['PrimaryData.Train(k).Data=train',num2str(k-1),';']);
    %PrimaryData.Train(k).Data=PrimaryData.Train(k).Data./255;
    PrimaryData.Train(k).Data=im2double(PrimaryData.Train(k).Data);
    PrimaryData.Train(k).Data=im2bw(PrimaryData.Train(k).Data,0.03);
    PrimaryData.Train(k).Data=PrimaryData.Train(k).Data.*(-1);
    PrimaryData.Train(k).Data=PrimaryData.Train(k).Data+1;
    PrimaryData.Train(k).Data=PrimaryData.Train(k).Data.*255;
end
save('PrimaryData.mat','PrimaryData');