c = 0;
b = 0;
l = 3;

% We have assigned the value for the cost and benefit of cooperation, and
% the value of lambda (ratio of diffusion rate to the utilisation rate)

A = zeros(10,10);

% 10x10 zero matrix denoting collection of defector cells in a tissue

% d = randi([1 2]);
% e = randi([1 2]);

% Picking a random element of the matrix to become a cooperator

A(1,1)=1;

% A = eye(10);

% Cooperator denoted by '1'