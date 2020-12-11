im1 = imread('bilder/image_without_points', 'jpg');
im2 = imread('bilder/image_with_points.jpg', 'jpg');

p1 = find_points(im1)
p2 = [0, 11.8, 9.4; 6.3, 11.8, 9.4; 0, 0, 9.4; 6.3, 0, 9.4
      0, 0, 0; 6.3, 0, 0]

% x = 2D
% X = 3D

p = spatial_resection(p1, p2)