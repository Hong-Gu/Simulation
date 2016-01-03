function r = fakenavigator( t )
% FAKENAVIGATOR
%   r = fakenavigator( t ) is a function to generate persudo navigation
%   command. The command is a time variant function.
% 
%   Limitation:
% 
%       Only pitch command now.
% 
%   See also FAKEAERODTNAMICS, FAKENAVIGATOR.

%   Copyright 2015 (c) CHANG, Wei-Chieh.

r = [ 0 0 0 1 0 0 0 0 ]'...
    + [ 0 0 0 0.5 0 0 0 0 ]' .* fix( 0.1 * t );

end