%% part 1
eps = 0.08;
alpha = 0.5;
b = 0.2;

f = @(v,w) v - 1/3* v.^3 - w; %v,w
g = @(v,w) eps*(v+alpha-b*w);  %v,w

dxdt = @(t,x)[f(x(1),x(2)); g(x(1),x(2))];

[T,X] = ode45(dxdt, [0,100], [-0, -0.5]);

figure(1); hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')
plot(T,X);

%% part 2
eps = 0.08;
alpha = 1;
b = 0.2;

f = @(v,w) v - 1/3* v.^3 - w; %v,w
g = @(v,w) eps*(v+alpha-b*w);  %v,w

dxdt = @(t,x)[f(x(1),x(2)); g(x(1),x(2))];

[T,X] = ode45(dxdt, [0,100], [-1.5, -0.5]);

figure(2); hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')
plot(T,X);

%% part 3
eps = 0.08;
alpha = 1;
b = 0.2;

I0 = 1.0;
tStart=40;
tStop=47;
%I= @(t) I0*(t>tStart).*(t<tStop);
    
f = @(v,w,t) v - 1/3* v.^3 - w + I0*(t>tStart).*(t<tStop);
g = @(v,w,t) eps*(v+alpha-b*w); 

dxdt = @(t,x)[f(x(1),x(2),t); g(x(1),x(2),t)];

[T,X] = ode45(dxdt, [0,100], [-1.129, -0.649]); %steady state

figure(3); clf; hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')
plot(T,X);

%% part 4a
eps = 0.08;
alpha = 1;
b = 0.2;
D=0.9;

I0 = 1.0;
tStart=40;
tStop=47;
I= @(t) I0*(t>tStart).*(t<tStop);
arr = zeros(10,1);

f = @(v,w,t) v - 1/3* v.^3 - w + I(t).* arr;
g = @(v,w,t) eps*(v+alpha-b*w); 

dxdt = @(t,x)[f(x(1:10),x(11:20),t); g(x(1:10),x(11:20),t)];

[T,X] = ode45(dxdt, [0,100], [-1.129.*ones(10,1), -0.649.*ones(10,1)]); %steady state

figure(4); clf; hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')
plot(T,X);

for nt=1:numel(T)
    figure(5); clf; hold on; box on;
    plot(X(nt,1:10)); 
    set(gca,'ylim', [-2.5,2.5])
    xlabel('Cell');
    ylabel('Voltage')
    drawnow;
end

%% part 4b
eps = 0.08;
alpha = 0.5;
b = 0.2;
D=0.9;

I0 = 1.0;
tStart=40;
tStop=47;
I= @(t) I0*(t>tStart).*(t<tStop);
arr = zeros(10,1);
arr(4) = 1;

f = @(v,w,t) v - 1/3* v.^3 - w + I(t).* arr ;
g = @(v,w,t) eps*(v+alpha-b*w); 

dxdt = @(t,x)[f(x(1:10),x(11:20),t) + D.*([x(10);x(1:9)]-2*x(1:10)+[x(2:10);x(1)]); 
    g(x(1:10),x(11:20),t)];

[T,X] = ode45(dxdt, [0,100], [-1.129.*ones(10,1), -0.649.*ones(10,1)]); %steady state

figure(6); clf; hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')
plot(T,X);

for nt=1:numel(T)
    figure(7); clf; hold on; box on;
    plot(X(nt,1:10)); 
    set(gca,'ylim', [-2.5,2.5])
    xlabel('Cell');
    ylabel('Voltage')
    drawnow;
end