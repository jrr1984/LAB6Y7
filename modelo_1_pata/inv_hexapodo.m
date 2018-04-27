function [ Thetas ] = inv_hexapodo()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CINEMATICA INVERSA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parametros intrisnsecos del Robot
x= 0;y = -280; z = -65;
yb = -100.5; %p_y links 5,6
xa = 0; %p_x links 1,2, (-3),(-4)

a1 = 52;
a2 = 66;
a3 = 138;

theta1 = atan2(x - xa,y - yb) - 3*pi/2;

% Las coordenadas x,y,z expresadas en el sistema de ref del femur son:
coords_femur = [sqrt((x-xa)^2 + (y-yb)^2) - a1,z,0]';
norma = coords_femur(1)*coords_femur(1) + coords_femur(2)*coords_femur(2) + coords_femur(3)*coords_femur(3);
raiz = sqrt(coords_femur(1)*coords_femur(1) + coords_femur(2)*coords_femur(2) + coords_femur(3)*coords_femur(3));
theta2 = acos((a2^2 - a3^2 + norma)/(2*a2*raiz)) - atan2(coords_femur(2),coords_femur(1)) + 0.22;
theta3 = pi - acos((-a2^2 - a3^2 + norma)/(2*a2*a3)) + 0.81;

%mostramos los angulos
Thetas = [theta1,theta2,theta3].*180/pi;


end

