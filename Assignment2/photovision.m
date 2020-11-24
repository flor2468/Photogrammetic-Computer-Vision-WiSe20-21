im1 = imread('bilder/image_1.jpg', 'jpg');
im2 = imread('bilder/image_2.jpg', 'jpg');
im3 = imread('bilder/image_3.jpg', 'jpg');

%p1 = [104.552, 65.881; 2204.165, 1719.558; 3746.358, 75.171; 3895.003, 112.332];
%p2 = [151.00, 1756.72; 2064.81, 121.62; 3802.10, 1710.27; 3792.81, 1728.85];

[p1, p2] = find_points(im1, im2)
h = calculate_homography(p1, p2)
imshow(geokor(h, im1, im2))


