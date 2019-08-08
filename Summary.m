clear;
volume = [1.4;1.8634;2.4192;3.0758;3.8416;4.725;5.7344;6.8782;8.1648];
rating = dlmread('RoomRating.csv',',','C2..AC31');
ratingm = mean(rating);         ratingsd = std(rating);
stressm = ratingm(1:3:27);      stresssd = ratingsd(1:3:27);
fearm = ratingm(2:3:27);        fearsd = ratingsd(2:3:27);
escapem = ratingm(3:3:27);      escapesd = ratingsd(3:3:27);

ratings = [volume,stressm',fearm',escapem',stresssd',fearsd',escapesd'];
[fitresult, gof] = createFits(volume,stressm,fearm,escapem);
x = {'slope','intercept','sse','rsq','adjrsq','rmse'};
fits(1,1) = fitresult{1}.b;     fits(2,1) = fitresult{2}.b;     fits(3,1) = fitresult{3}.b;
fits(1,2) = fitresult{1}.c;     fits(2,2) = fitresult{2}.c;     fits(3,2) = fitresult{3}.c;
fits(1,3) = gof(1).sse;         fits(2,3) = gof(2).sse;         fits(3,3) = gof(3).sse;
fits(1,4) = gof(1).rsquare;     fits(2,4) = gof(2).rsquare;     fits(3,4) = gof(3).rsquare;
fits(1,5) = gof(1).adjrsquare;	fits(2,5) = gof(2).adjrsquare;	fits(3,5) = gof(3).adjrsquare;
fits(1,6) = gof(1).rmse;        fits(2,6) = gof(2).rmse;        fits(3,6) = gof(3).rmse;
T = array2table(fits,'VariableNames',x,'RowNames',{'stress','fear','escape'});