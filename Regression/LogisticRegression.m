function [ output_args ] = LogisticRegression ( input_args )
%LOGISTICREGRESSION  此处显示有关此函数的摘要
%   此处显示详细说明

pass=[62 73;71 84;62 65;73 65;78 79;74 82;70 90;75 72;73 74;55 80;50 95;55 85;
    66 76;56 76;88 97;90 98;100 100;69 78;56 100;89 87;93 57;48 66;65 76;53 96;96 58;];  %25
unpass=[0 0;23 43;54 23;12 43;45 33;63 42;34 66;23 67;34 23;65 22;43 12;32 45;
    23 65;54 55;56 59;46 43;23 55;11 24;34 51;51 23;77 12;22 72;12 73;68 44;43 66;]; %25
yLabel=[ones(1,25) zeros(1,25)]';
plot(pass(:,1),pass(:,2),'r*');
hold on;
plot(unpass(:,1),unpass(:,2),'b*');
hold on;
One=ones(25,1);
pass(:,3)=One;   %25*3
unpass(:,3)=One;  %25*3
Data=[pass;unpass];  %50*3
%梯度下降法
Sita=(rand(1,3)*100);   %1*3
Sigma=rand(1)*10;   
eps=1e-8;
pre=[inf inf inf];  %1*3
while((Sita-pre)*(Sita-pre)'>eps) %距离与设置的精度进行比较
    pre=Sita;
    for i=1:50
        H=1/(1+exp(-1*Data(i,:)*Sita'));
        HLabel(i,:)=H;
    end
    Sita=Sita-(Sigma*Data'*(HLabel-yLabel))';
end
%Sita(1)*x+Sita(2)*y+Sita(3)=0
x=[0:100];
y=(Sita(1)*x+Sita(3))/(-Sita(2));
plot(x,y,'LineWidth',2);


