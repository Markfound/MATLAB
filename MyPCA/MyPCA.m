function [] = MyPCA( n ) %n：随机生成的点数
%随机生成一组椭圆形数据
mu = [0 0];
SIGMA = [1 .8;.8 1];
p = mvnrnd(mu,SIGMA,n);
plot(p(:,1),p(:,2),'.');
hold on;
%去均值
ptem=p;
ptem(:,1)=ptem(:,1)-sum(ptem(:,1))/n;
ptem(:,2)=ptem(:,2)-sum(ptem(:,2))/n;
%求协方差矩阵
Mycov=cov(ptem(:,1),ptem(:,2));
%求出协方差矩阵的特征值和特征向量
[X,Y]=eig(Mycov);
%找出最远画图距离
maxn=-1;
for i=1:n
    dis=sqrt(p(i,1)*p(i,1)+p(i,2)*p(i,2));
    if(dis>maxn)
        maxn=dis;
    end
end
dis=sqrt(X(1,2)*X(1,2)+X(2,2)*X(2,2));
N=maxn/dis;
N=N+1;

quiver(0,0,X(1,1),X(2,1),'b');
hold on;
quiver(0,0,X(1,2),X(2,2),N,'r');
hold on;
plot([0,-N*X(1,2)],[0,-N*X(2,2)],'r');
%所有点进行投影
k=X(2,2)/X(1,2);
for i=1:n
    plot((p(i,1)+p(i,2)*k)/(k*k+1),(p(i,1)*k+p(i,2)*k*k)/(k*k+1),'r*');
end
hold on;
%所有原始数据降维
Myeig=X(:,2);
PCA_rev=p*Myeig;
xx=zeros(n);
plot(PCA_rev,xx,'b*');
end
