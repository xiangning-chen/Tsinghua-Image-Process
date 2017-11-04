function [f, record] = scan(img_test, v, L, stride, sideH, sideW, error)

% input:
% img_test
% v: pretrained vector
% L: category of color
% stride
% sideH, sideW: size of scan region
% error
% output:
% f: img with faces marked
% record: [Nan, 4] metric storing marks

[f, nH, nW] = pre_process(img_test, stride, sideH, sideW);
f = double(f);
record = [];
for i = 1:nH
    for j = 1:nW
        block = f((i-1)*stride+1:(i-1)*stride+sideH,(j-1)*stride+1:(j-1)*stride+sideW,:);
        if dis(get_u(block,L),v) < error
            f((i-1)*stride+1:(i-1)*stride+sideH,(j-1)*stride+1:(j-1)*...
                stride+sideW,:) = draw_frame(block);
            axis = [(i-1)*stride+round((1+sideH)/2), (j-1)*stride+round((1+sideW)/2)];
            record = [record;axis];
        end
    end
end
f = uint8(f);
record(:,3) = sideH;
record(:,4) = sideW;
record = round(record);
end