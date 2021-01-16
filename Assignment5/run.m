%im1 = imread('images/image1', 'jpg');
%im2 = imread('images/image2', 'jpg');

%[p1, p2] = find_points(im1, im2);

[p1, p2, P1, P2] = read_points('bh.dat');

% normalized 8-point algorithm
F = norm8point(p1, p2);
n = 1383

[PN, P_] = calculateProjection(F)

XP1 = linearTriangulation(P1, P2, PN, P_, n)

[p3, p4, XE] = read_control_points('pp.dat');


XP2 = linearTriangulation(p3, p4, PN, P_, 5)

H = calculate_3Dhomography(XE, XP2)

XP = [];
for i = 1:n
  X = H*XP1(i,:)';
  [X(1)/X(4), X(2)/X(4), X(3)/X(4)]
    
  XP = [XP; [X(1)/X(4), X(2)/X(4), X(3)/X(4)]];
    
endfor
  
figure;
scatter3(XP(:,1), XP(:,2), XP(:,3), 10, 'filled');
axis square;  
view(32, 75);
