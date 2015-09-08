clc
clear

m = 24.96; %kg
S = 5.628; %m^(2)
eta_p = 0.64;
Cl_star = 0.46;
E_star = 15.84;
beta = 1 / 9042;
v = 15;
g = 9.81;
P_max = 400; %w

syms u1

%% z value

h = 100.0;
rho = 1.225 * exp(- beta .* h);
p = P_max / ( m * g * (g/beta)^(1/2) )
z = (2 * m *beta) ./ ( rho .* S * Cl_star )
p_bar = p / z^(1/2)
lamda = 1 / 0.88

%%

u_bar = linspace(0.7,1.225,100);

n_p_r = ( 1 + u_bar.^(4) ) ./ ( 2 * eta_p * E_star .* u_bar );

figure(1)
plot(u_bar,n_p_r)
grid on
axis([0.6 1.4 0.085 0.135])
xlabel('Normalized speed')
ylabel('Normalized power required')

%%

u_bar = linspace(0.88,0.77,100);
headaxis = [];

for uf_bar = 0.77:0.01:0.87

p = ( 1 + uf_bar^(4) ) / ( 2 * E_star * eta_p * uf_bar );

sigma = acosd( 2 ./ ( 2 - 2 * E_star .* u_bar * p *eta_p + u_bar.^(4) ) - 1 ) / 2;

hold on
figure(3)
plot(u_bar,sigma)
grid on
xlabel('Normalized Speed')
ylabel('Bank angle(deg)')
hold off

end

%%

uf_bar = 0.77;
u0_bar = 0.88;

for uf_bar = 0.77:0.001:0.87
headaxis = [];
 
sigma = acos( 2 ./ ( 2 - 2 * E_star .* u_bar * p *eta_p + u_bar.^(4) ) - 1 ) / 2;
 
[u head] = ode45(@(u,head) vdde(u,head,uf_bar),[u0_bar uf_bar],0);

head = head * 180 / pi;

figure(2)
plot(u,head)
grid on
hold on
xlabel('Normalized Speed')
ylabel('Final Heading(rad)')

end

%%

n = 10;
uf_bar = linspace(0.77,0.8799,n);
heading = [];
uf = [];

sigma = acos( 2 ./ ( 2 - 2 * E_star .* u_bar * p *eta_p + u_bar.^(4) ) - 1 ) / 2;

for i = 1:1:n

[u head] = ode45(@(u,head) vdde(u,head,uf_bar(i)),[u0_bar uf_bar(i)],0);

nhead = length(head);

heading = [ heading head(nhead) ];
uf = [ uf u(nhead) ];

end

figure(6)
plot(uf,heading)

%%

lamda = 1 ./ ( u_bar.^(2) .* cos(sigma) );

figure(5)
plot(u_bar,lamda)
grid on
xlabel('Normalized Speed')
ylabel('Normalized lift coefficient')

%%

uf_bar = 0.88;
u_bar = linspace(0.77,0.88,100);

p = ( 1 + uf_bar^(4) ) / ( 2 * E_star * eta_p * uf_bar );

sigma = acosd( 2 ./ ( 2 - 2 * E_star .* u_bar * p *eta_p + u_bar.^(4) ) - 1 ) / 2;

figure(4)
plot(u_bar,sigma)
grid on
xlabel('Normalized Speed')
ylabel('Bank angle(deg)')





