function [PN, P_] = calculateProjection(F)
  [U,S,V] = svd(F)
  e_ = U(:,3)
  PN = [eye([3,4])]
  P_ = [skew(e_) * F + [e_, e_, e_], e_]
endfunction




function s = skew(x)
  
  s = [0, -x(3), x(2); x(3), 0, -x(1); -x(2), x(1), 0];
  
endfunction
