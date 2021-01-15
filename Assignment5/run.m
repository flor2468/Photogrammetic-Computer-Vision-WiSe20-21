%im1 = imread('images/image1', 'jpg');
%im2 = imread('images/image2', 'jpg');

%[p1, p2] = find_points(im1, im2);

[p1, p2] = read_points('bh.dat');

% normalized 8-point algorithm
F = norm8point(p1, p2);

[PN, P_] = calculateProjection(F)

XP1 = linearTriangulation(p1, p2, PN, P_, 8)

[p3, p4, X] = read_control_points('pp.dat');


XP2 = linearTriangulation(p3, p4, PN, P_, 5)

% epipolar lines
%subplot(1, 2, 1);
%imshow(im1), hold on

%lines1 = [];
%lines2 = [];

%for i = [1, 2, 3, 4, 5, 6, 7, 8]
  
%  l1 = F' * [p2(i,:),1]'
%  hline(l1)
  
  % add lines to container to use it in the geometricError()
%  lines1 = [lines1; l1']
  
%endfor

%subplot(1, 2, 2);
%imshow(im2), hold on   
  
%for i = [1, 2, 3, 4, 5, 6, 7, 8]
 
 % l2 = F * [p1(i,:),1]'
 % hline(l2)
  
  % add lines to container to use it in the geometricError()
 % lines2 = [lines2; l2']
  
%endfor

% geometric error
%sum1 = geometricError(p1, p2, lines1, lines2)






