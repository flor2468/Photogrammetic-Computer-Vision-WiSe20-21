function [p1, p2, X] = read_control_points(filename)
  fh = fopen(filename, 'r')
  A = fscanf(fh, '%f%f%f%f', [4 inf]);
  fclose(fh);
  x1 = A(1:7:35)
  y1 = A(2:7:35)
  x2 = A(3:7:35)
  y2 = A(4:7:35)
  p1 = [x1', y1']
  p2 = [x2', y2']  
  XE = A(5:7:35)
  YE = A(6:7:35)
  ZE = A(7:7:35)
  X = [XE', YE', ZE']
endfunction
