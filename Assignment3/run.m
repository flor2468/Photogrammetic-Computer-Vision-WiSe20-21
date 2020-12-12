im1 = imread('bilder/image_without_points', 'jpg');
im2 = imread('bilder/image_with_points.jpg', 'jpg');

% clicking the points in the order of the definition in p2
% 1.) [0, 11.8, 9.4]
% 2.) [6.3, 11.8, 9.4]
% 3.) [0, 0, 9.4]
% 4.) [6.3, 0, 9.4]
% 5.) [0, 0, 0]
% 6.) [6.3, 0, 0]

p1 = find_points(im1)
p2 = [0, 11.8, 9.4; 
      6.3, 11.8, 9.4; 
      0, 0, 9.4; 
      6.3, 0, 9.4;
      0, 0, 0; 
      6.3, 0, 0]

P = spatial_resection(p1, p2)

% examples for P from the lecture

%P = [-559.425, -69.134, 25.301, -998.081;
%     -68.914, -418.097, 355.103, 388.586;
%     -0.451, 0.211, 0.866, -0.679]
     
%P = [-0.6581, 0.5764, -0.0040, 132.5556;
%     -0.1568, -0.1801, -0.9210, 270.3348;
%     -0.0006, -0.0005, 0.0001, 1.0000]
     
     
rq_decomposition(P)