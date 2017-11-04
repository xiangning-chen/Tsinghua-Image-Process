function f = dehoffman(x, dir)

% input:
% x: string, DC or AC code
% dir: 'AC' or 'DC'
% output:
% f: C output

load('JpegCoeff.mat');
f = [];
flag = 1;
if strcmp(dir, 'DC')
    while flag <= length(x)
        for i = 1:size(DCTAB,1)
            len = DCTAB(i,1);
            tem = [];
            for j = 1:len
                tem = [tem, int2str(DCTAB(i,j+1))];
            end
            if strcmp(x(flag:flag+len-1), tem)
                cat = i - 1;
                flag = flag + len;
                break;
            end
        end
        if cat == 0
            f = [f, 0];
            flag = flag + 1;
        else
            f = [f, My_bin2dec(x(flag:flag+cat-1))];
            flag = flag + cat;
        end
    end
    for i = 2:length(f)
        f(i) = f(i-1) - f(i);
    end
elseif strcmp(dir, 'AC')
    x = x(1:end-4);
    if length(x) == 0
        f = zeros(1,63);
    else
        while flag <= length(x)
            if flag+10 <= length(x)
                if strcmp(x(flag:flag+10), '11111111001')
                    flag = flag + 11;
                    f = [f, zeros(1,16)];
                    continue;
                end
            end
            is_find = 0;
            for i = 0:15
                for j = 1:10
                    len = ACTAB(i*10+j,3);
                    tem = [];
                    for k = 1:len
                        tem = [tem, int2str(ACTAB(i*10+j,k+3))];
                    end
                    if flag+len-1 <= length(x)
                        if strcmp(x(flag:flag+len-1),tem)
                            run = i;
                            Size = j;
                            f = [f,zeros(1,run)];
                            flag = flag + len;
                            is_find = 1;
                            break;
                        end
                    end
                end
                if is_find
                    break;
                end
            end
            f = [f,My_bin2dec(x(flag:flag+Size-1))];
            flag = flag + Size;
        end
    end
    f = [f, zeros(1,63-length(f))];
end
end

