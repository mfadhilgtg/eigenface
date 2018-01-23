%% Face recognition with Threshold variation
% This algorithm uses the eigenface system (based on pricipal component
% analysis - PCA) to recognize faces. For more information on this method
% refer to http://cnx.org/content/m12531/latest/

%% Clear everything before starting
clear all;close all;clc;



%% Loading the datasets into matrix w
% Check Subset Location
[ w, labels ] = loadSubset(0); %training set of 10 subjects x 7 lighting conditions x (50x50 pixels) image
[ w2, labels2 ] = loadSubset(1);% test set of 10 subjects x 12 lighting conditions x (50x50 pixels) image

%% Preprocessing
w  = Enhance(w);
w2 = Enhance(w2);

%% For Image Resize Test
%R = 55; %R/100%
%w = Resize(w,R);
%w2 = Resize(w2,R);

%% Perform face recognition with varying Threshold
Range_down = 0;
Range_up = 300;
Step = 5;
E = 17;% Eigenface
Acc=[];Dist=[];Recog=[];FAR=[];FRR=[];
%%
for T=Range_down:Step:Range_up
    [acc, dist, recog, frr, far] = face_recg_threshold(w, labels, w2, labels2,E,T);
    Acc= [Acc, acc];
    Dist= [Dist; dist];
    Recog = [Recog; recog];
    FAR = [FAR,far];
    FRR = [FRR,frr];
end

%Plot FAR and FER
figure, plot(Range_down:Step:Range_up,Acc,':',Range_down:Step:Range_up,FAR,Range_down:Step:Range_up,FRR); axis([Range_down Range_up 0 1]); title ('FAR,FRR and Acc vs Threshold');legend('Acc','FAR','FRR')