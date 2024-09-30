% TwoDifferenceEquations.m - this MATLAB file simulates the host-parasitoid model 
k=2;   %parameter input
a=1;   %parameter input
c=1;   %parameter input
x0=1;   %input('input initial population x0 of host:     ')
y0=1;   %input('input initial population y0 of parasitoid:     ')
n=60;  %input('input time period of run:     ')
x=zeros(n+1,1);
y=zeros(n+1,1);
t=zeros(n+1,1);
x(1)=x0;
y(1)=y0;
for i=1:n
t(i)=i-1;
x(i+1)=k*x(i)*exp(-a*y(i));
y(i+1)=c*x(i)*(1-exp(-a*y(i)));
end
t(n+1)=n;
figure
subplot(221)
plot(t,x,t,x,'o')
title('Host values')
subplot(222)
plot(t,y,t,y,'*')
title('Parasitoid values')
subplot(223)
plot(t,y,t,x,t,x,'o',t,y,'*')
title('Host and parasitoid values')
subplot(224)
plot(x,y,'o-')
title('Host vs parasitoid');
