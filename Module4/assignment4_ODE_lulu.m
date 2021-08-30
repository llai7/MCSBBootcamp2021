% parameters
a = -1;
b = -1;
d = -1;
c = -1;

% model equations
f =@(x,y) a*x + b*y; 
g =@(x,y) c*x + d*y;

[T, X] = ode45(@(t,x)[f(x(1),x(2));g(x(1),x(2))], [0,1000], [.1,.1] );

figure; hold on;
set(gca, 'xlim', [-1, 1], 'ylim', [-1, 1])
ylabel('x');
xlabel('y')

xArray = linspace(-1,1,16);
yArray = linspace(-1,1,16);

[xMesh,yMesh] = meshgrid(xArray, yArray);

% the Matlab plot command for a field of arrows is:
quiver(xMesh, yMesh, f(xMesh, yMesh), g(xMesh,yMesh))

plot(X(:,1),X(:,2),'-r')
plot(X(end,1),X(end,2), 'or')

%% repulsive spiral
% parameters
a = 0;
b = -2;
d = 1;
c = 2;

%% attractive spiral
% parameters
a = -1;
b = -2;
d = 0;
c = 2;

%% oscillation
% parameters
a = 0;
b = -2;
d = 0;
c = 2;

%% repulsive not spiral
% parameters
a = 1;
b = -1;
d = 1;
c = 1;

% parameters
a = 1;
b = 1;
d = 1;
c = 1;

%% going away two directions
% parameters
a = -1;
b = -1;
d = 1;
c = 1;

%% attractive not spiral
% parameters
a = -1;
b = -1;
d = -1;
c = -1;

%% number 6
% parameters
a = -1;
b = -2;
d = 1;
c = -2;