score1=fopen('score.txt');
score=score1
lb1=1;ub1=0;
lb2=1;ub2=0;
lb3=1;ub3=0;
lb4=1;ub4=0;
lb5=1;ub5=0;
lb6=1;ub6=0;
NIND=100;
MAXGEN=100;
PRECI=10;
GGAP=0.96;
px=0.7;
pm=0.01;
trace=zeros(7,MAXGEN);
FieldD=[PRECI PRECI PRECI PRECI PRECI PRECI PRECI;lb1 lb2 lb3 lb4 lb5 lb6 lb7;ub1 ub2 ub3 ub4 ub5 ub6 ub7;1 1 1 1 1 1 1 ; 0 0 0 0 0 0 0; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1];
Chrom=crtbp(NIND,PRECI*7);
gen=0;
XY=bs2v(Chrom,FieldD);
x(:,1)=XY(:,1);x(:,2)=XY(:,2);x(:,3)=XY(:,3);x(:,4)=XY(:,4);x(:,5)=XY(:,5);x(:,6)=XY(:,6);
for i=1:6
    ObjV=ObjV+x(:,i).*score(:,i)
end
while gen<MAXGEN
    FitnV=ranking
    Selch=select('sus',Chrom,FitnV,GGAP);
    Selch=recombin('xovsp',Selch,px);
    Selch=mut(Selch,pm);
    XY=bs2v(Chrom,FieldD);
x(:,1)=XY(:,1);x(:,2)=XY(:,2);x(:,3)=XY(:,3);x(:,4)=XY(:,4);x(:,5)=XY(:,5);x(:,6)=XY(:,6);
for i=1:6
    ObjV=ObjV+x(:,i).*score(:,i)
end
[Chrom,ObjV]=reins(Chrom,FieldD,Selch,1,1,ObjV,ObjVSel);
XY=bs2v(Chrom,FieldD);
gen=gen+1;
[Y,I]=max(ObjV);
trace(1:6,gen)=XY(I,:);
trace(7,gen)=Y;
end
for i=1:7;
    best(i)=trace(i,end);
end
best