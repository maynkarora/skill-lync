%simulate the motion of a pendulum
clear all
close all
clc
%initial values
l=1;
m=1;
b=0.05;
g=9.81;

%theta values
q=[0;3];
t=linspace(0,20,200);
%solve
[time,result]=ode45(@(t,q) odefun(t,q,b,g,l,m),t,q);

%plot

t=1;
for i =1:length(result)
    a=result(i);
    x1=l+l*cos((3*pi/2)+a)
    y1=l+l*sin((3*pi/2)+a)
    plot([l x1],[l y1],'-o','linewidth',1.5,'color',[0 0 0],'markerfacecolor','r','markersize',10)
    axis([0 2 0 2])
    pause(0.25)
    m=getframe(gcf);
    c(t)=m;
    t=t+1;
end
movie(c)
video = VideoWriter('Pendulum.avi','Uncompressed AVI')
open(video)
writeVideo(video,c)
close(video)