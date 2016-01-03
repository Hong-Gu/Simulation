function u = fakeautopilot( x, r )
% FAKEAUTOPILOT
%   u = fakeautopilot( x, r ) is a function to generate control surface
%   command for Hong-Gu, the solar-powered fixed-wing aircraft. The command
%   defined as u, state variables are defined as x and the reference
%   commands.
%   
%   Limitation:
% 
%       Only pitch control now.
% 
%   See also FAKEAERODTNAMICS, FAKENAVIGATOR.

%   Copyright 2015 (c) CHANG, Wei-Chieh.
gain = [ -1.6906 1.998 5.98 ];

u = zeros(4,1);
u(2) = ( ( gain(1)*r(4) + x(4)  )*gain(2) + x(3) )*gain(3);
end