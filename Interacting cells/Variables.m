c = 0.01;
b = 0.04;

% We have assigned values to the cost and benefit for cooperation
        
A = zeros(10,10);

% 10x10 zero matrix denoting collection of defector cells in a tissue

d = randi([1 10]);
e = randi([1 10]);

% Picking a random element of the matrix to become a cooperator

A(d,e)= 1;

% Cooperator denoted by '1'