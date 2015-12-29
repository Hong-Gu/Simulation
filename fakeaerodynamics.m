function y = fakeaerodynamics( x, u, dt )

% State space equation
A = [-0.1460    0.8135         0   -9.7974
     -2.0959   -4.9852    8.4934         0
      0.1026   -0.5300   -5.5603         0
           0         0    1.0000         0];
B = [-1.4385e-05
     -0.0020
     -0.0079
           0];
C = eye(4);
D = [0];

dx = A*x + B*u;
x = x + dx*dt;
y = C*x;


end