function [ Thetas ] = inv_hexapodo(x,y,z)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   syms theta1 theta2 theta3;
    syms q1 q2 q3;
    %x = 0;
    %y = 0.2;
    %z = 0; 
    %qpich = 0; % -40<qpich<220 
    %qroll = 0; % -570<qyaw<570
    %qyaw  = 0;  % qroll siempre va a ser 0, ya que depende de q1

%Parametros intrisnsecos del Robot
ya = 0.0605; %p_y links 1, (-2),3, (-4)
yb = 0.1005; %p_y links 5,6
xa = 0.1206; %p_x links 1,2, (-3),(-4)
%body_params = [  pi/4,  xa, ya;
%                   7*pi/4,  xa,-ya;
%                   3*pi/4, -xa, ya;
%                   5*pi/4, -xa,-ya;
%                     pi/2,   0, yb;
%                   3*pi/2,   0,-yb];
%Defino los parametros de DH
a1 = 0.052;
a2 = 0.066;
a3 = 0.138;
m1.d=0; m1.a=a1 ; m1.alfa=pi/2  ;m1.theta=theta1;
m2.d=0; m2.a=a2  ; m2.alfa=0    ;m2.theta=theta2 - 0.22;
m3.d=0; m3.a=a3  ; m3.alfa=0    ;m3.theta=theta3 - 0.81;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CINEMATICA INVERSA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculo q1 que es qroll
theta1 = atan2(x - xa,y - ya) - pi/4;


% Las coordenadas x,y,z expresadas en el sistema de ref del femur son:
coords_femur = [sqrt(x^2 + y^2) - a1;z;0]';
norma = coords_femur(1).*coords_femur(1) + coords_femur(2).*coords_femur(2) + coords_femur(3).*coords_femur(3);
raiz = sqrt(coords_femur(1).*coords_femur(1) + coords_femur(2).*coords_femur(2) + coords_femur(3).*coords_femur(3));
theta2 = acos((a2^2 - a3^2 + norma)/(2*a2*raiz)) - atan2(coords_femur(2),coords_femur(1)) - 0.22;
theta3 = pi - acos((a2^2 + a3^2 - norma)/(2*a2*a3)) - 0.81;

%muestro los angulos
Thetas = [theta1,theta2,theta3];


end

