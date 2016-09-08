% PS1 P12
% Metrics 3
% Attila Gyetvai

% Initialization
clear
clc

% Parameters
n   = 100;
mu  = [0, 0.1, 0.2, 0.3, 0.4, 0.5];
rep = 2000;

% Seed
rng(09072016);

% Preallocating matrices
X      = zeros(n, rep, length(mu));
Xmean  = zeros(1, rep, length(mu));
fXmean = zeros(1, rep, length(mu));
plots  = zeros(1, 100, length(mu));

% Simulation
for i = 1:length(mu)
    X(:,:,i)      = randn(n, rep) + mu(i);
    Xmean(:,:,i)  = mean(X(:,:,i));
    fXmean(:,:,i) = exp(Xmean(:,:,i).^2);
    plots(:,:,i)  = ksdensity(fXmean(:,:,i));
end

% Plotting
legendInfo = cell(length(mu), 1);    % Preallocating legend info array
plotStyle = {'b', 'm', 'y', 'c', 'r', 'g'};    % Line colors
figure
hold on
for i = 1:length(mu)
    plot(plots(:,:,i), plotStyle{i})
    legendInfo{i} = ['\mu = ' num2str(mu(i))];
end
hold off
leg = legend(legendInfo);
set(leg, 'Interpreter', 'latex')
legend(legendInfo)