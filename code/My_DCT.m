function [f, D] = My_DCT(P)

% input: metric
% output: DCT transfromation of P

P = double(P);
N = size(P, 1);

[x, y] = meshgrid(1:2:2*N-1, 0:N-1);

D = sqrt(2/N) * cos(x.*y*pi/2/N);
D(1,:) = ones(1,N) * sqrt(1/N);

f = D*P*D';

end