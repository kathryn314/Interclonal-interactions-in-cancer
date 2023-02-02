T = A';
S = T(:);

P = zeros(10,10);

wrap = @(x,N) (1 + mod(x-1,N));
N = 10;

for i = 1:10
    P(wrap(i+1,N),i)=0.25;
    P(wrap(i-1,N),i)=0.25;
end;

M = ones(1,10);
B = 0.25*diag(M);

B1 = B;
B2 = [B,B];
B3 = [B,B,B];
B4 = [B,B,B,B];
B5 = [B,B,B,B,B];
B6 = [B,B,B,B,B,B];
B7 = [B,B,B,B,B,B,B];
B8 = [B,B,B,B,B,B,B,B];
B9 = [B,B,B,B,B,B,B,B,B];
 
E = [P,B9;B1,P,B8;B2,P,B7;B3,P,B6;B4,P,B5;B5,P,B4;B6,P,B3;B7,P,B2;B8,P,B1;B9,P];

Q = ones(1,100);

I= diag(Q);

R = (1+l)*I-l*E;

Psi = inv(R);

Psi = Psi * S;

Psi = Psi';

P = reshape(Psi,10,10);
 
F = ones(10,10) + b*P - c*A;