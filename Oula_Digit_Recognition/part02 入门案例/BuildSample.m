% 建立书写数字样本
% 从“手写样本”文件夹中读取图片，提取特征，并保存到到pattern.mat文件中
%
% YangZhao 20161220

clear all; clc;

% 计算样本特征
folder = '手写样本';
nClass = 10;
nSamples = zeros(nClass,1);
for iter = 1: nClass
    nSamples(iter,1) = 10;
end

for i = 1:nClass       % 第0到9类
    for j = 1: nSamples(i)
        str = [folder '\' num2str(i-1) '\' num2str(i-1) '-' num2str(j) '.bmp'];
        tmpI = imread(str);
        pattern(i).feature(:,j) = GetFeature(tmpI,5,5);
        pattern(i).label = i;
    end   
end
disp('样本特征提取完毕。');

save('pattern.mat','pattern');

return ;
