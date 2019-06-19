%参数：sample:待识别样品特征
%返回值：y:待识别样品所属类别
%函数功能：按照马氏距离算法计算待测样品与样品库中的样品相似度
function y=mahalanobis(sample);
clc;
load temple pattern;%加载样品库
pdata=[];
c=0;
%求协方差矩阵
for i=1:10;
    for j=1:pattern(i).num
        c=c+1;
        pdata(:,c)=pattern(i).feature(:,j);
    end
end
%求特征间的协方差矩阵及其逆矩阵
s_cov=cov(pdata');
s_inv=inv(s_cov);
d=0;%距离
p=[];%各类别的代表点
dmin=[inf,0];
%求各类别中值点
for i=1:10
    temp=mean(pattern(i).feature');
    p(:,i)=temp';
end
for i=1:10
    %计算待测样品与样品库样品间的马氏距离
    d=(sample'-p(:,i))'*s_inv*(sample'-p(:,i));
    %求最小距离及其类号
    if dmin(1)>d
        dmin(1)=d;
        dmin(2)=i-1;
    end
end
%输出类别
y=dmin(2);