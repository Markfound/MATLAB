function [ feature ] = GetFeature( Img,m,n)
%GetFeature Summary of this function goes here
%   ����д������ȡ25ά����
%   �����бʻ����򣬶�������л���5*5������ÿ�������ɫ������ռ�ı���
%   �����γ�һ��25ά������
% Input: Img������ͼ��
%        m,n: ��ͼ�񻮷�Ϊm�У�n��
% Output�����25ά����������

Img = rgb2gray(Img);
[row,col] = find(Img == 0);
top = min(row); bottom = max(row); % �ҳ����±߽�
left = min(col); right = max(col); % �ҳ����ұ߽�


yStep = floor((bottom-top)/m);  % �в��� ����ȡ��
xStep = floor((right-left)/n);  % �в���

Ifeatures = zeros(m,n);  %����
for i = 1:m        % ��
    for j = 1:n    % ��
        block = Img(top+(i-1)*yStep : top+i*yStep , left+(j-1)*xStep : left+j*xStep);
        nPixel = numel(block);
        tmpFeature = sum(sum(block))/(nPixel*255);
        feature = 1-tmpFeature;
        Ifeatures(i,j) = feature;
    end
end

feature = reshape(Ifeatures, m*n ,1);
end

