function e = geometricError(p1, p2, l1, l2)
  
  e = 0;
  
  for i = [1, 2, 3, 4, 5, 6, 7, 8]
    
    z = p1(i,:)' * l2
    z = z * z
    n = l2(1)^2 + l2(2)^2 + l1(1)^2 + l1(2)^2
    temp = z/n
    e = e + temp
    
  endfor
  
endfunction
