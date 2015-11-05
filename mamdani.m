clc;
clear all;
close all;

figure(1)
x=10:0.1:90;
t1=trimf(x,[10 10 25]) ;
t2=trimf(x,[15 30 45]) ;
t3=trimf(x,[40 50 60]) ;
t4=trimf(x,[55 70 85]) ;
t5=trimf(x,[75 90 90]) ;
plot(x,t1,x,t2,x,t3,x,t4,x,t5);
tz1=trimf(22.5,[15 30 45]) 
tz2=trimf(22.5,[10 10 25]) 

figure(2)
x=1:0.1:5;
p1=trimf(x,[1 1 1.75]) ;
p2=trimf(x,[1.25 2 2.75]) ;
p3=trimf(x,[2.25 3 3.75]) ;
p4=trimf(x,[3.25  4 4.75]) ;
p5=trimf(x,[4.25 5 5]) ;
plot(x,p1,x,p2,x,p3,x,p4,x,p5);
pz1=trimf(1.5,[1.25 2 2.75]) 
pz2=trimf(1.5,[1 1 1.75]) 

figure(3)
x=1:0.1:6;
hp1=trimf(x,[1 1 1.5]) ;
hp2=trimf(x,[1.25 2 2.75]) ;
hp3=trimf(x,[2.5 3 3.75]) ;
hp4=trimf(x,[3.5 4 4.5]) ;
hp5=trimf(x,[4.25 5 5]) ;
plot(x,hp1,x,hp2,x,hp3,x,hp4,x,hp5);

figure(4);
z1=min(tz1,pz1)
l1=z1*hp4;
plot(l1);

figure(5);
z2=min(tz2,pz2)
l2=z2*hp5;
plot(l2);


area1=0.5*(4.5-3.5)*(1);
area2=0.5*(5.75-4.25)*(1);

defuzzy=(z1*area1*4 + z2*area2*5)/(z1*area1+z2*area2)





