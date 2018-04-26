function [ vector_error, error_medido] = graficador_error_vs_porcentaje_ruido(p1,p2,p3,input_thetas_4)
    %ESTUDIO_ERROR Summary of this function goes here
    %   Detailed explanation goes here

    num_iters = 2;
    %pose_real = forward_kinematics(p1,p2,p3,input_thetas_4).*ones(4,num_iters);
    pose_real = forward_kinematics(p1,p2,p3,input_thetas_4);
    error_max = 2;
    paso = 1;
     
    theta_off_elegido = p2.theta_off;
% error_medido = zeros(100);
    %WE PREALLOCATE MEMORY TO MAKE THE COMPUTATION FASTER
    vector_error = zeros(4,num_iters);
%     error_medido = zeros(4,error_max/paso);
    for porcentajeError = 1:paso:error_max

        for iteracion = 1:1:num_iters
            p2.theta_off = theta_off_elegido + porcentajeError/100*p2.theta_off*rand();
            poseError = forward_kinematics(p1,p2,p3,input_thetas_4);
            vector_error(:,iteracion,porcentajeError) = -(poseError - pose_real );
        end
    for fila =1:1:3
               error_medido(fila,:,porcentajeError) = mean(vector_error(fila,:,porcentajeError));
%          error_medido(porcentajeError) = mean(vector_error(:,:,porcentajeError));
             %error_medido(porcentajeError)= mean(vector_error(1:3,),2);
    end
    porcentaje = 1:paso:error_max;

    end

end
