n  = 100;
mu = [0, 0.1, 0.2, 0.3, 0.4, 0.5];
rep = 2000;

rng(09072016);

X = zeros(n, rep, length(mu));
for i=1:length(mu)
    X = randn(n, rep);
    fX = exp(X.^2);
    fXmean = mean(fX);
    plot03 = ksdensity(fXmean);
end

plot(plot03)