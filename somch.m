clc;
clear all;
close all;

% Generating the Input Patterns
T{1} = [zeros(3,9);ones(6,3) zeros(6,3) ones(6,3)];
T{2} = [zeros(3,3) ones(3,6);zeros(3,9);zeros(3,3) ones(3,6)];
T{3} = [ones(3,6) zeros(3,3);zeros(3,9);ones(3,6) zeros(3,3)];
T{4} = [ones(6,3) zeros(6,3) ones(6,3);zeros(3,9)];
L{1} = [zeros(6,3) ones(6,6);zeros(3,9)];
L{2} = [ones(6,6) zeros(6,3);zeros(3,9)];
L{3} = [zeros(3,9);ones(6,6) zeros(6,3)];
L{4} = [zeros(3,9);zeros(6,3) ones(6,6)];

figure;
subplot(2,4,1);
imshow(uint8(255 * T{1}));
title('T1');
subplot(2,4,2);
imshow(uint8(255 * T{2}));
title('T2');
subplot(2,4,3);
imshow(uint8(255 * T{3}));
title('T3');
subplot(2,4,4);
imshow(uint8(255 * T{4}));
title('T4');
subplot(2,4,5);
imshow(uint8(255 * L{1}));
title('L1');
subplot(2,4,6);
imshow(uint8(255 * L{2}));
title('L2');
subplot(2,4,7);
imshow(uint8(255 * L{3}));
title('L3');
subplot(2,4,8);
imshow(uint8(255 * L{4}));
title('L4');


for i=1:4
    temp1=T{i};
    temp2=L{i};
    
    char_T=[];
    char_L=[];
    
    for j=1:9
        char_T=[char_T  temp1(j,:)];
        char_L=[char_L  temp2(j,:)];
    end;
    
    pat(i,:)=char_T;
    pat(i+4,:)=char_L;
end;



[r1 c1]=size(pat);
w=rand(8,81,'double');
[r2 c2]=size(w);
t=8;
n(1:t)=0.5;
n(t+1)=0.1;
D(1:t)=1;
D(t+1)=0;
epochs=500;
topology=[1 2 3 4 5 6 7 8];

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
        if l>t
            l=t+1;
        end;
            cluster(i)=winner;
    end;
end;

cluster



    
        
    
    
    
    