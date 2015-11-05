clc;
clear all;
close all;

ip=[0 0; 0 1; 1 0; 1 1];
t=[0 0 0 1];

net=newp([0 1;0 1],1);
net.IW{1,1}=[0.2 0.3];
net.b{1}=1;

net=train(net,ip',t);
o=sim(net,ip');
display([ip o']);