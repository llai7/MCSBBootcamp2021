%% mini ecercise 2.3
A     = 1.1; % fluorescence intensity units
omega = 2.6; % rad/s
A_0   = 0.01;

u=@(t) A*sin(omega*t)+A_0;

tArray = linspace(0,1.6,200);
uArray = u(tArray); % an array of samples of u
difArray = zeros(1,200);
% ------------------------------------------------------

% analytical solutions (in real life, we might not know these)
dudtExact      =  A*omega*cos(omega*tArray);
du2dt2Exact    = -A*omega^2*sin(omega*tArray);
du3dt3Exact    = -A*omega^3*cos(omega*tArray);

% Take the sample and add a bit of noise
 uObserved = u(tArray) + (1e-8)*randn(size(tArray));
 
%display(uObserved);

% create finite-difference derivatives for first derivative, second derivative and third derivative
dudt   = diff(uObserved)./diff(tArray);
du2dt2 = diff(dudt)./diff(tArray(1:end-1)); %198
du3dt3 = diff(du2dt2)./diff(tArray(1:end-2));
du4dt4 = diff(du3dt3)./diff(tArray(1:end-3));

% and plot them
figure;
subplot(3,1,1); hold on;
plot(tArray(1:end-1), dudt);
plot(tArray, dudtExact, '-r');
xlabel('t');
ylabel('dudt');

subplot(3,1,2); hold on;
plot(tArray(1:end-2), du2dt2);
plot(tArray, du2dt2Exact, '-r');
xlabel('t');
ylabel('du2dt2')

subplot(3,1,3); hold on;
plot(tArray(1:end-3), du3dt3);
plot(tArray, du3dt3Exact, '-r');
xlabel('t');
ylabel('du3dt3')

for t=tArray(1:end-3)
    difArray = abs(du3dt3-du3dt3Exact(1:end-3))./du3dt3Exact(1:end-3);
end    
    display(max(err));

    
%% 3.5
% define ODE and parameters
a_0 = 500; % molecules per hour
a_1 = 0.5; % molecules per hour, per existing molecule of A
b = 4; % 1/hrs
dPdt =@(P) (a_0 + a_1*P) - b*P;

[T, P] = ode45(@(t,x)dPdt(x), [0,2.0], 0);
for nt=1:length(T)
    if (P(length(T)) - P(length(T)-2)) < 0.1
        display(P(length(T)));
        break
    end 
end


figure; hold on;
plot(T,P);
plot([0,2.0],zeros(1,2)+142.86, '-r');

