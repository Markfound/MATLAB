% ������д��������
% �ӡ���д�������ļ����ж�ȡͼƬ����ȡ�����������浽��pattern.mat�ļ���
%
% YangZhao 20161220

clear all; clc;

% ������������
folder = '��д����';
nClass = 10;
nSamples = zeros(nClass,1);
for iter = 1: nClass
    nSamples(iter,1) = 10;
end

for i = 1:nClass       % ��0��9��
    for j = 1: nSamples(i)
        str = [folder '\' num2str(i-1) '\' num2str(i-1) '-' num2str(j) '.bmp'];
        tmpI = imread(str);
        pattern(i).feature(:,j) = GetFeature(tmpI,5,5);
        pattern(i).label = i;
    end   
end
disp('����������ȡ��ϡ�');

save('pattern.mat','pattern');

return ;
