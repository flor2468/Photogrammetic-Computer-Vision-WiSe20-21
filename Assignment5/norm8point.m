function F = norm8point(p1, p2)
  
  n = 8;
  p1 = [p1, [1, 1, 1, 1, 1, 1, 1, 1]'];
  p2 = [p2, [1, 1, 1, 1, 1, 1, 1, 1]'];
  
  
  # conditioning
  t1 = [mean(p1(:,1)), mean(p1(:,2))]
  t2 = [mean(p2(:,1)), mean(p2(:,2))]
  s1 = [mean_dist(p1(:,1), t1(1)), mean_dist(p1(:,2), t1(2))]
  s2 = [mean_dist(p2(:,1), t2(1)), mean_dist(p2(:,2), t2(2))]
  T1 = [1/s1(1) ,0, - t1(1)/s1(1); 0, 1/s1(2), - t1(2)/s1(2); 0, 0, 1]
  T2 = [1/s2(1) ,0, - t2(1)/s2(1); 0, 1/s2(2), - t2(2)/s2(2); 0, 0, 1]
  
%  test1 = p1(:,1)
%  test2 = p1(:,1)'
  
  cp1 = T1 * p1';
  cp2 = T2 * p2';
  
  %for i = [1, 2, 3, 4, 5, 6, 7, 8]
    
  %  cp1 = [cp1; [T1 * [p1(i,:),1]']']; 
  %  cp2 = [cp2; [T2 * [p2(i,:),1]']'];
  
  %endfor
  
  # algorithm
  # A = [(cp1(:,1)' * diag(cp2(:,1)))', (cp1(:,2)' * diag(cp2(:,1)))', cp2(:,1), (cp1(:,1)' * diag(cp2(:,2)))', (cp1(:,2)' * diag(cp2(:,2)))', cp2(:,2), cp1(:,1), cp1(:,2), ones(n,1)]
  A = [];
  for i = 1 : size(cp1, 2)
    A = [ A; cp2(1, i)*cp1(:, i)' cp2(2, i)*cp1(:, i)' cp2(3, i)*cp1(:, i)' ];
  end     
  # um A quadratisch zu machen, muessen wir eine Zeile erguenzen
  A =  [A; [0,0,0,0,0,0,0,0,0]]
  [U,S,V] = svd(A)
  # hs is the Eigenvector, V is transposed
  hs = V(:,9)
  f = [hs(1), hs(2), hs(3); hs(4), hs(5), hs(6); hs(7), hs(8), hs(9)]
  
  [U, D, V] = svd(f);                            
  % Singular value decomposition
  D(3, 3) = 0;        
  % Smallest singular value must be 0
  f = U * D * V';                                          
  % Recompose matrices
  # deconditioning
  F = T2' * f * T1
endfunction


function s = mean_dist(p, t)
  s = 0;
  for i = [1, 2, 3, 4, 5, 6, 7, 8]
    s = s + abs(p(i) - t);
  endfor
  s = s/8;
endfunction
