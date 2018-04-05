% 	DH		Matriz de rotaci�n.
% 		R = DH(TETA, ALFA) devuelve la matriz de rotaci�n 3x3 utilizando 
%		los par�metros de Denavit-Hartenberg TETA y ALFA.
%
%		See also DENAVIT.

function R = dh(teta,alfa)

R = [cos(teta)  -cos(alfa)*sin(teta)   sin(alfa)*sin(teta)
     sin(teta)   cos(alfa)*cos(teta)  -sin(alfa)*cos(teta)
	         0              sin(alfa)             cos(alfa)];
