function cobwebb_p_logistic(N0,r)
%---------------------------------
% This MATLAB function was created for academic purposes. University of
% Alberta Winter 2022 Lab: MATH 572 (Instructor: Hao Wang) Author: Pablo V.
% (TA) Contact: venegasg@ualberta.ca -------------------------------
% Objective (1): Show the student how to use MATLAB and how the algorithm
% could be improved. 
%The student should understand how the cobwebb
% diagram is produced by using this code and improve it. ` %Input
%     - N0 : Initial data. - r : Growth rate.
% %Output
%     - Cobwebb diagram - Solutions of the Logistic Difference Equation at
%     moment n
%---------------------------------
if nargin==0
    N0=0.1;r=3.2;
end
cb_x=1;cb_y=1;
n=35;
close all
x_g=[];
y_g=[];
N(1)=N0;
x=[0:.01:100];
mov(1:n) = struct('cdata', [], 'colormap', []);

cTitle=['Cobwebbing Logistic Equation: $x_{n+1}=$',num2str(r),'$x_n/(1-x_n)$'];%Logistic
nTitle=['Logistic Difference Equation: $x_{n+1}=$',num2str(r),'$x_n/(1-x_n)$'];%Logistic
figure('units','normalized','outerposition',[.23 .1 .45 .9])

subplot(2,1,1)
plot([0:cb_x],[0:cb_y],'--red','LineWidth',.5)
m_m=max(funcion_6(x,r));
axis([0 cb_x 0 cb_y]);
hold on

plot(x,funcion_6(x,r),'-.Blue','LineWidth',1.5)
title(cTitle,'interpreter','latex','FontSize', 20);
%title(['Cobwebbing Logistic Equation:
%$x_{n+1}=$',num2str(r),'$x_n$'],'interpreter','latex','FontSize', 20);
xlabel('$x_{n}$','interpreter','latex','FontSize', 20);
ylabel('$x_{n+1}$','interpreter','latex','FontSize', 20);

subplot(2,1,2)
plot([])
axis([0 n-3 0 cb_y]);
title(nTitle,'interpreter','latex','FontSize', 20);
%title(['Cobwebbing Logistic Equation:
%$x_{n+1}=$',num2str(r),'$x_n$'],'interpreter','latex','FontSize', 20);
xlabel('$n$','interpreter','latex','FontSize', 20);
ylabel('$x_{n}$','interpreter','latex','FontSize', 20);

pause
for i=2:n
    N(i)=funcion_6(N(i-1),r);
    subplot(2,1,1)
    plot([N(i-1),N(i-1),N(i)],[N(i-1), N(i), N(i)],'-black','LineWidth',2)
    axis([0 cb_x 0 cb_y]);
    x_g(i-1)=i-2;
    y_g(i-1)=N(i-1);
    subplot(2,1,2)
    plot(i-2,N(i-1),'*black')
    plot(i-1,N(i),'*black')
    title(nTitle,'interpreter','latex','FontSize', 20);
    %title(,'interpreter','latex','FontSize', 20);
    xlabel('$n$','interpreter','latex','FontSize', 20);
    ylabel('$x_{n}$','interpreter','latex','FontSize', 20);
    axis([0 n-3 0 cb_y]);
    hold on
    mov(i) = getframe(gcf);
    
end
x_g(end)=n;
y_g(end)=N(n);
subplot(2,1,2)
plot(x_g,y_g,'-black','LineWidth',2)
axis([0 n-3 0 cb_y]);



end

function f=funcion_6(N0,r)
f=r*N0.*(1-N0);
%f=r*N0; f=r*N0./(1+N0);
end


