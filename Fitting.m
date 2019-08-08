clear;
volume = [1.4;1.8634;2.4192;3.0758;3.8416;4.725;5.7344;6.8782;8.1648];
rating = dlmread('RoomRating.csv',',','C2..AC31');
for isub = 1:30
    istress = rating(isub,1:3:27);
    ifear = rating(isub,2:3:27);
    iescape = rating(isub,3:3:27);
    [fitresult, gof] = createFits(volume,istress,ifear,iescape);
    slope(isub,1) = fitresult{1}.b;     slope(isub,2) = fitresult{2}.b;     slope(isub,3) = fitresult{3}.b;
    intercept(isub,1) = fitresult{1}.c; intercept(isub,2) = fitresult{2}.c; intercept(isub,3) = fitresult{3}.c;
    % stats
    sse(isub,1) = gof(1).sse;           sse(isub,2) = gof(2).sse;           sse(isub,3) = gof(3).sse;
    rsq(isub,1) = gof(1).rsquare;       rsq(isub,2) = gof(2).rsquare;       rsq(isub,3) = gof(3).rsquare;
    adjrsq(isub,1) = gof(1).adjrsquare; adjrsq(isub,2) = gof(2).adjrsquare; adjrsq(isub,3) = gof(3).adjrsquare;
    rmse(isub,1) = gof(1).rmse;         rmse(isub,2) = gof(2).rmse;         rmse(isub,3) = gof(3).rmse;
    close all;
end
clear isub istress ifear iescape

x = {'slope','intercept','sse','rsq','adjrsq','rmse'};
stress(:,1) = slope(:,1);	stress(:,2) = intercept(:,1);
stress(:,3) = sse(:,1);     stress(:,4) = rsq(:,1);     stress(:,5) = adjrsq(:,1);      stress(:,6) = rmse(:,1);
fear(:,1) = slope(:,2);     fear(:,2) = intercept(:,2);
fear(:,3) = sse(:,2);       fear(:,4) = rsq(:,2);       fear(:,5) = adjrsq(:,2);        fear(:,6) = rmse(:,2);
escape(:,1) = slope(:,3);	escape(:,2) = intercept(:,3);
escape(:,3) = sse(:,3);     escape(:,4) = rsq(:,3);     escape(:,5) = adjrsq(:,3);      escape(:,6) = rmse(:,3);

%% correlations
[r1,p1] = corr(stress(:,1),stress(:,2));        disp(['stress: r = ' num2str(r1) '; p = ' num2str(p1)]);
[r2,p2] = corr(fear(:,1),fear(:,2));            disp(['fear: r = ' num2str(r2) '; p = ' num2str(p2)]);
[r3,p3] = corr(escape(:,1),escape(:,2));        disp(['escape: r = ' num2str(r3) '; p = ' num2str(p3)]);