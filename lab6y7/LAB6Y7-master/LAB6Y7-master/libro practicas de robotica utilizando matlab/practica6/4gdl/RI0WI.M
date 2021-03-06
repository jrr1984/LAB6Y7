% RI0WI 		Vector ri0wi.
% 	Y = RI0WI(IRI_1, I_1R0WI_1, QPI) calcula el vector 3x1 que representa 
%	la	velocidad angular de la articulaci�n i-�sima respecto al sistema de
%	coordenadas i-�simo. IRI_1 es la matriz de rotaci�n del sistema de 
%	coordenadas i-�simo al (i-1)-�simo. I_1R0WI_1 es el vector 3x1 de velocidad 
%	angular de la articulaci�n (i-1)-�sima. QPI es la magnitud de la velocidad 
%	angular de la articulaci�n i-�sima respecto del elemento i-1.

function y = ri0wi(iri_1, i_1r0wi_1, qpi)

z = [0; 0; 1];
y = iri_1*(i_1r0wi_1 + z*qpi);
