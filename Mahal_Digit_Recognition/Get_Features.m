function [ Num_Features ] = Get_Features( Src_Img , n , m )


Src_Img=rgb2gray(Src_Img);
%��ñ߽�
[Y,X]=find(Src_Img==0);
Top=min(Y);
Buttom=max(Y);
Left=min(X);
Right=max(X);
%ÿ�����ӵĳ���
X_Step=floor((Right-Left)/m);
Y_Step=floor((Buttom-Top)/n);
for i=1:n
    for j=1:m
        Block = Src_Img(Top+(i-1)*Y_Step : Top+i*Y_Step , Left+(j-1)*X_Step : Left+j*X_Step);
        Features=sum(sum(Block))/255/numel(Block);
        Num_Features(i,j)=1-Features;
    end
end

end


 