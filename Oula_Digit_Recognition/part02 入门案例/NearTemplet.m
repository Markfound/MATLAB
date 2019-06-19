function [ yLabel ] = NearTemplet( strSample, curFea )
%NearTemplet 使用模板匹配法进行分类
%   输入：
%       strSample：为样本数据集的路径
%       curFea:    当前待分类的特征
%   输出：
%       yLabel:    分类结果

load('pattern.mat','pattern');
nClass = length(pattern);
for iter = 1:nClass
    [~,tmpCol] = size(pattern(iter).feature);%只取列数
    nSamples(iter) = tmpCol;
end

dis = 0;%距离变量
min = [inf,0];
for i = 1:nClass
    for j = 1: nSamples(i)
        samfea = pattern(i).feature(:,j);
        dis = sum((samfea-curFea).^2);%欧式距离
        if dis<min(1)
            min(1) = dis;
            min(2) = i;
        end
    end
end

yLabel= min(2);

end

