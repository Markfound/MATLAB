%参数：sample:待识别样品特征
%返回值：y:待识别样品所属类别
%函数功能：按照夹角余弦距离法计算待测样品与样品库中的样品相似度
function y=anglecos(sample);
clc;
load templet pattern;
d=0;%距离
dmax=[-inf,0];
for i=1:10
    for j=1:patter(i).num
        %计算待测样品与样品库样品间的余弦夹角
        d=(patter(i).feature(:,j)'*sample')/(sqrt(sum(patter(i).feature(:,j).^2))*sqrt(sum(sample.^2)));
        %求最大夹角及其类号
        if dmax(1)<d
            dmax(1)=d;
            dmax(2)=i-1;
        end
    end
end
%输出类别
y=dmax(2);