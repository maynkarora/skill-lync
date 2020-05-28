%perform a curve fit on temperature data and find the best fit
clc
clear all
close all

%taking values
data=load("data");
%assign data
temp=data(:,1);
cp=data(:,2);

%third order polynomial
[cf,s,mu]=polyfit(temp,cp,3);
pred_cp=polyval(cf,temp,[],mu);

%first order polynomial
cf1=polyfit(temp,cp,1);
pred_cp1=polyval(cf1,temp);

%plotting
hold on
plot(temp,cp,'color','b','linewidth',3)
plot(temp,pred_cp,'color','r','linewidth',3)
plot(temp,pred_cp1,'color','g','linewidth',3)

%labels and legends
xlabel("temperature")
ylabel("Cp")
legend('original data set','third order curve fit','first order curve fit')

%finding goodness
curvefit1=fit(temp,pred_cp1,'poly1');
sse_poly1=0;
for i=1:length(cf1)
    a=curvefit1(i);
    x=(cp(i)-a)^2;
    sse_poly1=sse_poly1+x;
end
sse_poly3=0;
curvefit3=fit(temp,pred_cp,'poly3','normalize','on');
for j=1:length(cf)
    b=curvefit3(j);
    y=(cp(i)-b)^2;
    sse_poly3=sse_poly3+y;
end

%print sse values
sse_poly1
sse_poly3
