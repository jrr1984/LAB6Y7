close all
clear all

%definition of robot global pose
yaw = 0;
pitch = 0;
roll = 0;
robot_pose = zeros(7,1); %robot pose in TUM format [x,y,z,qx,qy,qz,qw]
q = r2q(r_matrix(yaw, pitch, roll))
robot_pose(4:7) = q;

%definition of joint angles
joint_angles = zeros(18,1);

%definition of which legs are in swing phase and which are in support phase
footholds = [1,0,1,0,0,1];


for coxa = 0%:pi/8:pi/2
    %testing movement of all joints
    %coxa joints
    joint_angles([1,2,7,8,13,14]) = coxa;
    %femur joints
    joint_angles([3,4,9,10,15,16]) = coxa;
    %tibia joints
    joint_angles([5,6,11,12,17,18]) = -coxa;
    
    %kinematic model of the robot
    robot_model(joint_angles,robot_pose,footholds)
    
    %plot parameters
    axis equal
    xlabel('x')
    ylabel('y')
    zlabel('z')
    pause(0.3)
    hold off
end