clc;
clear all;
close all;

pat=[1.1 1.7 1.8; 0 0 0; 0 0.5 1.5; 1 0 0; 0.5 0.5 0.5; 1 1 1];
w=[0.2 0.7 0.3;0.1 0.1 0.9;1 1 1];
n=0.5;
epochs=100;
[r1 c1]=size(pat);
[r2 c2]=size(w);
for k=1:epochs
    for i=1:r1
        for j=1:r2
            ud(j)=sum((pat(i,:)-w(j,:)).^2);
            %%md(j)=sum(abs(pat(i,:)-w(j,:)));
        end;
        index=find(ud==min(ud));
        %%index=find(md==min(md));
        
        w(index,:)=w(index,:)+ n*(pat(i,:)-w(index,:));
        
        cluster(i)=index;
    end;
end;
w
display([pat  cluster']);

    