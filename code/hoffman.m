function f = hoffman(x, dir)

% input:
% dir: 'AC' or 'DC' represent whether to encode AC or DC
% x: if 'AC' then [1,64]; if 'DC' then [1,Nan]
% output:
% f: string, hoffman code of x

load('JpegCoeff.mat');
W = length(x);
f = [];
if strcmp(dir, 'DC')
    x = [x(1), -diff(x)];
    for i = 1:W
        cate = fix(log2(abs(x(i)))) + 1;
        if x(i) == 0
            cate = 0;
        end
        hoff = [];
        for j = 1:DCTAB(cate+1,1)
            hoff = [hoff, int2str(DCTAB(cate+1,j+1))];
        end
                
        f = [f, [hoff, My_dec2bin(x(i))]];
    end
elseif strcmp(dir, 'AC')
    non_zero = find(x~=0);
    for i = 1:length(non_zero)
        if i == 1
            run = non_zero(1) - 1;
        else
            run = non_zero(i) - non_zero(i-1) - 1;
        end
        hoff = [];
        size = fix(log2(abs(x(non_zero(i))))) + 1;
        if run >= 16
            hoff = [hoff, repmat('11111111001',1,fix(run/16))];
            run = mod(run, 16);
        end
        tem = [];
        for j = 1:ACTAB(10*run+size,3)
            tem = [tem,int2str(ACTAB(10*run+size,j+3))];
        end
        hoff = [hoff, tem];
        f = [f,[hoff, My_dec2bin(x(non_zero(i)))]];
    end
    f = [f,'1010'];
end
end





