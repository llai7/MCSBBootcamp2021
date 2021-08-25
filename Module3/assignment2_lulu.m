%% part c
r = 0.1;
k = 0.6;
nmax = 200;
x = zeros(1,nmax);
x(1)=0.2;

for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end

figure(1); hold on;
plot(x,'-b');

x(1)=0.05;
for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end
plot(x,'-r');

x(1)=0.8;
for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end
plot(x,'-g');


%% part d
r=2.1;
k=0.6;
x = zeros(1,nmax);
x(1)=0.2;

for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end

figure(2); hold on;
plot(x,'-b');

x(1)=0.05;
for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end
plot(x,'-r');

x(1)=0.8;
for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end
plot(x,'-g');

%% part e
r=2.5;
k=0.6;
x = zeros(1,nmax);
x(1)=0.2;

for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end

figure(3); hold on;
plot(x,'-b');

x(1)=0.05;
for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end
plot(x,'-r');

x(1)=0.8;
for n = 1:(nmax-1)
    x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
end
plot(x,'-g');

%% part f
% there's no r that gives a 3-cycle

%% part g
k=0.6;
x = zeros(1,nmax);
x(1)=0.2;
nsteady = zeros(1,nmax);

figure(4); clf; hold on;
for r = 0:0.1:3.0
    for n = 1:(nmax-1)
        x(n+1) = x(n) + (r.*(1-(x(n)/k)).*x(n));
    end
    ar = zeros(1, length(x)/2+1);
    plot( ar+r, x(nmax/2:nmax), '.b');
end
