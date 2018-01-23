function Imgs = Display1(subset,index)
%display a picture from subset
Imgs=[];
One = subset(:,index);
for N=0:49
    img = One(1+(50*N):(50*(N+1)));
    Imgs = [Imgs img];
end
%figure,imshow(Imgs);
end


