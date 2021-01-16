function [p1, p2, P1, P2] = read_points(filename)
  fh = fopen(filename, 'r')
  A = fscanf(fh, '%f%f%f%f', [4 inf]);
  fclose(fh);
  %x1 = A(1:2, :);
  x1 = A(1:4:32)
  y1 = A(2:4:32)
  %x2 = A(3:4, :);
  x2 = A(3:4:32)
  y2 = A(4:4:32)
  p1 = [x1', y1']
  p2 = [x2', y2']  
  P1 = [A(1:4:end)',A(2:4:end)']
  P2 = [A(3:4:end)',A(4:4:end)']
endfunction
