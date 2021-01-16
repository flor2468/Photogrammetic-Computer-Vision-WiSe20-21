function h = calculate_3Dhomography(p1, p2)

% p1 = XP2 
% p2 = XE
%  p1 = [p1, [1, 1, 1, 1, 1]'];
p1 = [p1, [1, 1, 1, 1, 1]'];
  
  # conditioning 3D
  
  t1 = [mean(p1(:,1)), mean(p1(:,2)), mean(p1(:,3))];
  
  t2 = [mean(p2(:,1)), mean(p2(:,2)), mean(p2(:,3))];
  
  s1 = [mean_dist(p1(:,1), t1(1)), mean_dist(p1(:,2), t1(2)), mean_dist(p1(:,3), t1(3))];
  
  s2 = [mean_dist(p2(:,1), t2(1)), mean_dist(p2(:,2), t2(2)), mean_dist(p2(:,3), t2(3))];
  
  T1 = [1/s1(1) ,0, 0, - t1(1)/s1(1);
        0, 1/s1(2), 0, - t1(2)/s1(2);
        0, 0, 1/s1(3), -t1(3)/s1(3);
        0, 0, 0, 1];
  
  T2 = [1/s2(1),  0,        0,        -t2(1)/s2(1);
        0,        1/s2(2),  0,        -t2(2)/s2(2); 
        0,        0,        1/s2(3),  -t2(3)/s2(3);
        0,        0,        0,        1];
  
  # algorithm
  A = [];
  for i = 1:5
    
    pa = T1*p1(i,:)';
    pb = T2*p2(i,:)';
  
    A_i = [-pb(4)*pa', [0, 0, 0, 0], [0, 0, 0, 0], pb(1)*pa';
          [0, 0, 0, 0], -pb(4)*pa', [0, 0, 0, 0], pb(2)*pa';
          [0, 0, 0, 0], [0, 0, 0, 0], -pb(4)*pa', pb(3)*pa'];
    
    A = [A;A_i];
    
%________________________________________________________________________________
% TODO:
    
  endfor
  [U,S,V] = svd(A'*A)
  # hs is the Eigenvector, V is transposed
  hs = V(:,16)
  h = [hs(1), hs(2), hs(3), hs(4);
       hs(5), hs(6), hs(7), hs(8); 
       hs(9), hs(10),hs(11),hs(12);
       hs(13),hs(14),hs(15),hs(16)]
  # deconditioning
  h = inv(T2) * h * T1
endfunction


function s = mean_dist(p, t)
  s = 0;
  for i = [1, 2, 3, 4, 5]
    s = s + abs(p(i) - t);
  endfor
  s = s/4;
endfunction
