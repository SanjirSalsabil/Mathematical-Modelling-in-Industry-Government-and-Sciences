function error = lverr(p)
%LVERR: Function defining error function for
%example with Lotka-Volterra equations.
clear y;
years = 0:20;
H = [30.0 47.2 70.2 77.4 36.3 20.6 18.1 21.4 22.0 25.4 27.1 40.3 57.0 76.6 52.3 19.5 11.2 7.6 14.6 16.2 24.7];
L = [4.0 6.1 9.8 35.2 59.4 41.7 19.0 13.0 8.3 9.1 7.4 8.0 12.3 19.5 45.7 51.1 29.7 15.8 9.7 10.1 8.6];
[t,y] = ode23(@lvpe,years,[H(1);L(1)],[],p);
value = (y(:,1)-H').^2+(y(:,2)-L').^2;
%Primes transpose data vectors H and L
error = sum(value);