im1 = imread('bilder/bild1', 'jpg');
im2 = imread('bilder/bild2', 'jpg');

[p1, p2] = find_points(im1, im2);

F = norm8points(p1, p2)

subplot(1, 2, 1);
imshow(im1); %# Plot the first image
subplot(1, 2, 2);
imshow(im2); %# Plot the second image    
