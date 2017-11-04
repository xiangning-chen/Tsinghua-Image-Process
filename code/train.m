function v = train(L)

% input:
% L: color category
% output:
% v: [2^(3*L),1] metric, trained v

img_set = get_faces();
v = zeros(2^(3*L), 1);
img_num = length(img_set);

for i = 1:img_num
    v = v + get_u(img_set{i},L) / img_num;
end

end