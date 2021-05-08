function [y] = rast(X)
x1=X(1,1);
x2=X(1,2);
A=10;
n=2;
y = -330 + A*n +[(x1)^2- A*cos(2*pi*x1)]+[(x2)^2- A*cos(2*pi*x2)];
