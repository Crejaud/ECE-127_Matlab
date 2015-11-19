% Problem 1: Part A
function [h,v]=height(t,h0,v0)
g = 9.81;
h = h0 + v0.*t -(1/2)*g.*t.^2;
v = v0 - g*t;
end