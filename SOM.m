clc;
clear all;
close all;

pat=[1.1 1.7 1.8; 0 0 0; 0 0.5 1.5; 1 0 0; 0.5 0.5 0.5; 1 1 1];
w=[0.2 0.7 0.3;0.1 0.1 0.9;1 1 1];
[r1 c1]=size(pat);
[r2 c2]=size(w);
t=6;
n(1:t)=0.5;
n(t+1)=0.1;
D(1:t)=1;
D(t+1)=0;
epochs=100;
topology=[2 1 3];

l=1;
for k=1:epochs
    for i=1:r1
        for j=1:r2
            ud(j)=sum((pat(i,:)-w(j,:)).^2);
        end;
        winner=find(ud==min(ud));
        index=find(topology==winner);
       
        
        lm=index-D(l);
        hm=index+D(l);
        
        if lm<1
            lm=1;
        end;
        
        if hm>length(topology)
           hm=length(topology);
        end;
       
        update=topology(lm:hm);

        for j=update
             w(j,:)=w(j,:)+ n(l)*(pat(i,:)-w(j,:));
        end;
        l=l+1;
        if l>6
            l=7;
        end;
            cluster(i)=winner;
         end;
end;

w
display([pat  cluster']);

    