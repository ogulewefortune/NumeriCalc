function [x,y] = MidpointMethod(f,ivx,ivy,R,h)
%The function uses a midpoint between each step to extrapolate a solution
%to the differential equation
x(1)=ivx; %the initial value of x
y(1)=ivy; %the initial value of y
for i=1:ceil((R)/h) %repeat as many times as the step size will allow
    k1(i)=f(x(i),(y(i))); %calculate k1
    k2(i)=f(x(i)+0.5*h,y(i)+0.5*k1(i)*h); %calculate k2
    y(i+1)=y(i)+k2(i)*h; %find y(i+1) based on k2
    x(i+1)=x(i)+h; %find x(i+1) by adding step size
end
end