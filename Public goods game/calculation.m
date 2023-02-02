
        
    
run Fitness.m;

f = randi([1 10]);
g = randi([1 10]);

% Picking a random element of the matrix to die

B = [A(wrap(f-1,N),g), A(f,wrap(g+1,N)), A(wrap(f+1,N),g), A(f,wrap(g-1,N))];

% Forming the row vector of neighbouring points anticlockwise from top

C = [F(wrap(f-1,N),g), F(f,wrap(g+1,N)), F(wrap(f+1,N),g), F(f,wrap(g-1,N))];

C = C/sum(C,'all');

% Row vector giving the probability that A(e,f) is replaced by the
% value of this neighbouring cell

CP = [0, cumsum(C)];

r = rand;
index = find(r>CP, 1, 'last');

indB = B(index);

A(f,g) = indB 

% Replacing dead cell by neighbour value according to probability
