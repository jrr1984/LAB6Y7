clear all;
clc;

theta1 = 0; theta2 = 0;    theta3 = 0;
theta1_off = 0; theta2_off = -0.22; theta3_off = -0.81;
a1 = 52; a2 = 66; a3 = 138;


alpha1 = pi/2; alpha2 = 0; alpha3 = 0;

d1 = 0; d2 =0; d3=0;

p1.theta = theta1; p2.theta = theta2; p3.theta = theta3;
p1.theta_off = theta1_off; p2.theta_off = theta2_off; p3.theta_off = theta3_off;
p1.a= a1; p2.a = a2; p3.a = a3;

p1.alpha = alpha1; p2.alpha = alpha2; p3.alpha = alpha3;

p1.d = d1; p2.d = d2; p3.d = d3;

pose_final_foottip = [0,0,0,1];
input_thetas_4 = [0,0,0,1];

forward_kinematics(p1,p2,p3,pose_final_foottip)