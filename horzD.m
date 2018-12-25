% Horizontal Distance
function distance = horzD(x,v0)
%x = x * (pi/180); 
x = deg2rad(x);%degrees to radians

%quadratic formula
a = -16;
b = v0*sin(x);
c = 3;

t = (-b - sqrt(b.^2 - (4*a*c)))/(2*a);%time when the ball hits the ground
distance = v0*cos(x)*t;
end