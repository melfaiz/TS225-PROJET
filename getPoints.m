function OUT = getPoints(image)

figure,imshow(uint8(image));
[in_x,in_y] = getpts;
OUT = [in_x in_y];
close all;

end

