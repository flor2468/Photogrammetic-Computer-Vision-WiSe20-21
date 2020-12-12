function rq_decomposition(P)

  M = [P(1, 1:3); P(2, 1:3); P(3, 1:3)]
  
  m = M(3,:);
  
 %m = norm(m)
  m = sqrt(m(1) * m(1) + m(2) * m(2) + m(3) * m(3));
  
  if (det(M) > 0)
    lambda = 1/m
  else 
    lambda = -1/m
  endif

  M = lambda * M
  
  % RQD
  M = inv(M);
  [Q, R] = qr(M);
  Q = inv(Q);
  R = inv(R);
  % renaming the R and Q matrices to the kalibration matrix K and rotation matrix R
  K = R;
  R = Q;
  
  % if values k11, k22 or k33 are negative
  % k33 should always be 1
  if K(1, 1) < 0
    K(:,1) = -1 * K(:,1);
    R(1,:) = -1 * R(1,:);
  endif
  
  if K(2, 2) < 0
    K(:,2) = -1 * K(:,2);
    R(2,:) = -1 * R(2,:);
  endif
  
  if K(3, 3) < 0
    K(:,3) = -1 * K(:,3);
    R(3,:) = -1 * R(3,:);
  endif
  
  K = K
  R = R
  
  % interior orientation
  principle_distance = K(1, 1)
  aspect_ratio = K(2, 2)/ K(1, 1)
  skew_factor = K(1, 2)
  s = acot(-skew_factor / principle_distance);
  s = rad2deg(s)
  principle_point = [K(1, 3); K(2, 3)]
  
  % exterior orientation
  omega = atan(R(3, 2)/R(3, 3));
  omega = rad2deg(omega)
  phi = -asin(R(3, 1));
  phi = rad2deg(phi)
  kappa = atan(R(2, 1)/ R(1, 1));
  kappa = rad2deg(kappa)

  W = det([P(:,1), P(:,2), P(:,3)]);
  X = -det([P(:,2), P(:,3), P(:,4)]) * 1/W;
  Y = det([P(:,1), P(:,3), P(:,4)]) * 1/W;
  Z = -det([P(:,1), P(:,2), P(:,4)]) * 1/W;
  
  projection_center = [X, Y, Z]
  
  
  
  
  
  
  
  
  
  
  
  
endfunction
