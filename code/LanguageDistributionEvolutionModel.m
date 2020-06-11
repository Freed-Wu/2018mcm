yl=imread('C:\Users\89324\Desktop\Language distribution.jpg'); %load data
content=fopen('L1 and L2 population.txt');
scope=fopen('scope');
x1=scope(:,1)';
x2=scope(:,2)';
y1=scope(:,3)';
y2=scope(:,4)';
RGB=fopen('RGB');
rr=RGB(:,1)';
gg=RGB(:,2)';
bb=RGB(:,3)';
r=yl(:,:,1);
g=yl(:,:,2);
b=yl(:,:,3);
[l,w]=size(r);
L1_PO=content(:,1)';L2_PO=content(:,2)';
n=length(laty);
lot=l/360;
lat=w/180;  %Calculate the location of the city in the image.
for i=1:12
    x1f(i)=floor(x1(i)*lat);
    y1f(i)=floor(y1(i)*lot);
    x2f(i)=floor(x2(i)*lat);
    y2f(i)=floor(y2(i)*lot);
end
L_P=L1_PO+L2_PO;
for i=1:n
    [indicator,is]=mapmaxmin(L_P);

if incicator<=0.25   %Identify four indicators
    flag(i)=1;
elseif incicator>=0.25&&incicator<=0.5
    flag(i)=2;
elseif incicator>=0.5&&incicator<=0.75
    flag(i)=3;
elseif incicator>=0.75
    flag(i)=4;
end
k=6.*floor(rand(1,100));    %Each level represents 6 pixels

for i=1:n-1
    for j=1:n-i %To calculate the population distribution level in the corresponding area
        
        if x1f(i)<=x1f(i+j)&&x2(i)>=x1f(i+j)||y1f(i)<=y1f(i+j)&&y2f(i)>=y1f(i+j)
            m=flag(i)-flag(i+j);
            flag(i)=m;
            flag(i+j)=-m;
        end
    end
end
for i=1:l
    for j=1:w

     if r(i,j)~=208&&g(i,j)~=230&&b(i,j)~=251 %If it is the ocean, how not to change color, the parameter is the sea default value.
            flag1(i,j)=1;
            flag2(i,j)=1;
            flag3(i,j)=1;
     else
        flag1(i,j)=2.04;
        flag2(i,j)=0.9;
        flag3(i,j)=0.98;
     end
    end
end

for i=1:n  %Draw pictures in the corresponding area.
    for qq=1:flag(i)*k
        
                     r(x1(i)-qq,y1(i))=flag1(x1(i)-qq,y1(i))*rr(i);
                     r(x1(i)-qq,y1(i)-qq)=flag1(x1(i)-qq,y1(i)-qq)*rr(i);
                     r(x1(i),y1(i)-qq)=rr(i)*flag1(x1(i),y1(i)-qq);
                     r(x2(i)+qq,y2(i))=flag1(x2(i)+qq,y2(i))*rr(i);
                     r(x2(i)+qq,y2(i)+qq)=flag1(x2(i)+qq,y2(i)+qq)*rr(i);
                     r(x2(i),y2(i)+qq)=rr(i)*flag1(x2(i),y2(i)+qq);
                     g(x1(i)-qq,y1(i))=flag2(x1(i)-qq,y1(i))*gg(i);
                     g(x1(i)-qq,y1(i)-qq)=flag2(x1(i)-qq,y1(i)-qq)*gg(i);
                     g(x1(i),y1(i)-qq)=flag2(x1(i),y1(i)-qq)*gg(i);
                     g(x2(i)+qq,y2(i))=flag2(x2(i)+qq,y2(i))*gg(i);
                     g(x2(i)+qq,y2(i)+qq)=flag2(x2(i)+qq,y2(i)+qq)*gg(i);
                     g(x2(i),y2(i)+qq)=flag2(x2(i),y2(i)+qq)*gg(i);
                     b(x1(i)-qq,y1(i))=flag3(x1(i)-qq,y1(i))*bb(i);
                     b(x1(i),y1(i)-qq)=flag3(x1(i),y1(i)-qq)*bb(i);
                     b(x1(i)-qq,y1(i)-qq)=flag3(x1(i)-qq,y1(i)-qq)*bb(i);
                       b(x2(i)+qq,y2(i))=flag3(x2(i)+qq,y2(i))*bb(i);
                     b(x2(i),y2(i)+qq)=flag3(x2(i),y2(i)+qq)*bb(i);
                     b(x2(i)+qq,y2(i)+qq)=flag3(x2(i)+qq,y2(i)+qq)*bb(i);
    end
end

imdata(:,:,1)=r;imdata(:,:,2)=g;imdata(:,:,3)=b; %Save the image matrix display
imwrite(imdata,'Language distribution.jpg');
imshow('Language distribution.jpg')