% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Example_3_02
% ~~~~~~~~~~~~
%{
  This program uses Algorithm 3.1 and the data of Example 3.2 to solve
  Kepler's equation.
 
  e   - eccentricity
  M   - mean anomaly (rad)
  E   - eccentric anomaly (rad)
 
  User M-function required: kepler_E
%}
% ----------------------------------------------
 
clear all; clc
 
%...Data declaration for Example 3.2:
e = 0.37255;
M = 3.6029;
%...
 
%...Pass the input data to the function kepler_E, which returns E:
E = kepler_E(e, M);
 
%...Echo the input data and output to the command window:
fprintf('-----------------------------------------------------')
fprintf('\n Example 3.2\n')
fprintf('\n Eccentricity                = %g',e)
fprintf('\n Mean anomaly (radians)      = %g\n',M)
fprintf('\n Eccentric anomaly (radians) = %g',E)
fprintf('\n-----------------------------------------------------\n')
 
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
