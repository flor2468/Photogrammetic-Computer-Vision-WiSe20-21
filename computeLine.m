clear all
close all

function computeLine

x = [2; 3; 1]
y = [-4; 5; 1]

l = cross(x, y)

translation = [1, 0, 6; 0, 1, -7; 0, 0, 1];
phi = (15 * pi) / 180;
rotation = [cos(phi), -sin(phi), 0; sin(phi), cos(phi), 0; 0, 0, 1]
scaling = [8, 0, 0; 0, 8, 0; 0, 0, 1]

x_2 = scaling * rotation * translation * x

y_2 = scaling * rotation * translation * y

l_2 = inv(scaling)' * inv(rotation)' * inv(translation)' * l

a = x_2' * l_2
b = y_2' * l_2

#Since a and b are both 0, so both x_2 and y_2 lie on l_2.

if a == 0 & b == 0
  result = 'x_2 and y_2 lie on l_2'
else
  result = 'x_2 and y_2 do not lie on l_2'
end

endfunction