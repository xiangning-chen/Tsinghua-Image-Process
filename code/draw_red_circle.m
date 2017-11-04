load('hall.mat');
hall_color = double(hall_color);
[H, W, C] = size(hall_color);

% pixel inside circle is 1
center = [H / 2, W / 2];
radius = min(H, W) / 2;
[x, y] = meshgrid(1:W, 1:H);
circle = ((x - center(2)) .^ 2 + (y - center(1)) .^ 2 <= radius .^ 2);

% turn pixel to red 
hall_color_red = hall_color(:,:,1);
hall_color_green = hall_color(:,:,2);
hall_colour_blue = hall_color(:,:,3);

hall_color_red(circle) = 255;
hall_color_green(circle) = 0;
hall_colour_blue(circle) = 0;

hall_color_draw_red_circle = zeros(H, W, C);
hall_color_draw_red_circle(:,:,1) = hall_color_red;
hall_color_draw_red_circle(:,:,2) = hall_color_green;
hall_color_draw_red_circle(:,:,3) = hall_colour_blue;
hall_color_draw_red_circle = uint8(hall_color_draw_red_circle);

imwrite(hall_color_draw_red_circle, 'hall_color_draw_red_circle.jpg');
imshow(hall_color_draw_red_circle);