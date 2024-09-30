function competitionmodel(param,initialdata)
%---------------------------------
% This MATLAB function was created for academic purposes. University of
% Alberta Winter 2022 Lab: MATH 572 (Instructor: Hao Wang) Author: Pablo V.
% (TA) Contact: venegasg@ualberta.ca -------------------------------
% Objective (1): Show the student how to use MATLAB and how the algorithm
% could be improved. 
%The student should understand the code improve it. `

%Input
%     - param : parameter vector for the competition model.
%     - rinitial data : vector with initial data.
% %Output
%     - solution of the competition model
%---------------------------------

close all
% x'=ax - bxy
% y'=my -nxy
disp('--------------')
disp('Competition model')
disp('dx/dt=ax - bxy')
disp('dy/dt=mx - nxy')
if nargin==0
    param=[1,2,1,2];
    initialdata=[2,1.5];
end
a=param(1);b=param(2);m=param(3);n=param(4);
ss1=[0,0];
if b>0 && n>0
    ss2=[m/n,a/b];
end
formatSpec = 'The parameters are: a=%d, b=%d, m=%d and n=%d';
str=sprintf(formatSpec,param);
disp(str)
formatSpec = 'The two steady states are: (0,0) and (%d,%d)';
str=sprintf(formatSpec,ss2);
disp(str)
jss1=[a 0; 0 m];
jss2=[a-b*ss2(2), -b*ss2(1); -n*ss2(2) m-n*ss2(1)];

e1=eig(jss1);
e2=eig(jss2);
str=sprintf('The eigenvalues for the Jacobian evaluated at (0,0) are: %d and %d',e1);
disp(str)
str=sprintf('The eigenvalues for the Jacobian evaluated at (%d,%d) are: %d and %d',[ss2',e2]);
disp(str)

tmax=2;
tspan=[0 tmax];
%Solution of ODE
[t,y] = ode45(@(t,y) odefcn1(param,y),tspan,initialdata);

%The graph need more information to be added
plot(t,y(:,1),'-o',t,y(:,2),'-.')
end

function dydt=odefcn1(param,y)
a=param(1);b=param(2);m=param(3);n=param(4);
    dydt=zeros(2,1);
% x'=ax - bxy
% y'=my -nxy    
    dydt(1)=a*y(1)-b*y(1)*y(2);
    dydt(2)=m*y(2)-n*y(1)*y(2);
end
