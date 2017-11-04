function f = draw_frame(img)

img = double(img);
img(end,:,1) = 255;
img(end,:,2) = 0;
img(end,:,3) = 0;
img(1,:,1) = 255;
img(1,:,2) = 0;
img(1,:,3) = 0;
img(:,end,1) = 255;
img(:,end,2) = 0;
img(:,end,3) = 0;
img(:,1,1) = 255;
img(:,1,2) = 0;
img(:,1,3) = 0;

f = uint8(img);
end