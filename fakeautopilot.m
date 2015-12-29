function de = fakeautopilot( q, theta, command )
% Gain matrix
gain = [ -1.3931 35 60 ];

% 
de = ( ( command * gain(1) + theta ) * gain(2) + q ) * gain(3);  
end