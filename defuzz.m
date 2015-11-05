clc;
clear all;
close all;

p1=[0 1 4 5];
p2=[3 4 6 7];
p3=[5 6 7 8];

x=0:0.1:10;
y1=0.3*trapmf(x,p1);
subplot(4,1,1)
plot(x,y1)
xlabel('trapmf, P=[0 1 4 5]')

y2=0.5*trapmf(x,p2);
subplot(4,1,2)
plot(x,y2)
xlabel('trapmf, P=[3 4 6 7]')

y3=trapmf(x,p3);
subplot(4,1,3)
plot(x,y3)
xlabel('trapmf, P=[5 6 7 8]')

y=max(max(y1,y2),y3);
subplot(4,1,4)
plot(x,y)

dfuzz_centroid=sum(y.*x)/sum(y)

defuzz_wt_avg=(mean(p1)*0.3+mean(p2)*0.5+ mean(p3))/sum(0.3+0.5+1)

maximum=max(y);
index=find(y==maximum);
len=length(index);

dfuzz_first_max=x(index(1))

dfuzz_last_max=x(index(len))

dfuzz_mean_max=(x(index(1))+x(index(len)))/2







