function [ yLabel ] = NearTemplet( strSample, curFea )
%NearTemplet ʹ��ģ��ƥ�䷨���з���
%   ���룺
%       strSample��Ϊ�������ݼ���·��
%       curFea:    ��ǰ�����������
%   �����
%       yLabel:    ������

load('pattern.mat','pattern');
nClass = length(pattern);
for iter = 1:nClass
    [~,tmpCol] = size(pattern(iter).feature);%ֻȡ����
    nSamples(iter) = tmpCol;
end

dis = 0;%�������
min = [inf,0];
for i = 1:nClass
    for j = 1: nSamples(i)
        samfea = pattern(i).feature(:,j);
        dis = sum((samfea-curFea).^2);%ŷʽ����
        if dis<min(1)
            min(1) = dis;
            min(2) = i;
        end
    end
end

yLabel= min(2);

end

