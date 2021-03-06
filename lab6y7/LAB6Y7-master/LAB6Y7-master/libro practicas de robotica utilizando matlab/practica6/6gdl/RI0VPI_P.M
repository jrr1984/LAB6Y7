% RI0VPI_P 		Vector ri0vpi_p.
% 	Y = RI0VPI_P(IRI_1, I_1R0VPI_1, IR0WPI, IR0WI, IR0PI, QPI, QPPI) calcula el 
%	vector 3x1 que representa la aceleraci�n lineal de la articulaci�n
%	prism�tica i-�sima respecto al sistema de coordenadas i-�simo. IRI_1 
%	es la matriz de rotaci�n del sistema de coordenadas i-�simo al (i-1)-�simo. 
%	I_1R0VPI_1 es el vector 3x1 de aceleraci�n lineal de la articulaci�n 
%	(i-1)-�sima. IR0WPI es el vector 3x1 de aceleraci�n angular de la articulaci�n 
%	i-�sima. IR0WI es el vector 3x1 de velocidad angular de la articulaci�n 
%	i-�sima. IR0PI es el vector 3x1 de localizaci�n de (xi,yi,zi) desde el 
%	origen de (xi-1,yi-1,zi-1) con respecto al sistema de coordenadas i-�simo.
%	QPI es la magnitud de la velocidad angular de la articulaci�n i-�sima respecto 
%	del elemento i-1. QPPI es la magnitud de la aceleraci�n angular de la 
%	articulaci�n i-�sima respecto del elemento i-1.
%
%	See also RI0WPI, RI0WI, RI0PI.

function y = ri0vpi_p(iri_1, i_1r0vpi_1, ir0wpi, ir0wi, ir0pi, qpi, qppi)

z = [0; 0; 1];
a = ir0wi;
b = cross(a, ir0pi);
c = cross(a, b);
y = iri_1*(z*qppi + i_1r0vpi_1) + cross(ir0wpi, ir0pi) + 2*(cross(ir0wi, ((iri_1)*(z*qpi)))) + c;
