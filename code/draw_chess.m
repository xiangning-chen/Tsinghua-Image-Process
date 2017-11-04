function f = draw_chess(img, H_dim, W_dim)

% input:
% img: [Nan,Nan,3] metric
% H_dim: #chess in H axis
% W_dim: #chess in W axix 
% output:
% f: [Nan,Nan,3] metric

img = double(img);
[H, W, C] = size(img);
[x, y] = meshgrid(0:W-1, 0:H-1);

H_dim = fix(H / H_dim);
W_dim = fix(W / W_dim);

img_red = img(:,:,1);
img_green = img(:,:,2);
img_blue = img(:,:,3);

chess = (mod(fix(x/H_dim), 2) == mod(fix(y/W_dim), 2));
img_red(chess) = 0;
img_green(chess) = 0;
img_blue(chess) = 0;

f = zeros(H, W, C);
f(:,:,1) = img_red;
f(:,:,2) = img_green;
f(:,:,3) = img_blue;
f = uint8(f);

end