%LVPERUN: MATLAB script M-file to run Lotka-Volterra
%parameter estimation example.
guess = [.47; .024; .023; .76];
[p,error]=fminsearch(@lverr, guess)
[t,y]=ode23(@lvpe,[0,20],[30.0; 4.0],[],p);
years = 0:20;
H = [30.0 47.2 70.2 77.4 36.3 20.6 18.1 21.4 22.0 25.4 27.1 40.3 57.0 76.6 52.3 19.5 11.2 7.6 14.6 16.2 24.7];
L = [4.0 6.1 9.8 35.2 59.4 41.7 19.0 13.0 8.3 9.1 7.4 8.0 12.3 19.5 45.7 51.1 29.7 15.8 9.7 10.1 8.6];
subplot(2,1,1)
plot(t,y(:,1),years,H,'o')
subplot(2,1,2)
plot(t,y(:,2),years,L,'o')