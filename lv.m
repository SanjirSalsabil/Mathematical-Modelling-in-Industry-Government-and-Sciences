function yprime = lv(t,y)
%LV: Contains Lotka-Volterra equations
a = .47; b = .024; c = .023; r = .76;
yprime = [a*y(1)-b*y(1)*y(2)
          -r*y(2)+c*y(1)*y(2)];