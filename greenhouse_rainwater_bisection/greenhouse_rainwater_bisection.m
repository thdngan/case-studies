% Bisection method to compute the impact of change in atmospheric CO2
% levels in the pH of rainwater.

clc
clear all
close all

a=input('Enter function with right hand side zero:','s');
% This is the function I use for 1958: 315*10^(-13.76+x)+10^(-14+x)+630*10^(-24.06+2*x)-10^(-x)
% This is the function I use for 2003: 375*10^(-13.76+x)+10^(-14+x)+750*10^(-24.06+2*x)-10^(-x)
f=inline(a);

xl=input('Enter the first value of guess interval:');
xu=input('Enter the end value of guess interval:');

for i=2:12
fprintf("\nIteration %i:",i-1);
xr=(xu+xl)/2;
fprintf("xr=%i",xr);
if f(xu)*f(xr)<0
    xl=xr;
else
    xu=xr;
end

fprintf(" => new xl=%i",xl);
fprintf(", xu=%i",xu);
if f(xl)*f(xr)<0
    xu=xr;
else
    xl=xr;
end

xnew(1)=0;
xnew(i)=xr;
ea=abs((xnew(i)-xnew(i-1))/xnew(i))*100;
fprintf(", ea=%f percent\n",ea);
end
fprintf("\n\nThe root of the equation is %i\n",xr);
fprintf("\nThe relative error is is %i percent\n",ea);