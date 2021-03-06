% RI0NIA 		Vector ri0nia.
% 	Y = RI0NIA(IRI1, I1R0NI1A, I1R0FI1A, IR0NI, IR0FI,  I1R0PI, IR0PI, IR0SI) 
%	calcula el vector 3x1 que representa el momento ejercido sobre el elemento
%	i por el elemento i-1. IRI1 es la matriz de rotaci�n del sistema de 
%	coordenadas i-�simo al (i+1)-�simo. I1R0NI1A es el vector 3x1 de momento 
%	ejercido sobre el elemento (i+1) por el elemento i. I1R0FI1A es el vector 
%	3x1 de fuerza ejercida sobre el elemento (i+1) por el elemento i. IR0NI es 
%	el vector 3x1 de fuerza externa que act�a sobre el elemento i en el centro 
%	de masa. IR0FI es el vector 3x1 de fuerza externa que act�a sobre el elemento 
%	i en el centro de masa. I1R0PI es el vector 3x1 de localizaci�n del sistema
%	de referencia (i+1)-�simo desde el i-�simo. IR0PI es el vector 3x1 de 
%	localizaci�n del sistema de referencia i-�simo desde el (i-1)-�simo.
%	IR0SI es el vector 3x1 de la posici�n del centro de masa del elemento i 
%	respecto de su sistema de coordenadas.
%
%	See also RI0FIA, RI0NI, RI0FI, RI0PI, RI0SI.

function y = ri0nia(iri1, i1r0ni1a, i1r0fi1a, ir0ni, ir0fi, i1r0pi, ir0pi, ir0si)

y = iri1*(i1r0ni1a + cross(i1r0pi, i1r0fi1a)) + cross((ir0pi+ir0si), ir0fi) + ir0ni;
