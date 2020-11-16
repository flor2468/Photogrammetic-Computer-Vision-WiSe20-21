function vectorComputation
  # x = [2, 3]^T and y = [-4, 5]^T
  
  x = [2; 3; 0]
  y = [-4; 5; 0]
  
  a = y(1, 1) - x(1, 1)
  b = y(2, 1) - x(2, 1)
  
  # line between x and y
  l = cross(x, y)
  
  #___________________________________________________________________________
  # plotting the points x and y
  
  figure(1)
  plot(x, 'b.')
  plot(y, 'b.')
  
  # plotting the line between x and y
  
  figure(2)
  plot(x, y, 'b.-')
  
  # Move x and y in the direction t
  
  t = [6; -7; 0]
  x_2 = x + t
  y_2 = y + t
  
  # rotate x and y with rotation matrix  
  # angle 15° in radiant 
  
  alpha = 15
  alpha_radiant = (alpha * pi)/180
  
  # because changing the 2D vectors to 3D vectors the rotation matrix is no 
  # longer working :(
  
  rotation_matrix = [cos(alpha_radiant), -sin(alpha_radiant); 
                     sin(alpha_radiant), cos(alpha_radiant)]
  x_3 = rotation_matrix * x_2
  y_3 = rotation_matrix * y_2
  
  # Scale x and y with lambda = 8
  
  lambda = 8
  x_4 = x_3 * lambda
  y_4 = y_3 * lambda
  
  #___________________________________________________________________________
  # Move l with t
  
  l_2 = l + t
  
  # rotate l with rotation matrix
  # angle 15° in radiant
  
  l_3 = rotation_matrix * l_2
  
  # Scale l with lambda = 8
  
  l_4 = l_3 * lambda
  
endfunction