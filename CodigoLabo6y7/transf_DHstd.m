%CODIGO DE FACUNDO PESSACG!!!
%DENAVIT    Matriz de Transformación Homogénea
%Esta función devuelve la matriz de transformación homogénea de 4x4, a
%partir de los parámetros de D-H: d_i, a_i, alpha_i, theta_i.
function [T] = transf_DHstd(param)
%param es un objeto con distintas propiedades/atributos: alpha, a, d, q.
%clear
%syms q1 q2 q3 ;
%definimos los atributos del objeto param.
alfa=param.alfa;
a=param.a;
d=param.d;
q=param.q;

%las definiciones de abajo son ESTRICTAMENTE necesarias, para no tener
%conflictos de nombre. Esto es, cuando la función quiera calcular 
cq=cos(q);
sq=sin(q);
calfa=cos(alfa);
salfa=sin(alfa);

%0 es 0 jej solo que la compu no lo sabe, entonces se lo asignamos.
if (-1*1e-10 < calfa) && (calfa< 1e-10),calfa=0;end
if (-1*1e-10 < salfa) && (salfa< 1e-10),salfa=0;end

T=[cq -sq*calfa   sq*salfa   a*cq;...
   sq  cq*calfa  -cq*salfa   a*sq;...
   0   salfa         calfa      d;...
   0    0                0      1];


 end