in=textscan('Factor.txt');
out=textscan('Increase.txt');
out=out.*100;
k=rand(1,22);
[m,n]=sort(k);
it=in(n(1:18),:)';
ot=out(n(1:18),:)';
itt=in(n(19:22),:)';
ott=out(n(19:22),:)';
[ipn,ips]=mapminmax(it);
[otn,ots]=mapminmax(ot);
net=newff(ipn,otn,9,{''},'trainbfg');
net.trainParam.epochs=500;
net.trainParam.Ir=0.01;
net.trainParam.goal=0.00005;
net=train(net,ipn,otn);
ipnt=mapminmax('apply',itt,ips);
an=sim(net,ipnt);
otnt=mapminmax('reverse',an,ots);
figure(1);
plot(otnt,':og');
hold on
plot(ott,'-*');
legend('prediction','desired')
title('BP neutral network prediction output','fontsize',12)
ylabel('output','fontsize',12)
ylabel('sample','fontsize',12)
figure(2)
error=otnt-ott;
plot(error,'-*')
title('BP neutral network prediction error','fontsize',12)
ylabel('error','fontsize',12)
ylabel('sample','fontsize',12)
otnt=oynt./10;