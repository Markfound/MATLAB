function [] = Kmeans(n , m ,PointNum)
%n:������ ��    m���������� ��    PointNum���ܵ���/3
clc;
%normrnd(MU,SIGMA,m,n)
%�������������̬�ֲ��㼯
Point_fir.x=normrnd(1,.3,[1,PointNum]);
Point_fir.y=normrnd(1,.3,[1,PointNum]);
Point_sec.x=normrnd(1,.9,[1,PointNum]);
Point_sec.y=normrnd(1,.9,[1,PointNum]);
Point_th.x=normrnd(1,.6,[1,PointNum]);
Point_th.y=normrnd(1,.6,[1,PointNum]);

AllPoint.x=[Point_fir.x Point_sec.x Point_th.x];
AllPoint.y=[Point_fir.y Point_sec.y Point_th.y];

subplot(121);
plot(AllPoint.x,AllPoint.y,'r.');
xlabel('Kmeans����ǰ');
%����������ĵ�
Tot_num=3*PointNum;
rand('seed',AllPoint.x(1));
Center_Point=[];
for i=1:n
    Center_Point.x(i)=rand(1,1);
    Center_Point.y(i)=rand(1,1);
end
%plot(Center_Point.x,Center_Point.y,'b.');
%��ʼ����
Cnt=[];
Class_Point=[];
for i=1:m   %m�ε���
    Class_Point=[];  %�����ĵ㼯
    for j=1:n
        Cnt(j)=0;   %ͳ��ÿ���ĸ�������Ϊ0������������ĵ�
    end
    for j=1:Tot_num  %�������е�
        Minn=inf;   %�ҵ���С����
        id=1;
        for k=1:n
            Dis=(Center_Point.x(k)-AllPoint.x(j))*(Center_Point.x(k)-AllPoint.x(j))+(Center_Point.y(k)-AllPoint.y(j))*(Center_Point.y(k)-AllPoint.y(j));
            if Dis<Minn
                Minn=Dis;
                id=k;   %��¼��С�����Ӧ�����ĵ�
            
            end
        end
        Cnt(id)=Cnt(id)+1;
        Class_Point.x(id,Cnt(id))=AllPoint.x(j);
        Class_Point.y(id,Cnt(id))=AllPoint.y(j);
    end
    [x y]=size(find(Cnt==0)); 
    if y==0  %�����༯�϶���Ϊ�գ��ƶ����ĵ�
        for j=1:n
            Center_Point.x(j)=sum(Class_Point.x(j,:))/Cnt(j);
            Center_Point.y(j)=sum(Class_Point.y(j,:))/Cnt(j);
        end
    else   %��������������ĵ�
        for ii=1:n
            Center_Point.x(ii)=rand(1,1);
            Center_Point.y(ii)=rand(1,1);
        end
        i=i-1;
    end
end

subplot(122);
color=[0 0 0.5; 0.5 0 0;0 0.5 0;1 0.5 0.5; 0.5 1 0.5;1 0 0; 0.5 0.5 1;1 1 0;0 1 1;1 0 1;0 1 0;0 0 1;0.5 1 1;1 1 0.5;1 0.5 1];
for i=1:n
    plot(Class_Point.x(i,:),Class_Point.y(i,:),'.','color',color(i,:));
 %   scatter(Class_Point.x(i,:),Class_Point.y(i,:),'filled','cdata',color);
    hold on;
end
for i=1:n
    plot(Center_Point.x(1,i),Center_Point.y(1,i),'.','color',color(n-i+2,:),'markersize',20);
    hold on;
end
xlabel('Kmeans�����');