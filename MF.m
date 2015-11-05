clc;
clear all;

sel=input('1.TRI 2.TRA 3.GA 4.B 5.S---> ');

switch sel
    case 1
        a=input('a');
        b=input('b');
        c=input('c');
        for x=1:1:100
            if(x<=a)
                op(x)=0;
            else if(x>a && x<=b)
                    op(x)=(x-a)/(b-a);
                else if (x>b && x<=c)
                        op(x)=(c-x)/(c-b);
                    else if (x>c)
                            op(x)=0;
                        end
                    end
                end
            end
        end
        
        y=1:1:100;
        plot(y,op);
        
    case 2
        a=input('a');
        b=input('b');
        c=input('c');
        d=input('d');
        for x=1:1:100
            if(x<=a)
                op(x)=0;
            else if(x>a && x<=b)
                    op(x)=(x-a)/(b-a);
                else if (x>b && x<=c)
                        op(x)=1;
                    else if (x>c && x<=d)
                            op(x)=(d-x)/(d-c);                      
                        else if (x>d)
                                op(x)=0;
                            end
                        end
                    end
                end
            end
        end
        
        y=1:1:100;
        plot(y,op);
        
    case 3
        c=input('c');
        s=input('sigma');
        for x=1:1:100
            t=(x-c)/s;
            op(x)=exp((-0.5)*(t)^2);
        end
        y=1:1:100;
        plot(y,op);
        
    case 4
        a=input('a');
        b=input('b');
        c=input('c');
        
        for x=1:1:100
            t=(abs((x-c)/a))^(2*b);
            op(x)=1/(1+t);
        end
        y=1:1:100;
        plot(y,op);
        
    case 5
        a=input('a');
        c=input('c');
        for x=1:1:100
            t=exp((-a)*(x-c));
            op(x)=1/(1+t);
        end
        y=1:1:100;
        plot(y,op);
end