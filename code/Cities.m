file=fopen('Data.txt');
worldmap('World')
load coast
plotm(lat, long)
lat=file(:,1)';
lot=file(:,2)';
n=length(lat);


for i=1:n
    plotm(lat(i),lot(i),'r*');
   
end