function R = Rz(theta)
%Rz realiza una rotación en un ángulo theta en radianes con respecto al eje z

R = [cos(theta), -sin(theta), 0
     sin(theta), cos(theta),  0
        0      , 0         ,  1];