clc;
clear all;

x=0:.1:100;
smallx=gbellmf(x,[50 4 0]);
subplot(3,1,1);
plot(x,smallx);
title('small');
largex=gbellmf(x,[50 4 100]);
subplot(3,1,2);
plot(x,largex);
title('large');
subplot(3,1,3);
plot(x,smallx,x,largex);

x=-2;
y=4;

z1=-x+y+1;
z2=-y+3;
z3=-x+3;
z4=x+y+2;

sx=1;
lx=.3;
sy=.1;
ly=.9;

a1=min(sx,sy)
a2=min(sx,ly)
a3=min(lx,sy)
a4=min(lx,ly)

Z=(z1*a1+z2*a2+z3*a3+z4*a4)/(a1+a2+a3+a4)