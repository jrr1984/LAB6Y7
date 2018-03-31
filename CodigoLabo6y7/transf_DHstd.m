%CODIGO DE FACUNDO PESSACG!!!
function [T] = transf_DHstd(param)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%clear
%syms q1 q2 q3 ;

alfa=param.alfa;
a=param.a;
d=param.d;
q=param.q;


cq=cos(q);
sq=sin(q);
calfa=cos(alfa);
salfa=sin(alfa);

if (-1*1e-10 < calfa) && (calfa< 1e-10),calfa=0;end
if (-1*1e-10 < salfa) && (salfa< 1e-10),salfa=0;end

T=[cq -sq*calfa   sq*salfa   a*cq;...
   sq  cq*calfa  -cq*salfa   a*sq;...
   0   salfa         calfa      d;...
   0    0                0      1];


 end

