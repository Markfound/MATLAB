function [ feature ] = GetFeature( Img,m,n)
%GetFeature Summary of this function goes here
%   对手写数字提取25维特征
%   搜索有笔画区域，对区域进行划分5*5，计算每个区域黑色像素做占的比例
%   按列形成一个25维的向量
% Input: Img：输入图像
%        m,n: 将图像划分为m行，n列
% Output：输出25维的向量特征

Img = rgb2gray(Img);
[row,col] = find(Img == 0);
top = min(row); bottom = max(row); % 找出上下边界
left = min(col); right = max(col); % 找出左右边界


yStep = floor((bottom-top)/m);  % 行步进 向下取整
xStep = floor((right-left)/n);  % 列步进

Ifeatures = zeros(m,n);  %划分
for i = 1:m        % 行
    for j = 1:n    % 列
        block = Img(top+(i-1)*yStep : top+i*yStep , left+(j-1)*xStep : left+j*xStep);
        nPixel = numel(block);
        tmpFeature = sum(sum(block))/(nPixel*255);
        feature = 1-tmpFeature;
        Ifeatures(i,j) = feature;
    end
end

feature = reshape(Ifeatures, m*n ,1);
end

