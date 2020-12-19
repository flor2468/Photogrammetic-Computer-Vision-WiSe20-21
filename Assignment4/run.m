im1 = imread('images/image1', 'jpg');
im2 = imread('images/image2', 'jpg');

[p1, p2] = find_points(im1, im2);

F = norm8point(p1, p2)

% epipolar lines

subplot(1, 2, 1);
imshow(im1), hold on

for i = [1, 2, 3, 4, 5, 6, 7, 8]
  
  l1 = F' * [p2(i,:),1]'
  hline(l1)

endfor

%hold off

subplot(1, 2, 2);
imshow(im2), hold on   
  
for i = [1, 2, 3, 4, 5, 6, 7, 8]
 
  l2 = F * [p1(i,:),1]'
  hline(l2)
  
endfor

%hold off

%TESTS

%l1 = F' * [p2(1,:),1]'
%l2 = F * [p1(1,:),1]'

% so funktioniert es fuer l:
%l = [-1 1 50]'
%im1 = imread('images/image1', 'jpg');
%figure, imshow(im1), hold on
%hline(l)

%TODO: fix the errors
%e = geometricError(p1, p2, l1, l2)




