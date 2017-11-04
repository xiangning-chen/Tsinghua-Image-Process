function f = split_dct_quantize(P)

% input: 
% P: metric, input image
% output;
% f: [64, Nan] metric

load('JpegCoeff.mat');
P = double(P);
[H, W] = size(P);
% generate to multiple of 8
P(H+1:8*ceil(H/8),:) = repmat(P(H,:), 8*ceil(H/8)-H, 1);
P(:,W+1:8*ceil(W/8)) = repmat(P(:,W), 1, 8*ceil(W/8)-W);
[H,W] = size(P);

% QTAB = QTAB ./ 2;
f = [];
for i = 1:H/8
    for j = 1:W/8
        C = round(dct2(P((i-1)*8+1:i*8,(j-1)*8+1:j*8))./QTAB);
        f = [f, zigzag(C)'];
    end
end
end