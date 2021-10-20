function pr4
clc;
t=0:0.1:50;
for x0 = 0:1:10
    for y0 = 0:1:10
        [t,X]=ode45(@Func,t,[x0; y0]);
        plot(X(:,1),X(:,2));
        hold on;
    end
end
title('«Хищник-жертва» с аддитивным управлением по хищникам');
end 
 
function out=Func(~,x)
a = 0.8;
aa = 0.8;
e = 0.8;
y = 0.3;
b = 0.055;
xx = 0.4;
T = 1;
 
u = - (x(1) - xx)/T - (a.*x(1)- (x(1).*x(2))./(1 + aa.*x(1)) - e.*x(1).*x(1));
f1 = (a.*x(1)- (x(1).*x(2))./(1 + aa.*x(1)) - e.*x(1).*x(1)+u);
f2 = (-y.*x(2) + (x(1).*x(2))./(1 + aa.*x(1)) - b.*x(2).*x(2));
 
out = [f1;f2];
end
