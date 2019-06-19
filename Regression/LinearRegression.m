function [] = LinearRegression( n ) %n：随机生成的点数
%随机生成一组接近线性的数据
mu = [0 0];
SIGMA = [1 .99;.99 1];
p = mvnrnd(mu,SIGMA,n);
plot(p(:,1),p(:,2),'.');
hold on;
%梯度下降法
Sigmak=rand(1)*100;
Sigmab=rand(1)*100;
k=rand(1)*10;
b=rand(1)*10;
eps=1e-8;   %截止误差
prek=inf;
preb=inf;
preDk=rand(1);
preDb=rand(1);
while(1)
    Derk=sum((k*p(:,1)+b-p(:,2)).*p(:,1));  %对k求导
    Derb=sum((k*p(:,1)+b-p(:,2)));   %对b求导
    if(abs(prek-k)>eps)
        if(preDk*Derk<0)
            Sigmak=Sigmak/2;
        end
        prek=k;
        k=k-Sigmak*Derk;
    end
    if(abs(preb-b)>eps)
        if(preDb*Derb<0)
            Sigmab=Sigmab/2;
        end
        preb=b;
        b=b-Sigmab*Derb;
    end
    if(abs(prek-k)<=eps&&abs(preb-b)<=eps)
        break;
    end
    preDk=Derk;
    preDb=Derb;
end
x=min(p(:,1))-1:max(p(:,1))+1;
y=k*x+b;
plot(x,y,'r');
hold on;