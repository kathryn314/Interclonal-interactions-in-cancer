for i = 1:1000000000
    if A == zeros(10,10), break,
    elseif A == ones(10,10), break,
    else

e = randi([1 10]);
f = randi([1 10]);

% Picking a random element of the matrix to die

wrap = @(x,N) (1 + mod(x-1,N));
N = 10;

B = [A(wrap(e-1,10),f), A(e,wrap(f+1,10)), A(wrap(e+1,10),f), A(e,wrap(f-1,10))];

% Forming the row vector of neighbouring points anticlockwise from top
        
C(B==1)= (1+s);
C(B==0)= 1;

C = C/sum(C,'all');

% Row vector giving the probability that A(e,f) is replaced by the
% value of this neighbouring cell

CP = [0, cumsum(C)];

r = rand;
index = find(r>CP, 1, 'last');

indB = B(index);

A(e,f) = indB; 

% Replacing dead cell by neighbour value according to probability

    end

end

% If A = zeros(10,10) then the mutant cell died out
% If A = ones(10,10) then the mutant cell took over the tissue

if A == zeros(10,10);
    G = G + i;
    Normal = Normal + 1;
    
% disp('Generation N:'); 
% disp(i);

else
    H = H + i;
    Mutant = Mutant + 1;
    
% disp('Generation M:'); 
% disp(i);

end