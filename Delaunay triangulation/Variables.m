P = rand(5,2);
P1 = zeros(5,2);

for v = 1:1000000000
    if P == P1, break,
    else 

P = sortrows(P);
P1 = P;

% DT = delaunayTriangulation(P)
% triplot(DT)

E = edges(DT);

A = zeros(size(E,1),2);
M = zeros(size(E,1),1);
U = zeros(size(E,1),2);
F = zeros(size(E,1),1);

L = 0.3;

for i=1:size(E,1);
A(i,:) = P(E(i,2),:)-P(E(i,1),:);
M(i) = sqrt((P(E(i,2),1)-P(E(i,1),1))^2+(P(E(i,2),2)-P(E(i,1),2))^2);
U(i,:) = A(i,:)/M(i);
end;

% A
% M
% U 

F = zeros(5,2);

for k=1:5

Y = [k];

[ia] = ismember(E(:,1),Y);
[ib] = ismember(E(:,2),Y);

Ma = [M(ia)-L];
Mb = [M(ib)-L];

Ma( Ma <= 0 ) = 0;
Mb( Mb <= 0) = 0;

iwant = [Ma.*U(ia,:) ; -Mb.*U(ib,:)];

R = sum(iwant',2);
F(k,:) = R';
end

F;

m = 0.5;

P = P + m.*F;

    end
end
