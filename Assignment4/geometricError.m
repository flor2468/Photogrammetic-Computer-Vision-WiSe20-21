function sum1 = geometricError(p1, p2, lines1, lines2)

  sum1 = 0;
  
  for i = [1, 2, 3, 4, 5, 6, 7, 8]
    
    z = dot([p2(i,:),1], lines2(i,:)');
    z = z^2;
    n = lines2(i,1)^2 + lines2(i,2)^2 + lines1(i,1)^2 + lines1(i,2)^2;
    e = z/n;
    sum1 = sum1 + e;
    
  endfor
  
endfunction
