%基于类中心的欧氏距离法分类
%函数名称：euclid()
%参数：sample:待识别样品特征
%返回值：y:待识别样品所属类别
%函数功能：按照欧几里德距离算法计算待测样品与样品库中的样品相似度
function y=euclid(sample);
clc;
load templet pattern;%加载样品库
d=0;%距离
p=[];%各类别的代表点
dmin=[inf,0];
%求各类别中值点
for i=1:10
    temp=mean(pattern(i).feature');
    p(:,i)=temp';
end
for i=1:10
    %计算待测样品库样本间的欧几里德距离
    d=(sample'-p(:,i))'*(sample'-p(:,i));
    %求最小距离及其类号
    if dmin(1)>d
        dmin(1)=d;
        dmin(2)=i-1;
    end 
end
%输出类别
y=dmin(2);