function [DC_coefficient, AC_coefficient, H, W] = jpeg(img0, hide)

% input:
% img0: metric, input image
% hide: [1,2] cell, hide info
% output:
% DC_coefficient: string
% AC_coefficient: string
% H: H of img0
% Wl W of img0

img = double(img0) - 128;
C = split_dct_quantize(img);
[H, W] = size(img);

% hide
if nargin == 2
    hidefun = hide{1};
    str = hide{2};
    C = hidefun(C, str);
end

% the first row is DC coefficient
DC = C(1,:);

% DC_huffman
DC_coefficient = hoffman(DC, 'DC');

% AC_hoffman
AC_coefficient = [];

for j = 1:size(C,2)
    AC = C(2:end, j);
    AC_coefficient = [AC_coefficient, hoffman(AC, 'AC'), '#'];
end    
end