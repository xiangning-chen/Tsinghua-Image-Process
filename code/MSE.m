function f = MSE(x, y)
% compute MSE of matrix x and y
[H, W] = size(x);
f = sum(sum((x - y).^2)) / H / W;
end