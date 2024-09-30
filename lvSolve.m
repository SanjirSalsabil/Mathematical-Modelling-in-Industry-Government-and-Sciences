[t,y]=ode23(@lv,[1 21],[30 4]);
years=1:21;
subplot(2,1,1);
plot(t,y(:,1),years,H,'o')
subplot(2,1,2)
plot(t,y(:,2),years,L,'o')