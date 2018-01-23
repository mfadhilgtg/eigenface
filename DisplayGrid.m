function Imgs = DisplayGrid(subset)
%display a picture from subset
Imgs=[];
Row1=[];Row2=[];Row3=[];Row4=[];Row5=[];Row6=[];Row7=[];Row8=[];Row9=[];Row10=[];

A=0;
B=(size(subset,2)/10);
for N=1:B
    img=Display1(subset,B*A+N);
    Row1=[Row1 img];
end

A=1;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row2=[Row2 img];
end

A=2;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row3=[Row3 img];
end

A=3;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row4=[Row4 img];
end

A=4;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row5=[Row5 img];
end

A=5;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row6=[Row6 img];
end

A=6;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row7=[Row7 img];
end

A=7;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row8=[Row8 img];
end

A=8;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row9=[Row9 img];
end

A=9;
for N=1:(size(subset,2)/10)
    img=Display1(subset,B*A+N);
    Row10=[Row10 img];
end

Imgs = [Row1;Row2;Row3;Row4;Row5;Row6;Row7;Row8;Row9;Row10];

figure,imshow(Imgs);
end


