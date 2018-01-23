%% Face recognition
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

%% Perform face recognition with varying N (number of eigenface components)
Acc=[];MinDist=[];Recog=[];
T = 100; %Threshold
for N=1:20
    %[acc, mindist, recog] = face_recognition(w, labels, w2, labels2,N);
    [acc, mindist, recog, frr, far] = face_recg_threshold(w, labels, w2, labels2,N,T);
    Acc= [Acc, acc];
    MinDist= [MinDist; mindist];
    Recog = [Recog; recog];
end

figure, plot(1:1:20,Acc); axis([1 20 0 1]); title ('Number of EigenFace Components vs Accuracy')