
%position = <v0*cos(x)*t,-16t.^2+v0*sin*(x)*t+y0>
v0 = 142.12; %average exit velocity of one player
theta = (1:90); %thetas
%=========================================================================
%ORIGINAL EXIT VELOCITY
%=========================================================================
%-----------------------------------
%TABLE
%-----------------------------------
%Home Run? - array
hr = cell(1,90);
for i = 1:90
    x = theta(i);
    hr{i}=isHomeRun(x,v0);
end
HomeRun = hr';

%Height over Fence - array
hof = (1:90);
for i = (1:90)
    x = theta(i);
    hof(i) = atFenceHeight(x,v0);
end
HeightOverFence = hof';

%Horizontal Distances - array
hdo = (1:90);
for i = (1:90)
    x = theta(i);
    hdo(i) = horzD(x,v0);
end
HorizontalDistance = hdo';
Theta = theta';
originalTable = table(Theta,HomeRun,HeightOverFence,HorizontalDistance);
disp(originalTable);
%------------------------------------
%GRAPH 
%------------------------------------
fAngle = deg2rad(58);
fTime = 399/(v0*cos(fAngle));
%VECTOR ITEMS
syms t;
s= [v0*cos(fAngle)*t , v0*sin(fAngle)*t-16*t.^2+3 ,0]; %position vector
v = diff(s); %velocity vector
a = diff(v); %acceleration vector
T = v/norm(v);%unit tangent vector
N = diff(T)/norm(diff(T)); %principal normal vector
k = norm(cross(v,a))/(norm(v)^3); %curvature
%sub into equations
t = fTime;
T = subs(T,t);
N = subs(N,t);
k = subs(k,t);
v = subs(v,t);
a = subs(a,t);
%GRAPH
t = 0:0.1:fTime;
y = v0*cos(fAngle)*t;
z = -16*t.^2+v0*sin(fAngle)*t+3;
%projectile motion line
plot(y,z);
title("Original Exit Velocity Best Home Run");
xlabel("Distance (ft)");
ylabel("Height (ft)");
hold on
xcor = v0*cos(fAngle)*(fTime);
ycor = -16*(fTime)^2+v0*sin(fAngle)*(fTime)+3;
%tangent line
quiver(xcor,ycor,v(1),v(2));
%unit normal line
quiver(xcor,ycor,a(1),a(2));
gradient(k);
hold off
legend("Amount over Fence: 182.44ft.","Tangent Vector","Normal Vector");
TangentVector = [0.83815376053 -0.54543402323];
NormalVector = [-0.5454 -0.8382];
Curvature = 0.0033;
VectorItems = table(TangentVector,NormalVector,Curvature);
disp(VectorItems);

