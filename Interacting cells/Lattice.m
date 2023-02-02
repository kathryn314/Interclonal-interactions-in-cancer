for v = 1:1000000000
    if A == zeros(10,10), break,
    elseif A == ones(10,10), break,
    else
    
P = ones(10,10);

wrap = @(x,N) (1 + mod(x-1,N));
N = 10;

for i = 1:10
for j = 1:10
    if A(i,j)==1
        P(i,wrap(j+1,N)) = P(i,wrap(j+1,N))+ b;
        P(i,wrap(j-1,N)) = P(i,wrap(j-1,N))+ b;
        P(wrap(i+1,N),j) = P(wrap(i+1,N),j)+ b;
        P(wrap(i-1,N),j) = P(wrap(i-1,N),j)+ b;
        P(i,j) = P(i,j)- 4*c;  
    end;
end
end        
        
f = randi([1 10]);
g = randi([1 10]);

% Picking a random element of the matrix to die

B = [A(wrap(f-1,N),g), A(f,wrap(g+1,N)), A(wrap(f+1,N),g), A(f,wrap(g-1,N))];

% Forming the row vector of neighbouring points anticlockwise from top

C = [P(wrap(f-1,N),g), P(f,wrap(g+1,N)), P(wrap(f+1,N),g), P(f,wrap(g-1,N))];

C = C/sum(C,'all');

% Row vector giving the probability that A(e,f) is replaced by the
% value of this neighbouring cell

CP = [0, cumsum(C)];

r = rand;
index = find(r>CP, 1, 'last');

indB = B(index);

A(f,g) = indB; 

% Replacing dead cell by neighbour value according to probability

    end
end

% If A = zeros(10,10) then the mutant cell died out
% If A = ones(10,10) then the mutant cell took over the tissue

if A == zeros(10,10)
    G = G + v;
    Normal = Normal + 1;
    
% disp('Generation N:') 
% disp(v)
     
else
    H = H +v;
    Mutant = Mutant + 1;
    
%disp('Generation M:') 
% disp(v)
      
end