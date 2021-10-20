function pr3
t=[0 50];
clc;
[t,X]=ode45(@Func,t,[4; 2]);
plot(t,X(:,1), t,X(:,2));
title('«Хищник-жертва» с аддитивным управлением по хищникам');
legend('Жертвы','Хищники');
end 
 
function out=Func(~,x)
a = 0.8;
aa = 0.8;
e = 0.8;
y = 0.3;
b = 0.055;

f1 = (a.*x(1)- (x(1).*x(2))./(1 + aa.*x(1)) - e.*x(1).*x(1));
f2 = (-y.*x(2) + (x(1).*x(2))./(1 + aa.*x(1)) - b.*x(2).*x(2));
 
out = [f1;f2];
end