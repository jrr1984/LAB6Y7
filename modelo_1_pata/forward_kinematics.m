function [ foottip_pose_from_universe_coordinates] = forward_kinematics(p1,p2,p3)
% FORWARD KINEMATICS
%INPUT: P1, P2 AND P3 ARE STRUCTS THAT INDICATES THE DH PARAMETERS OF THE
%LTH LINK
%input_thetas_4 are the input theta1,theta2 and theta 3. The number 4 in the name of the vector input
%indicates that you got to put a 1 on the 4th component of the vector, to
%get a computable matrix multiplication size.


%DH PARAMETERS
% theta1 = p1.theta + p1.theta_off; theta2 = p2.theta + p2.theta_off; theta3 = p3.theta + p3.theta_off;
% a1 = p1.a; a2 = p2.a; a3 = p3.a;
% alpha1=p1.alpha; alpha2=p2.alpha; alpha3=p3.alpha;
% d1 = p1.d; d2 = p2.d; d3 = p3.d;

%WE MAKE A TEST!


T0_1=matriz_transf_DH(p1);
T1_2=matriz_transf_DH(p2);
T2_3=matriz_transf_DH(p3);

T0_3 = T0_1*T1_2*T2_3;
%T3_FOOTTIP = matriz_transf_DH(p4);
%BODY PARAMETERS
ya = 60.5; %p_y links 1, (-2),3, (-4)
yb = 100.5; %p_y links 5,6
xa = 120.6; %p_x links 1,2, (-3),(-4)
% syms xa ya yb;
body_params = [  pi/4,  xa, ya; %beta, p_x , p_y FIRST LEG
                   7*pi/4,  xa,-ya; %2ND LEG
                   3*pi/4, -xa, ya; %3RD LEG
                   5*pi/4, -xa,-ya; %4TH LEG
                     pi/2,   0, yb; %5TH LEG
                   3*pi/2,   0,-yb]; %6TH LEG
P_l = [cos(body_params(6,1)), -sin(body_params(6,1)) , 0 , body_params(6,2);
       sin(body_params(6,1)), cos(body_params(6,1)) , 0 , body_params(6,3);
       0                    ,   0                  , 1 ,    0   ;
       0                    ,   0                  , 0 ,    1];
       
%WE CHECK EQ (2)
% pose_final_foottip = input_thetas_4';

%pose_final_foottip_desde_TIERRA= P_l*T0_3*T3_FOOTTIP*pose_final_foottip;
% pose_foottip= P_l*T0_3*pose_final_foottip;
% p1.alpha = pi/2; p2.alpha = 0; p3.alpha = 0;
T0_4 = P_l*T0_3;
foottip_pose_from_univ_UNROTATED = [T0_4(1,4), T0_4(2,4),T0_4(3,4)];
q_gamma_roll_en_x = pi/2;
q_beta_pitch_en_y = -(p2.theta + p3.theta);
q_alpha_yaw_en_z = p1.theta + pi/4;
angles_of_the_world = [q_gamma_roll_en_x,q_beta_pitch_en_y,q_alpha_yaw_en_z,0]';
%WE GOT THE TRANSLATION PART ALREADY MADE. NOW WE GOTTA ROTATE THE FOOTTIP
%ORIENTATION TO MATCH THE UNIVERSE COORDINATES REFERENCE FRAME.

%We create a general matrix rotation.
% syms alpha beta gamma;
% 
% R_alpha_beta_gamma = [cos(alpha)*cos(beta) , cos(alpha)*sin(beta)*sin(gamma) - sin(alpha)*cos(gamma), cos(alpha)*cos(gamma)*sin(beta) + sin(alpha)*sin(gamma);
%                       sin(alpha)*cos(beta) , sin(alpha)*sin(beta)*sin(gamma) + cos(alpha)*cos(gamma), sin(alpha)*cos(gamma)*sin(beta) - cos(alpha)*sin(gamma);
%                       -sin(beta)           , cos(beta)*sin(gamma)   , cos(beta)*cos(gamma)];
pose_inicial = [0,0,0,1]';
foottip_pose_from_univ_UNROTATED = T0_4*pose_inicial; 
foottip_pose_from_universe_coordinates = [foottip_pose_from_univ_UNROTATED,angles_of_the_world];

end

