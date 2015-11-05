clc;
clear all;
close all;

x=1:0.1:100;

young=gbellmf(x,[30,3,0]);
subplot(3,2,1);
plot(x,young);
title('YOUNG MF');

old=gbellmf(x,[30,3,100]);
subplot(3,2,2);
plot(x,old);
title('OLD MF');

subplot(3,2,3);
plot(x,old);
hold on;
plot(x,young);
hold off;
title('BOTH');


molo=old.^0.5;
subplot(3,2,4);
plot(x,molo);
title('MORE or LESS OLD MF');

nyno=min((1-young),(1-old));
subplot(3,2,5);
plot(x,nyno);
title('NOT YOUNG NOT OLD MF');

ybnty=min(young,(1-(young.^2)));
subplot(3,2,6);
plot(ybnty);
title('YOUNG BUT NOT TOO YOUNG MF');

figure(2);
l=0:0.1:10;
m=trimf(l,[2 4 6])
plot(l,m);
hold on;

for j=1:10
    for i=1:101
        if m(i)>0  && m(i)<=0.5
            m(i)=2*(m(i)).^2
        elseif m(i)>0.5  && m(i)<=1
            m(i)=1-2*(1-m(i)).^2
        end;
    end;
    plot(l,m);
end;


