function x = fakeaerodynamics( x0, u, dt )
% FAKEAERODTNAMICS
%   x = fakeaerodynamics( x0, u, dt ) is a function to simulate 6 dof of 
%   Hong-Gu, the solar-powered fixed-wing aircraft. The state equation is
%   constructed as:
%   
%       .
%       x = Ax + Bu
%       y = Cx + Du
%   
%   or the transfer function:
% 
%               NUM(s)          -1
%       H(s) = -------- = C(sI-A) B + D
%               DEN(s)
% 
%   the A matrix is 8x8 and B matrix is 8x4, the definition of each term 
%   was defined in [1].
% 
%   See also FAKEAUTOPILOT, FAKENAVIGATOR.

%   Copyright 2015 (c) CHANG, Wei-Chieh.

% 
A11 = [-0.1460    0.8135         0   -9.7974;
       -2.0959   -4.9852    8.4934         0;
        0.1026   -0.5300   -5.5603         0;
             0         0    1.0000         0];
A22 = [-0.0882    0.0207   -0.9865    1.0649;
       -2.7376   -5.3063    3.7704         0;
        0.2452   -2.0111   -0.3694         0; 
             0    1.0000         0         0];

%          
B11 = zeros(4,1); 
B12= [-1.4385e-05
       -0.0020
       -0.0079
             0].*100;    
B23 = [      0;
       15.7998;
       -2.1608;
             0];
B24 = [ 0.0998;
        0.1599;
       -0.1932;
             0];             
         
% Building the A and B matrix.
A = [ A11 zeros(4); zeros(4) A22 ];
B = [ B11 B12 zeros(4,2); zeros(4,2) B23 B24 ];

% Apply euler integration.
dx = A * x0 + B * u;
x = x0 + dx * dt;

end


