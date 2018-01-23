%% Face recognition with Image Size Variation
% This algorithm uses the eigenface system (based on pricipal component
% analysis - PCA) to recognize faces. For more information on this method
% refer to http://cnx.org/content/m12531/latest/

%% Clear everything before starting
clear all;close all;clc;



%% Loading the datasets into matrix w
% Check Subset Location
[ w, labels ] = loadSubset(0); %training set of 10 subjects x 7 lighting conditions x (50x50 pixels) image
[ w2, labels2 ] = loadSubset(1);% test set of 10 subjects x 12 lighting conditions x (50x50 pixels) image

%% Perform face recognition with varying image size
Range_down = 10;
Range_up = 100;
Step = 10;
Acc=[];
N = 17;
T = 100; %Threshold
for R=Range_down:Step:Range_up
    
    %% Preprocessing
    a = Resize(w,R);
    b = Resize(w2,R);
    [acc, mindist, recog] = face_recognition(a, labels, b, labels2,N);
    %[acc, mindist, recog, frr, far] = face_recg_threshold(w, labels, w2, labels2,N,T);
    Acc= [Acc, acc];
end
%%
figure, plot(Range_down:Step:Range_up,Acc); axis([Range_down Range_up 0 1]); title ('Percentage of resize vs Accuracy with 17 Eigen face')