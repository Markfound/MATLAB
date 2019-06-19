clc;
[x1 y1]=size(train9);
for i=1:x1
    for j=1:y1
        if train9(i,j)<50
            train9(i,j)=0;
        else
            train9(i,j)=255;
        end
    end
end
save('train9.mat','train9');