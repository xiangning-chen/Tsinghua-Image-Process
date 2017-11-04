function [f, info] = dejpeg(DC_coefficient, AC_coefficient, H, W, extractfun)

% input:
% DC_coefficient: string
% AC_coefficient: string
% H: int, original H
% W: int, oribinal W
% extractfun: extract hidden info
% output:
% f: dejpeg to img
% info: hidden info

load('JpegCoeff.mat');
% de AC, DC
C = zeros(64, H*W/64);
C(1,:) = dehoffman(DC_coefficient, 'DC');
pos = find(AC_coefficient == '#');
for i = 1:length(pos)
    if i == 1
        C(2:end,1) = dehoffman(AC_coefficient(1:pos(1)-1), 'AC');
    else
        C(2:end,i) = dehoffman(AC_coefficient(pos(i-1)+1:pos(i)-1), 'AC');
    end
end

% extact hide info
if nargin == 5
    info = extractfun(C);
end

% de zigzag, quantize
% QTAB = QTAB ./ 2;
f = zeros(ceil(H/8)*8,ceil(W/8)*8);
for i = 1:H/8
    for j = 1:W/8
        f((i-1)*8+1:i*8,(j-1)*8+1:j*8) = idct2(dezigzag(C(:,(i-1)*W/8+j)) .* QTAB) + 128;
    end
end

f = uint8(f(1:H,1:W));        
% imwrite(f, 'dejpeg.jpg');
% imwrite(f, 'dejpeg_half.jpg');
% imwrite(f, 'dejpeg_snow.jpg');
% imwrite(f, 'dejpeg_hide_time_domain.jpg')
end