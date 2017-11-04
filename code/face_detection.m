function f = face_detection(img_test, v, L, stride, sideH, sideW, error1, error2)

% input:
% img_test
% v: pretrained vector
% L: category of color
% stride
% sideH, sideW: size of scan region
% error1, error2
% output:
% f: img with faces marked

[sc, record] = scan(img_test, v, L, stride, sideH, sideW, error1);
imshow(sc);

m = merge(record, error2, sideH, sideW, 1);
m = merge(m, error2, sideH, sideW, 2);

f = plot_merge(img_test, m);
f = f(1:size(img_test,1),1:size(img_test,2), :);
figure, imshow(f);
end