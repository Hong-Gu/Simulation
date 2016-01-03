clear
clc

% 
dt = 1/20;
t = 0: dt: 50;

% Declare zero matrix.
r = zeros( 8, length(t) ); 
u = zeros( 4, length(t) );
x = zeros( 8, length(t) );

% Declare initial conditions.
r( :, 1 ) = [ 0 0 0 1.0 0 0 0 0 ]';
x( :, 1 ) = [ 8.45 0 -1 0 0 0 0 0 ]';

% Main simulation algorithm. 
for i = 2: 1: length(t)
    r( :, i ) = fakenavigator( t( i ) );
    u( :, i ) = fakeautopilot( x( :, i-1 ), r( :, i ) );
    x( :, i ) = fakeaerodynamics( x( :, i-1 ), u( :, i ), dt );
end

figure(1)
plot( t, r(4,:), '--r', t, x(4,:) )
figure(2)
plot( t, x(3,:) )