clear all;
clc;
load('Pattern_Data.mat');
Coefficient{1}=rand(25,100)-0.5;
Coefficient{2}=rand(100,10)-0.5;
Net{1}=zeros(1,25);
Net{2}=zeros(1,100);
Net{3}=zeros(1,10);
Bias{1}=rand(1,100)-0.5;
Bias{2}=rand(1,10)-0.5;
Sigma=0.1;
Indexes=randperm(100);
ytem=zeros(1,10);
for iter=1:500
    dis=0;
    for i=1:100
        Net{1}=Pattern.Data(Indexes(i),:);
        Net{2}=1./(1+exp(-1*(Net{1}*Coefficient{1}+Bias{1})));
        Net{3}=1./(1+exp(-1*(Net{2}*Coefficient{2}+Bias{2})));
        D{3}=-(Pattern.Label(Indexes(i),:)-Net{3}).*(Net{3}.*(1-Net{3}));
        D{2}=(Net{2}.*(1-Net{2})).*(D{3}*Coefficient{2}');
        Coefficient{1}=Coefficient{1}-Sigma*Net{1}'*D{2};
        Coefficient{2}=Coefficient{2}-Sigma*Net{2}'*D{3};
        Bias{1}=Bias{1}-Sigma*D{2};
        Bias{2}=Bias{2}-Sigma*D{3};
        dis=dis+sum((Net{3}-Pattern.Label(Indexes(i),:)).^2);
    end
    disp(dis);
end
Coefficient{3}=Bias{1};
Coefficient{4}=Bias{2};
save('Coefficient.mat','Coefficient');
