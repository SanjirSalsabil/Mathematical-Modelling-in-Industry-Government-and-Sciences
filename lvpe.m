function value = lvpe(t,y,p)
%LVPE: ODE for example Lotka-Volterra parameter
%estimation example. p(1)=a, p(2) = b, p(3) = c, p(4) = r.
value=[p(1)*y(1)-p(2)*y(1)*y(2)
       -p(4)*y(2)+p(3)*y(1)*y(2)];