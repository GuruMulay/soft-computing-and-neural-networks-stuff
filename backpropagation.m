clc;
clear all;
close all;

eta=1.2;
x=[0.5 -0.5;-0.5 0.5];
t=[0.9 0.1;0.1 0.9];

b1=0.1;
b2=-0.02;
b3=0.37;
b4=0.27;

w11=0.37;
w12=-0.22;
w21=0.9;
w22=-0.22;

v11=0.1;
v12=0.3;
v21=-0.2;
v22=0.55;

for z=1:71000
for i=1:2;
    j=1;
    
    n=x(i,j)*v11+x(i,j+1)*v21+b1;
    oh1=1/(1+exp(-n));
    
    n=x(i,j)*v12+x(i,j+1)*v22+b2;
    oh2=1/(1+exp(-n));
    
    n=oh1*w11+oh2*w21+b3;
    oo1=1/(1+exp(-n));
    
    n=oh1*w12+oh2*w22+b4;
    oo2=1/(1+exp(-n));
    
    e1=t(i,j)-oo1;
    e2=t(i,j+1)-oo2;
    
    dk1=e1*oo1*(1-oo1);
    dk2=e2*oo2*(1-oo2);
    
    din1=dk1*w11+dk2*w12;
    din2=dk1*w21+dk2*w22;
    
    dj1=din1*oh1*(1-oh1);
    dj2=din2*oh2*(1-oh2);
    
    b3=b3+eta*dk1;
    b4=b4+eta*dk2;
    
    b1=b1+eta*dj1;
    b2=b2+eta*dj2;
    
    w11=w11+eta*dk1*oh1;
    w12=w12+eta*dk2*oh1;
    w21=w21+eta*dk1*oh2;
    w22=w22+eta*dk2*oh2;
    
    
    v11=v11+eta*dj1*x(i,1);
    v12=v12+eta*dj2*x(i,1);
    v21=v21+eta*dj1*x(i,2);
    v22=v22+eta*dj2*x(i,2);
end;
end;


for i=1:2;
    j=1;
    
    n=x(i,j).*v11+x(i,j+1).*v21+b1;
    oh1=1/(1+exp(-n));
    
    n=x(i,j).*v12+x(i,j+1).*v22+b2;
    oh2=1/(1+exp(-n));
    
    n=oh1.*w11+oh2.*w21+b3;
    oo1=1/(1+exp(-n))
    
    n=oh1.*w12+oh2.*w22+b4;
    oo2=1/(1+exp(-n))
end;


    
    
  
    
    
    
    
   