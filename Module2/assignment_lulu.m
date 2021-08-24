%% part a:
nMax = 20;
c = -0.8;
d = 0.156;
x = zeros(1,nMax);
y = zeros(1,nMax);
x(1) = 1;

for n = 1:(nMax-1)
    x(n+1) = x(n)^2 - y(n)^2 + c;
    y(n+1) = 2*x(n)*y(n) + d;
end

figure(1);
plot(x,'-ob');

%% part b:
nMax=22;
x = zeros(1,nMax);
y = zeros(1,nMax);
x(1) = 0.1;
y(1) = 0.1;

for n = 1:(nMax-1)
    x(n+1) = x(n)^2 - y(n)^2 + c;
    y(n+1) = 2*x(n)*y(n) + d;
end

figure(2);
plot(x(1:22), '-ob');

%% part c:
figure(3);
plot(x(1:22),y, '-ob');

%% part d:
NStartingPoint = 100;
a = (-2)+(2+2)*rand(1,NStartingPoint);
b = (-2)+(2+2)*rand(1,NStartingPoint);

%% part e:
figure(4);
plot(a,b, 'ob');

%% part f:
for Nstarting = 1:100
    x(1) = a(Nstarting);
    y(1) = b(Nstarting);
    for n = 1:(nMax-1)
        x(n+1) = x(n)^2 - y(n)^2 + c;
        y(n+1) = 2*x(n)*y(n) + d;
    end
    test = x(22);
    figure(5);
    hold on
    if (-2>x(nMax)|| x(nMax)>2 || -2>y(nMax) || y(nMax)>2)
        plot(x(1),y(1),'or');
    else
        plot(x(1),y(1),'ob');
    end
    hold off
end

%% part g:
 NStartingPoint = 1e5;
a = (-2)+(2+2)*rand(1,NStartingPoint);
b = (-2)+(2+2)*rand(1,NStartingPoint);

for Nstarting = 1:NStartingPoint
    x(1) = a(Nstarting);
    y(1) = b(Nstarting);
    for n = 1:(nMax-1)
        x(n+1) = x(n)^2 - y(n)^2 + c;
        y(n+1) = 2*x(n)*y(n) + d;
    end
    test = x(22);
    figure(6);
    hold on
    if (-2>x(nMax)|| x(nMax)>2 || -2>y(nMax) || y(nMax)>2)
        plot(x(1),y(1),'.r');
    else
    end
end
hold off

%% part h
c = 1;
d = 0.0001;

for Nstarting = 1:NStartingPoint
    x(1) = a(Nstarting);
    y(1) = b(Nstarting);
    for n = 1:(nMax-1)
        x(n+1) = x(n)^2 - y(n)^2 + c;
        y(n+1) = 2*x(n)*y(n) + d;
    end
    test = x(22);
    figure(6);
    hold on
    if (-2>x(nMax)|| x(nMax)>2 || -2>y(nMax) || y(nMax)>2)
        plot(x(1),y(1),'.r');
    else
    end
end
hold off