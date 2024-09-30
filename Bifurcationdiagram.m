function bifurcationdiagram
% This code gives the bifurcation diagram for the system
clear all
DU=[];DL=[]; %DU to store maximum values, DL is for minimum values
SP=[];UP=[];%SP for stable nodes, UP for unstable nodes 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%for saddle points
a=2.6;e1=0.35;delta2=0.3;delta1=0.02;b1=0.5;b2=7.5;e2=1.5;epsilon=0.2;
% the following A, B, C are the coefficients of a 2th order polynormial equation: A x^2+ B x+ C =0

for c=1.1:0.001:1.4;
    A=(epsilon*(a*c+b2*e1)-b1*e2)*c;
    
   B=(epsilon*(c+e1-a*delta1)-(epsilon*(a*c+b2*e1)-b1*e2)+a*delta2-e2)*c-(b1-b2)*(e1*delta2-e2*delta1);

   C=c*(delta2-epsilon*delta1-epsilon*c);
   
    P=[A B C];
    U=roots(P)
    
   V=(((e2-a*delta2)*c+b2*(e2*delta1-e1*delta2)).*U -c*delta2)./(c*(b1*delta2-epsilon*(c+b2*delta1)))
   
   W=(((a*delta1-e1)*c*epsilon+b1*(e1*delta2-e2*delta1)).*U+c*epsilon*delta1)./(c*(b1*delta2-epsilon*(c+b2*delta1)))
    for j=1:2
         if isreal(U(j))==1&&U(j)>0 &&V(j)>0 && W(j)>0 %%isreal(U) returns logical 1 (true) when U does not have an imaginary part. 
            u= U(j);
            v=V(j);
            w=W(j);
            J=JM(u,v,w);
           lambda=eig(J);
           
            figure(1)
            
              if real(lambda(1))<0 && real(lambda(2))<0 && real(lambda(3))<0  
                
              SP=[SP; c w];%%%stable nodes, w-component
              end
              if real(lambda(1))>0 || real(lambda(2))>0 || real(lambda(3))>0 
                
                UP=[UP; c w];% unstable nodes
              end
              %%%%%%%%%%%%%%%              
        end %this ends if isreal
    end %this ends the loop for the two roots
end %this ends the loop for c

if(length(SP)>0)
    plot(SP(:,1),SP(:,2),'b.');hold on;
end
if length(UP)>0
plot(UP(:,1),UP(:,2),'r.');hold on;
end
hold on;

%%%%%%%%next to get the bifurcation diagram%%%%%%%%%%% 
% options=odeset('RelTol',1e-6,'AbsTol',1e-6);
% y0=[0.1,0.1,0.2,];
% 
% tspan=[0 10000];
% for c=0:0.01:2;
%     [t,y]=ode45(@ex2eq,tspan,y0,options);
% % figure(4);
% % plot(t,y(:,1));
% figure(2);
% plot(t,y);
% % hold on;
% s=length(y(:,3));%Take local maximum and minimum for w values %return the length of the largest array dimension 
% temp=round(0.5*s); %rounds to the nearest integer.
% S1=y(s-temp:end,3); %take S1 as y-axis
% 
%  for j=2:(length(S1)-1)
%       if((S1(j)>S1(j-1))&&(S1(j)>S1(j+1))) %Local maximum
%            DU=[DU; c S1(j)];
%       elseif   ((S1(j)<S1(j-1))&&(S1(j)<S1(j+1))) %Local minimum
%            DL=[DL; c S1(j)];
%       end
%   end
% end;
% figure(3);
% plot(DU(:,1),DU(:,2),'bo',DL(:,1),DL(:,2),'ro');hold on;
% fsize=15;
 
    function JE=JM(u,v,w)
       JE=[1-2*u-(1+b1*v+b2*w).*(v+w)./((1+a*u+b1*v+b2*w).^2) -(u.*(1+a*u)+u.*w.*(b2-b1))./((1+a*u+b1*v+b2*w).^2) -(u.*(1+a*u)+u.*v.*(b1-b2))./((1+a*u+b1*v+b2*w).^2);
           (e1*v.*(1+b1*v)+v.*w.*(b2*e1+a*c))./((1+a*u+b1*v+b2*w).^2) (1+a*u+b2*w).*(e1*u-c*w)./((1+a*u+b1*v+b2*w).^2)-delta1 -(c*v.*(1+b1*v)+u.*v.*(b2*e1+a*c))./((1+a*u+b1*v+b2*w).^2);
           ((1+b1*v+b2*w).*e2.*w-a*epsilon*c*v.*w)./((1+a*u+b1*v+b2*w).^2) (epsilon*c*w.*(1+b2*w)+u.*w.*(a*epsilon*c-b1*e2))./((1+a*u+b1*v+b2*w).^2) (1+a*u+b1*v).*(e2*u+epsilon*c*v)./((1+a*u+b1*v+b2*w).^2)-delta2;
           ];
    end
function dydt = ex2eq(t,y)
      dydt=[y(1)*(1-y(1)-(y(2)+y(3))./(1+a*y(1)+b1*y(2)+b2*y(3)));
           y(2)*((e1*y(1)-c*y(3))./(1+a*y(1)+b1*y(2)+b2*y(3))-delta1) ;
             y(3)*((e2*y(1)+epsilon*c*y(2))./(1+a*y(1)+b1*y(2)+b2*y(3))-delta2)
               ];
    end
end

