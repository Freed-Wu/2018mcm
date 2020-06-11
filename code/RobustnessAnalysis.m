data=fopen('result.txt');
4_input=data(:,1)';
3_input=data(:,2)';
plot(4_input,'r*')
hold on
plot(3_input,'g+')