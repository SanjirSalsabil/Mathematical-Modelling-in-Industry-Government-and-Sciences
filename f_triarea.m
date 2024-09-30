function a=f_triarea(b,h)

if nargin==0
    b = 5;
    h = 3;
end

a = 0.5*(b.*h);