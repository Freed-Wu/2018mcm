file=fopen('Data.txt');
population=file(1,:);
wo_po=file(:,2);
baby=file(:,3);
time_p0=file(:,4);
pr=5*baby./wo_po 
wo_pe=wo_po./population ;
pro=pr.*wo_pe
life=eye(1,20)  
for i=1:19
life(1,i)=time_p0(i+1)/population(i);
end
L=zeros(20,20)  
L(1,:)=pro
for i=2:20
L(i,i-1)=life(i-1)
end
X=L*L*population'  
for k=2:51
     X(:,k)=L*X(:,k-1); 
end
x=2018:1:2058;
xx=[2017 x];
plot(x,X);