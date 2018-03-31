%CODIGO DE FACUNDO PESSACG!!!
function pos = CD_Scorbot(q1,q2,q3,q4,q5)
format short;
% syms q1 q2 q3 q4 q5;
%q1=0; q2=pi/4; q3=pi/4; q4=pi/4; q5=pi/4;

%Parametros intrinsecos del Robot
d1 = 349;
a1 = 16;
a2 = 221;
a3 = 221;
d5 = 145;

% %Defino los parametros de DH
% p1.d=d1 ; p1.a=a1 ; p1.alfa=pi/2 ;p1.q=q1;
% p2.d=0  ; p2.a=a2  ; p2.alfa=0    ;p2.q=q2;
% p3.d=0  ; p3.a=a3  ; p3.alfa=0    ;p3.q=q3;
% p4.d=0  ; p4.a=0   ; p4.alfa=pi/2 ;p4.q=q4;
% p5.d=d5 ; p5.a=0   ; p5.alfa=0    ;p5.q=q5;
%  
% %Constriyo las transformaciones de cada junta
% T0_1=transf_DHstd(p1);
% T1_2=transf_DHstd(p2);
% T2_3=transf_DHstd(p3);
% % T3_4=transf_DHstd(p4);
% T3_4=simplify(transf_DHstd(p4));
% T4_5=transf_DHstd(p5);
% 
% %Le digo cuantos digitos quiero
% T0_1=vpa(T0_1);
% T1_2=vpa(T1_2);
% T2_3=vpa(T2_3);
% T3_4=vpa(T3_4);
% T4_5=vpa(T4_5);
% 
% %hago primero esta multiplicacion xq es RRR
% % T1_4=T1_2*T2_3*T3_4;
% T1_4=simplify(T1_2*T2_3*T3_4);
% % T1_5=simplify(T1_4*T4_5);
% % T0_5=T0_1*T1_4*T4_5;  
% T0_5=simplify(T0_1*T1_4*T4_5)  
% 
% T0_5=subs(T0_5,{q1,q2,q3,q4,q5},{q1_r,q2_r,q3_r,q4_r,q5_r});
% pos(1)=T0_5(1,4);   %x
% pos(2)=T0_5(2,4);   %y
% pos(3)=T0_5(3,4);   %z
% pos(4)=q2_r+q3_r+q4_r;    %qpich
% pos(5)=q5_r;          %qroll
pos(1)= cosd(q1)*(a1 + a2.*cosd(q2) + a3.*cosd(q2 + q3) + d5.*cosd(q2 + q3 + q4));   %x
pos(2)= sind(q1)*(a1 + a2.*cosd(q2) + a3.*cosd(q2 + q3) + d5.*cosd(q2 + q3 + q4));   %y
pos(3)= d1 + a2.*sind(q2) + a3.*sind(q2 + q3) + d5.*sind(q2 + q3 + q4) ;   %z
pos(4)= q2 + q3 + q4;    %qpich
pos(5)= q5;          %qroll

end





