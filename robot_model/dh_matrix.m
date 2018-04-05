function [Ax] = dh_matrix( alpha, a, phi, d)
%DH_MATRIX assembles the transformation matrix according to the
%Dannevit-Hartenberg notation
% input:
%   alpha, a, phi, d .. DH parameters
% output:
%   Ax .. transformation matrix

Ax = [cos(phi)              -sin(phi)              0             a
      sin(phi)*cos(alpha)   cos(phi)*cos(alpha)    -sin(alpha)   -sin(alpha)*d;
      sin(phi)*sin(alpha)   cos(phi)*sin(alpha)    cos(alpha)    cos(alpha)*d;
      0                     0                      0             1];
end

