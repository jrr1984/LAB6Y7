% F_P 		Vector de fuerzas articulares.
% 	Y = F_P(IRI_1, IR0FIA, QPI, BI) calcula el vector 3x1 que representa 
%	la fuerza de entrada a la articulaci�n i. IRI_1 es la matriz de rotaci�n 
%	del sistema de coordenadas i-�simo al (i-1)-�simo. IR0FIA es el vector 
%	3x1 de fuerza ejercida sobre el elemento i por el elemento i-1. QPI es 
%	la magnitud de la velocidad de la articulaci�n i-�sima respecto del elemento 
%	i-1. BI es el coeficiente de amortiguamiento viscoso para la articulaci�n i.
%
%	See also RI0FIA.

function y = f_p(iri_1, ir0fia, qpi, bi);

z = [0; 0; 1];
y = ir0fia'*(iri_1*z) + bi*qpi;
