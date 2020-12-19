im1 = imread('images/image1', 'jpg');
im2 = imread('images/image2', 'jpg');

[p1, p2] = find_points(im1, im2);

F = norm8point(p1, p2)

% epipolar lines

subplot(1, 2, 1);
hold on
imshow(im1); %# Plot the first image

for i = [1, 2, 3, 4, 5, 6, 7, 8]
  
  l1 = F' * [p2(i,:),1]
  hline(l1)

endfor

hold off

subplot(1, 2, 2);
hold on
imshow(im2); %# Plot the second image    
  
for i = [1, 2, 3, 4, 5, 6, 7, 8]
 
  l2 = F * [p1(i,:),1]
  hline(l2)
  
endfor

hold off