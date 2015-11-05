% YASH ABOOJ %
% B.E. E&TC I ROLL NO. 30024 %
% Defuzzification

clc;
clear all;
close all;

y = 0:0.1:10;
trap_mf = zeros;
for j = 1:3
    disp('Enter the Constant Values (0 to 10): ');
    a(j) = input('a = ');
    b(j) = input('b = ');
    c(j) = input('c = ');
    d(j) = input('d = ');
    amplitude(j) = input('Enter the Amplitude: ');
    % Generating the Trapezoidal Membership Functions
    for i=1:length(y)
        if (y(i) >= a(j) && y(i) < b(j))
            trap_mf(j,i) = (y(i) - a(j)) / (b(j) - a(j));
        elseif (y(i) >= b(j) && y(i) < c(j))
            trap_mf(j,i) = 1;
        elseif (y(i) >= c(j) && y(i) < d(j))
            trap_mf(j,i) = (d(j) - y(i)) / (d(j) - c(j));
        else
            trap_mf(j,i) = 0;
        end        
    end      
    trap_mf(j,:) = amplitude(j) * trap_mf(j,:);
end

figure;
subplot(3,1,1);
plot(y,trap_mf(1,:));
axis([0 10 0 1.5]);
xlabel('Input');
ylabel('Membership');
title('Trapezoidal Membership Function');
subplot(3,1,2);
plot(y,trap_mf(2,:));
axis([0 10 0 1.5]);
xlabel('Input');
ylabel('Membership');
title('Trapezoidal Membership Function');
subplot(3,1,3);
plot(y,trap_mf(3,:));
axis([0 10 0 1.5]);
xlabel('Input');
ylabel('Membership');
title('Trapezoidal Membership Function');

% Calculating the Fuzzy Output
fuzzy_output = max(trap_mf);
figure;
plot(y,fuzzy_output);
axis([0 10 0 1.5]);
xlabel('Input');
ylabel('Membership');
title('Fuzzified Output');

% Centroid Method
defuzz_centroid = sum(fuzzy_output .* y) / sum(fuzzy_output);
disp('Defuzzified Output by Centroid Method = ');
disp(defuzz_centroid);

% Weighted Average Method
centroid = (a + b + c + d) / 4;
defuzz_wt_avg = sum(centroid .* amplitude) / sum(amplitude);
disp('Defuzzified Output by Weighted Average Method = ');
disp(defuzz_wt_avg);

maximum = max(fuzzy_output);
index = find(fuzzy_output == maximum);
len = length(index);
% First of Max
defuzz_first_max = y(index(1));
% Last of Max
defuzz_last_max = y(index(len));
% Mean of Max
defuzz_mean_max = (y(index(1)) + y(index(len))) / 2;
disp('Defuzzified Output by First of Maximum Method = ');
disp(defuzz_first_max);
disp('Defuzzified Output by Last of Maximum Method = ');
disp(defuzz_last_max);
disp('Defuzzified Output by Mean of Maximum Method = ');
disp(defuzz_mean_max);

% Centroid of Area
centroid = zeros;
area = zeros;
k = 1;
temp = fuzzy_output;
% Obtain the First Area
n = 1;
while temp(n+1) == 0
    n = n+1;
end
while temp(n+1) ~= 0
    % Calculating the Area of a Triangle (increasing slope)
    if temp(n) < temp(n+1)
        t(1) = temp(n);
        ind(1) = y(n);
        while temp(n) < temp(n+1)
            n = n + 1;
        end
        t(2) = temp(n);
        ind(2) = y(n);
        % Calculating the Centroid
        if t(1) == 0
            centroid(k) = (ind(1) + 2 * ind(2)) / 3;
            area(k) = (1/2) * (ind(2) - ind(1)) * t(2);
            k = k + 1;
        else
            centroid(k) = (ind(1) + ind(2)) / 2;
            area(k) = (1/2) * (ind(2) - ind(1)) * (t(1) + t(2));
            k = k + 1;
        end
    % Calculating the Area of a Triangle (decreasing slope)
    elseif temp(n) > temp(n+1)
        t(1) = temp(n);
        ind(1) = y(n);
        while temp(n) > temp(n+1)
            n = n + 1;
        end
        t(2) = temp(n);
        ind(2) = y(n);
        % Calculating the Centroid
        if t(2) == 0
            centroid(k) = (2 * ind(1) + ind(2)) / 3;
            area(k) = (1/2) * (ind(2) - ind(1)) * t(1);
            k = k + 1;
        else
            centroid(k) = (ind(1) + ind(2)) / 2;
            area(k) = (1/2) * (ind(2) - ind(1)) * (t(1) + t(2));
            k = k + 1;
        end
    % Calculating the Area of a Rectangle    
    else
        t(1) = temp(n);
        ind(1) = y(n);
        while temp(n) == temp(n+1)
            n = n + 1;
        end
        t(2) = temp(n);
        ind(2) = y(n);
        centroid(k) = (ind(1) + ind(2)) / 2;
        area(k) = (1/2) * (ind(2) - ind(1)) * (t(1) + t(2));
        k = k + 1;
    end
end
defuzz_area_cent = sum(area .* centroid) / sum(area);
disp('Defuzzified Output by Centroid of Area Method = ');
disp(defuzz_area_cent);


OUTPUT

Enter the Constant Values (0 to 10): 
a = 0
b = 1
c = 4
d = 5
Enter the Amplitude: 0.3
Enter the Constant Values (0 to 10): 
a = 3
b = 4
c = 6
d = 7
Enter the Amplitude: 0.5
Enter the Constant Values (0 to 10): 
a = 5
b = 6
c = 7
d = 8
Enter the Amplitude: 1
Defuzzified Output by Centroid Method = 
    4.9530

Defuzzified Output by Weighted Average Method = 
    5.4167

Defuzzified Output by First of Maximum Method = 
     6

Defuzzified Output by Last of Maximum Method = 
     7

Defuzzified Output by Mean of Maximum Method = 
    6.5000

Defuzzified Output by Centroid of Area Method = 
    4.9457