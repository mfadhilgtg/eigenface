function Imgs = Enhance(w)
%%Load Subset
img= Display1(w,1);
for N=2:size(w,2)
    img(:,:,N)=Display1(w,N);
end
%%Enhancement
%%Make the output
Imgs=[];
for N=1:size(w,2)
    temp = img(:,:,N);
    temp = localnormalize(temp,1,1);
    temp = mat2gray(temp);
    Imgs = [Imgs ;temp(:)'];
end
Imgs = Imgs.';
    