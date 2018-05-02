function copia_graf(p1,p2,p3,pata,iteraciones,errormax,pasoo)
   e1 = error_en_z_vs_porcentaje_ruido_theta_2_off(p1,p2,p3,pata,iteraciones,errormax,pasoo);
   
   e2 = error_en_z_vs_porcentaje_ruido_theta_3_off(p1,p2,p3,pata,iteraciones,errormax,pasoo);
  
   e3 = error_en_z_vs_porcentaje_ruido_a_1(p1,p2,p3,pata,iteraciones,errormax,pasoo);
   
   e4 = error_en_z_vs_porcentaje_ruido_a_2(p1,p2,p3,pata,iteraciones,errormax,pasoo);
  
   e5 = error_en_z_vs_porcentaje_ruido_a_3(p1,p2,p3,pata,iteraciones,errormax,pasoo);

    h = {e1;e2;e3;e4;e5};
 aboxplot(h,'labels',[1:pasoo:errormax],'colorgrad','red_up'); % Advanced box plot

    xlabel('Porcentaje de Ruido');% Set the X-axis label
    ylabel('Error en la posicion');
   legend('theta_2_off','theta_3_off','a_1','a_2','a_3');
end
