function h = calculate_homography(p1, p2)
  p1 = [p1, [1, 1, 1, 1]']
  p2 = [p2, [1, 1, 1, 1]']
  
  A = [];
  for i = [1, 2, 3, 4]
    pa = p1(i,:)';
    pb = p2(i,:)';
    A_i = [-pb(3)*pa', [0, 0, 0], pb(1)*pa';
           [0, 0, 0], -pb(3)*pa', pb(2)*pa'];
    A = [A;A_i];
  endfor
  [U,S,V] = svd(A)
  hs = V'(:,9)
  h = [hs(1), hs(2), hs(3); hs(4), hs(5), hs(6); hs(7), hs(8), hs(9)]
endfunction
