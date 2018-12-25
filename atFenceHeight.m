% atFenceHeight
function overFence = atFenceHeight(x,v0)
fenceD = 399; %centerfield horizontal location
fenceH = 10; %fence height
x = deg2rad(x); %degrees to radians

t = fenceD/(v0*cos(x)); %time at 399 ft. horizontally 
atFH = -16*t.^2 + v0*sin(x)*t+3; %the height of the ball @fence @t
disp(atFH);
overFence = atFH - fenceH; %how much over the fence
end