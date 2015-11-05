p=[0 0 1 1;0 1 0 1];
t=[0 1 1 0];
net=newff(p,t,2);
net.divideFcn = '';              
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 500;
net.trainParam.goal = 1e-100;
[net,tr]=train(net,p,t);
% Test the Network
a = sim(net,p);

disp('XOR Gate Implementation:');
disp('Input     Output');
disp([p.' a.']);
plot(p,t,p,a,'o');