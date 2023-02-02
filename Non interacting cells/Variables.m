s = q*0.01;

% We have defined the difference in fitness value of the mutant cell and
% regular cell
        
A = zeros(10,10);

% 10x10 zero matrix denoting collection of normal cells in a tissue

c = randi([1 10]);
d = randi([1 10]);

% Picking a random element of the matrix to mutate

A(c,d)= 1;

% Mutant cell denoted by '1'


