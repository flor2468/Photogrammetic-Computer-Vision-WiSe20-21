function [p1, p2] = find_points(im1, im2)
  imshow(im1)
  [x1, y1] = ginput(8);
  p1 = [x1, y1]
  close
  
  imshow(im2)
  [x2, y2] = ginput(8);
  p2 = [x2, y2]
  close
endfunction

