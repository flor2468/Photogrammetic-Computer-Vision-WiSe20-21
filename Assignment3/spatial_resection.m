function P = spatial_resection(p1, p2)
  
  p1 = [p1, [1, 1, 1, 1, 1, 1]'];
  p2 = [p2, [1, 1, 1, 1, 1, 1]'];
  
  % 2D
  t1 = [mean(p1(:,1)), mean(p1(:,2))];
  s1 = [mean_dist(p1(:,1), t1(1)), mean_dist(p1(:,2), t1(2))];
  T1 = [1/s1(1) ,0, - t1(1)/s1(1); 0, 1/s1(2), - t1(2)/s1(2); 0, 0, 1]
  
  % 3D
  t2 = [mean(p2(:,1)), mean(p2(:,2)), mean(p2(:,3))];
  s2 = [mean_dist(p2(:,1), t2(1)), mean_dist(p2(:,2), t2(2)), mean_dist(p2(:,3), t2(3))];
  T2 = [1/s2(1), 0, 0, -t2(1)/s2(1); 0, 1/s2(2), 0, -t2(2)/s2(2); 
        0, 0, 1/s2(3), -t2(3)/s2(3); 0, 0, 0, 1]
  
  A = [];
  for i = [1, 2, 3, 4, 5, 6]
    pa = T1*p1(i,:)';
    pb = T2*p2(i,:)';
    A_i = [-pa(3)*pb', [0, 0, 0, 0], pa(1)*pb';
           [0, 0, 0, 0], -pa(3)*pb', pa(2)*pb'];
    A = [A;A_i];
  endfor
  
  [U,S,V] = svd(A);
  r = V(:,12);
  p = [r(1), r(2), r(3), r(4); r(5), r(6), r(7), r(8); r(9), r(10), r(11), r(12)];
  P = inv(T1) * p * T2;
  
endfunction


function s = mean_dist(p, t)
  s = 0;
  for i = [1, 2, 3, 4, 5, 6]
    s = s + abs(p(i) - t);
  endfor
  s = s/6;
endfunction