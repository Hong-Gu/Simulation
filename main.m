clear all
clc

% Declare the time matrix.
dt = 1/50;
t  = 0: dt : 25;

% Declare the state and control matrix
x = zeros( 4, length( t ), 2 );
u = zeros( 2, length( t ), 2 );

%
THETA = 1.0;

%
x( :, 1, 1 ) = [ 10 0 0.5 -1.0 ]';
x( :, 1, 2 ) = [ 10 0 0.5 -1.0 ]';

% Main algorithm.
for j = 1: 1: 2
    if( j == 1 )
        APFLAG = 0;
    elseif( j == 2 )
        APFLAG = 1;
    end
    for i = 2: 1: length( t )
        if( APFLAG == 1)
            u( 1, i, j ) = fakeautopilot( x( 3, i-1, j ), x( 4, i-1, j ), THETA );
        end
        x( :, i, j ) = fakeaerodynamics( x( :, i-1, j ), u( 1, i, j ), dt );
    end
end

%
subplot(2,1,2)
plot( t, x( 3, :, 1 ), t, x( 3, :, 2 ) )
ylabel('q (rad/s)')
subplot(2,1,2)
plot( t, x( 4, :, 1 ), t, x( 4, :, 2 ) )
ylabel('\theta (rad)')
xlabel('Time(sec)')
