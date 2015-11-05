%YASH ABOOJ %
% B.E. E&TC I ROLL NO. 30024 %
% Simple Competitive Learning %

clc;
clear all;
close all;

pattern = [1.1 1.7 1.8;0 0 0;0 0.5 1.5;1 0 0;0.5 0.5 0.5;1 1 1];% Inputs
W = [0.2 0.7 0.3;0.1 0.1 0.9;1 1 1];    % Initial Weight Matrix
eta = 0.5;                              % Learning Rate
epochs = 100;                           % Number of Epochs
[row1 column1] = size(pattern);
[row2 column2] = size(W);

for k = 1:epochs
    for i = 1:row1
        for j = 1:row2
            % Calculating Squared Euclidean Distances
            euclidean_dist(j) = sum((W(j,:) - pattern(i,:)) .^ 2);
%             manhattan(j) = sum(abs(W(j,:) - pattern(i,:)));
        end
        % Determining the Winner
        index = find(euclidean_dist == min(euclidean_dist));
%         index = find(manhattan == min(manhattan));
        % Weight Updation
        delta_W = eta * (pattern(i,:) - W(index(1),:));
        W(index(1),:) = W(index(1),:) + delta_W;
        % Assigning the Clusters to Input Patterns
        cluster(i) = index(1);
    end
end

disp('Final Weight Matrix: ');
disp(W);
disp('          Input Pattern          Cluster');
disp([pattern cluster.']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

OUTPUT

Final Weight Matrix: 
    0.5714    0.2857    0.2857
    0.0000    0.5000    1.5000
    1.0333    1.2333    1.2667

          Input Pattern          Cluster
    1.1000    1.7000    1.8000    3.0000
         0         0         0    1.0000
         0    0.5000    1.5000    2.0000
    1.0000         0         0    1.0000
    0.5000    0.5000    0.5000    1.0000
    1.0000    1.0000    1.0000    3.0000