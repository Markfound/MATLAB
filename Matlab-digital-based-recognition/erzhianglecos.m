%参数：sample:待识别样品特征
%返回值：y:待识别样品所属类别
%函数功能：按照二值化夹角余弦距离法计算待测样品与样品库中的样品相似度
function y=erzhianglecos(sample);
clc;
load templet pattern;
%对样品进行二值化
for i=1:25
    if sample(i)>0.05
        sample(i)=1;
    else
        sample(i)=0;
    end
end
for i=1:10
    for j=1:pattern(i).num
        for k=1:25
            if pattern(i).feature(k,j)>0.05
                pattern(i).feature(k,j)=1;
            else
                pattern(i).feature(k,j)=0;
            end
        end
    end
end
d=0;%距离
dmax=[-inf,0];
for i=1:10
    for j=1:pattern(i).num
        %计算待测样品与样品库间的夹角余弦
        d=(pattern(i).feature(:,j)'*sample')/(sqrt(sum(pattern(i).feature(:,j).^2))*sqrt(sum(sample.^2)));
        %求最大夹角及其类号
        if dmax(1)<d
            dmax(1)=d;
            dmax(2)=i-1;
        end
    end
end
%输出类别
y=dmax(2);