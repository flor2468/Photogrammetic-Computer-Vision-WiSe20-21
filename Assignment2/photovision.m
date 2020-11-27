im1 = imread('bilder/image_1.jpg', 'jpg');
im2 = imread('bilder/image_2.jpg', 'jpg');
im3 = imread('bilder/image_3.jpg', 'jpg');

p1 = [93,617; 729,742; 703,1233; 152,1103];
p2 = [0,0; 639, 0; 639, 639; 0, 639];

% [p1, p2] = find_points(im1, im2)
h = calculate_homography(p1, p2)
imshow(geokor(h, im1, im2))


