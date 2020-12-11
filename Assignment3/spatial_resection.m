function p = spatial_resection(p1, p2)
  
  p1 = [p1, [1, 1, 1, 1, 1, 1]'];
  p2 = [p2, [1, 1, 1, 1, 1, 1]'];
  
  % 2D
  t1 = [mean(p1(:,1)), mean(p1(:,2))]
  s1 = [mean_dist(p1(:,1), t1(1)), mean_dist(p1(:,2), t1(2))]
  T1 = [1/s1(1) ,0, - t1(1)/s1(1); 0, 1/s1(2), - t1(2)/s1(2); 0, 0, 1]
  
  % 3D
  t2 = [mean(p2(:,1)), mean(p2(:,2)), mean(p2(:,3))]
  s2 = [mean_dist(p2(:,1), t2(1)), mean_dist(p2(:,2), t2(2)), mean_dist(p2(:,3), t2(3))]
  T2 = 0
  
  p = 0
  
endfunction




function s = mean_dist(p, t)
  s = 0;
  for i = [1, 2, 3, 4, 5, 6]
    s = s + abs(p(i) - t);
  endfor
  s = s/6;
endfunction