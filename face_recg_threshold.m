function [acc,dist,recog, FRR, FAR] = face_recg_threshold(w, labels, w2, labels2,N,T)
% w = training set,labels = training set labels
% w2 = test set,labels2 = test set labels
% N = number of eigenface components used (starting from the first
% eigenface corresponding to the highest eigenvalue)
% acc = accuracy (number of correct recognition/ total test set
% entries)
% mindist = minimum distance of a test set entry to a training set entry
% recog = recognition label, i,e the label of a training set entry which
% provides minimum distance to one test set entry
%% Initializations
v=w;                                % v contains the training set. 
% N = Number of eigenface components used for each image (max(N) = number of images in the training set)
%% Subtracting the mean from v
O=single((ones(1,size(v,2)))); 
m=single((mean(v,2)));              % m is the mean of all images.
vzm=v-(m*O);                        % vzm is v with the mean removed. 

%% Calculating eigenvectors of the correlation matrix
% We are picking N eigenfaces corresponding to the first N largest eigen values.
L=single(vzm)'*single(vzm);
[V,D]=eig(L);
V=single(vzm)*V;
V=V(:,end:-1:end-(N-1));            % Pick the eigenvectors corresponding to the N largest eigenvalues. 
%% Calculating the signature weight for each image
cv=zeros(size(v,2),N);
for i=1:size(v,2);
    cv(i,:)=single(vzm(:,i))'*V;    % Each row in cv is the signature for one image.
end

%% Recognition with Threshold
%  Now, we run the algorithm and see if we can correctly recognize the face. 
recog = [];
dist = [];
for j=1:size(w2,2)
r=w2(:,j);                        % r contains a test image
p=r-m;                            % Subtract the mean
s=single(p)'*V;
z=[];
Accept = false;
i = 1;
%%
while(i<=size(v,2) && Accept == false)
    z=[z,norm(cv(i,:)-s,2)];
    
    if z(i) <= T,
        Accept = true;
        dist = [dist,z(i)];
        recog = [recog,labels(i)];
    end
    i = i+1;
end
if(Accept == false),
    dist = [dist, 9999];
    recog = [recog,0];
end

for j=1:length(recog)
result1(j) = isequal(recog(j), labels2(j)); % result=1 if recog match labels2, 0 otherwise ACC
result2(j) = recog(j) == 0; % result=1 if recog match 0, 0 otherwise FRR
result3(j) = (recog(j)~=labels2(j)) && (recog(j)~=0) ; % result=1 if recog match 0, 0 otherwise FAR

end

acc = sum(result1)./length(result1); %accuracy
FRR = sum(result2)./length(result2); %FRR
FAR = sum(result3)./length(result2); %FAR
end







