%MATLAB exercise from the first assignment. Group M.
x=[2;3;1];
y=[-4;5;1];

l=cross(x,y)

translation=[1,0,6; 0,1,-7;0,0,1];
phi=(15*pi)/180;
rotation=[cos(phi), -sin(phi),0;sin(phi), cos(phi), 0;0,0,1]
scaling=[8,0,0;0,8,0;0,0,1]

x2=scaling * rotation * translation * x

y2=scaling * rotation * translation * y

l2=inv(scaling)'*inv(rotation)'*inv(translation)'*l

a=x2'*l2
b=y2'*l2
%Since a and b are both 0, so both x2 and y2 lie on l2.