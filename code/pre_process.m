function [f, nH, nW]  = pre_process(img_test, stride, sideH, sideW)

[H, W, C] = size(img_test);
H_mul = ceil((H-sideH)/stride)*stride+sideH;
W_mul = ceil((W-sideW)/stride)*stride+sideW;

for i = H+1:H_mul
    img_test(i,:,:) = img_test(H,:,:);
end
for i = W+1:W_mul
    img_test(:,i,:) = img_test(:,W,:);
end
f = img_test;
nH = (H_mul - sideH) / stride + 1;
nW = (W_mul - sideW) / stride + 1;
end
