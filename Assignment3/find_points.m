function [p1] = find_points(im1)
  imshow(im1)
  [x1, y1] = ginput(6);
  p1 = [x1, y1];
  close
  %imshow(im2)
  %[x2, y2] = ginput(4);
  %p2 = [x2, y2];
  %close
endfunction