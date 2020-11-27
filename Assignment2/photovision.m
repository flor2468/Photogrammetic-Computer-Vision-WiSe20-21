im1 = imread('bilder/image_1_small.jpg', 'jpg');
im2 = imread('bilder/image_2_small.jpg', 'jpg');
im3 = imread('bilder/image_3_small.jpg', 'jpg');

%p1 = [93,617; 729,742; 703,1233; 152,1103];
%p2 = [0,0; 639, 0; 639, 639; 0, 639];

[p1, p2] = find_points(im1, im2)
h1 = calculate_homography(p1, p2)
%imshow(geokor(h, im1, im2))
im4 = geokor(h1, im1, im2);

[p3, p4] = find_points(im3, im4)
h2 = calculate_homography(p3, p4)
imshow(geokor(h2, im3, im4))

