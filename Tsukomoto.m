clc;
clear all;

x0=input('x0');
y0=input('y0');

x=0.1:0.1:100;
for i=1:1000
    a1(i)=(log10(x(i))/2);
end
subplot(3,2,1);
plot(a1);

x=.1:.1:100;
for i=1:1000
    b1(i)=1-(log10(x(i))/2);
end
subplot(3,2,3);
plot(b1);


x=.1:.1:100;
for i=1:1000
    if (x(i)<600)
        c1(i)=x(i)/60;
    else
        c1(i)=1;
    end
end
subplot(3,2,5);
plot(c1);

x=.1:.1:100;
for i=1:1000
    if (x(i)<750)
        a2(i)=x(i)/75;
    else
        a2(i)=1;
    end
end
subplot(3,2,2);
plot(a2);

x=.1:.1:100;
for i=1:1000
    b2(i)=(log10(x(i)))/2;
    b2(i)=b2(i)^2;
end
subplot(3,2,4);
plot(b2);


x=.1:.1:100;
for i=1:1000
    c2(i)=(log10(x(i)))/2;
    c2(i)=c2(i)^.8;
end
subplot(3,2,6);
plot(c2);

ax1=a1(x0*10)
bx1=b1(y0*10)
ax2=a2(x0*10)
bx2=b2(y0*10)

al1=min(ax1,bx1)
al2=min(ax2,bx2)

z1=floor(al1*60);
z2=floor(10^(2*(al2^(1/.8))));

Z=(al1*z1+al2*z2)/(al1+al2)