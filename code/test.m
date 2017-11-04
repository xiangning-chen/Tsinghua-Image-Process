function f = test(img, shape, dir)

% input:
% img: metric, input image
% shape: int, test shape
% dir: string, how to transform metric C
% output:
% f: metric, DCT transformation of swiched C

img = img(1:shape, 1:shape);
imwrite(img, 'original.jpg');

img = double(img);

C = dct2(img);

% [C, D] = My_DCT(img);
[H, W] = size(C);

if strcmp(dir, 'right_zero')
    C = [C(:,1:end-4), zeros(H,4)];
elseif strcmp(dir, 'left_zero')
    C = [zeros(H,4), C(:,5:end)];
elseif strcmp(dir, 'transpose')
    C = C';
elseif strcmp(dir, 'rot90')
    C = rot90(C);
elseif strcmp(dir, 'rot180')
    C = rot90(C, 2);
end

% C_zero = D*img*D';
f = idct2(C);
f = uint8(f);
imwrite(f, [dir,'.jpg']);
end