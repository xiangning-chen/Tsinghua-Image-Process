function img_set = get_faces()

% output:
% img_set: cell

Dir = dir('Faces/*.bmp');
img_set = cell(1, length(Dir));
for i = 1:length(Dir)
    img_set{i} = imread(['Faces/',Dir(i).name]);
end
end