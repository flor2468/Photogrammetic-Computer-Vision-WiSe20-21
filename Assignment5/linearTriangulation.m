function XP = linearTriangulation(p1, p2, PN, P_, n)
  P = PN;
  A = [];
  XP = [];
  
  %for i = [1, 2, 3, 4, 5, 6, 7, 8]
  for i = 1:n
    A = [p1(i, 1) * (P(3,:) - P(1,:));
         p1(i, 2) * (P(3,:) - P(2,:));
         p2(i, 1) * (P_(3,:) - P_(1,:));
         p2(i, 2) * (P_(3,:) - P_(2,:))]    
         
    [U,S,V] = svd(A);
    X = V(:,4);
    
    if X(4) ~= 0
      X(1) = X(1) / X(4);
      X(2) = X(2) / X(4);
      X(3) = X(3) / X(4);
    endif
    
    X(4) = 1;
    
    X = X
    
    XP = [XP; X']
    
  endfor
  
  figure;
  scatter3(XP(:,1), XP(:,2), XP(:,3), 10, 'filled');
  axis square;  
  view(32, 75);
  
endfunction
