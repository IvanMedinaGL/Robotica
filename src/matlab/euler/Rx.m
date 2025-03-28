function R = Rx(theta)
%Rx realiza una rotación en un ángulo theta en radianes con respecto al eje X

R = [1,     0,          0
    0, cos(theta), -sin(theta)
    0, sin(theta), cos(theta)];