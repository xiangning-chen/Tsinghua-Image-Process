function f = plot_merge(img_test, record)

img_test = double(img_test);
for i = 1:size(record,1)
    lenH = round(record(i,3)/2);
    lenW = round(record(i,4)/2);
    img_test(record(i,1)-lenH:record(i,1)+lenH,record(i,2)-lenW:record(i,2)+lenW,:) = ...
        draw_frame(img_test(record(i,1)-lenH:record(i,1)+lenH,record(i,2)-lenW:record(i,2)+lenW,:));
end
f = uint8(img_test);
end