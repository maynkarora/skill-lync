%forward kinematics of a robotic arm
%link parameters(lengths and angles)
l1=5
l2=3
theta1=linspace(1,90,10)
theta2=linspace(1,90,10)
ct=1
for i = 1:length(theta1)
    a=theta1(i)
    for j =1:length(theta2)
        b=theta2(j)
    
%lines
        x1=l1*cosd(a)
        y1=l1*sind(a)

        x2=x1+l2*cosd(b)
        y2=y1+l2*sind(b)
        
%plotting
        
        plot([0 x1],[0 y1],[x1 x2],[y1 y2],'linewidth',2)
        xlim([-10 10])
        ylim([0 20])
        pause(0.1)
        m(ct)=getframe(gcf);
        ct=ct+1;
    end
end
movie(m)
vid=VideoWriter('fwd_kinems.avi','uncompressed AVI')
open(vid)
writeVideo(vid,m)
close(vid)