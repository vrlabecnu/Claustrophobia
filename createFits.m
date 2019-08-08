function [fitresult, gof] = createFits(volume, stress, fear, avoidance)
%CREATEFITS(VOLUME,STRESS,FEAR,AVOIDANCE)
%  Create fits.
%
%  Data for 'stress' fit:
%      X Input : volume
%      Y Output: stress
%  Data for 'fear' fit:
%      X Input : volume
%      Y Output: fear
%  Data for 'avoidance' fit:
%      X Input : volume
%      Y Output: avoidance
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 04-Aug-2019 21:12:28 自动生成

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 3, 1 );
gof = struct( 'sse', cell( 3, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'stress'.
[xData, yData] = prepareCurveData( volume, stress );

% Set up fittype and options.
ft = fittype( 'b/exp(x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.82144224242181 0.560932972236656];

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'stress' );
h = plot( fitresult{1}, xData, yData );
legend( h, 'stress vs. volume', 'stress', 'Location', 'NorthEast' );
% Label axes
xlabel volume
ylabel stress
grid on

%% Fit: 'fear'.
[xData, yData] = prepareCurveData( volume, fear );

% Set up fittype and options.
ft = fittype( 'b/exp(x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.19406649704477 0.940221893751699];

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'fear' );
h = plot( fitresult{2}, xData, yData );
legend( h, 'fear vs. volume', 'fear', 'Location', 'NorthEast' );
% Label axes
xlabel volume
ylabel fear
grid on

%% Fit: 'avoidance'.
[xData, yData] = prepareCurveData( volume, avoidance );

% Set up fittype and options.
ft = fittype( 'b/exp(x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.445066937805268 0.758209320551909];

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'avoidance' );
h = plot( fitresult{3}, xData, yData );
legend( h, 'avoidance vs. volume', 'avoidance', 'Location', 'NorthEast' );
% Label axes
xlabel volume
ylabel avoidance
grid on


