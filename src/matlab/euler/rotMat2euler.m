function euler = rotMat2euler(R, secuencia)
%rotMat2euler Convierte una matriz de rotación a la orientación en ángulos de Euler.
%
% Ejemplo de uso:
% R = [-1 0 0
%       0 0 1
%       0 1 0];
% secuencia = "XYZ"
% euler = rotMat2euler(R, secuencia)

% Obtén las ecuaciones de la imagen
if secuencia == "XYZ"
    phi =  atan((-R(2,3))/R(3,3));     % phi:   rotación alrededor del eje X
    theta = asin(R(1,3));     % theta: rotación alrededor del eje Y
    psi =atan(-R(1,2)/R(1,1));      % psi:   rotación alrededor del eje Z
    euler = [phi;theta;psi;];
end
