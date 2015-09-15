clc
clear

m = 8.0901; %kg
S = 1.6804; %m^(2)
eta_p = 0.8;
Cl_star = 1.3127;
E_star = 23.625;
beta = 1 / 9042;
v = 8.5745;
g = 9.81;
P_max = 50; %w

syms u1

%% 
h = 3000;
[C,a,P,rho,g,mu]=Standard_Atmosphere(h)
p_max = P_max / ( m * g * (g/beta)^(1/2) )
z = (2 * m *beta) ./ ( rho .* S * Cl_star )
p_bar_max = p_max / z^(1/2)
u = v / ( g / beta )^(1/2);
u_bar = u / z^(1/2);
v_stall = ( ( 2 * m * g ) / ( rho * S * Cl_star ) )^(1/2)
u_stall = v_stall / ( g / beta )^(1/2)
u_bar_stall = u_stall / z^(1/2)
gamma = asin( 0.5 / v )

u_max_sol = roots([ 1 0 0 -2*eta_p*p_bar_max*E_star 1 ]) 

u = u_max_sol(3) * z^(1/2)

V = u * ( g / beta )^(1/2)

%%

u_bar = linspace(1,1.2321,1000);

n_p_r = ( 1 + u_bar.^(4) ) ./ ( 2 * eta_p * E_star .* u_bar );

figure(1)
plot(u_bar,n_p_r)
grid on
%axis([0.6 1.4 0.085 0.135])
xlabel('Normalized speed')
ylabel('Normalized power required')

%%

headaxis = [];

for uf_bar = 1.0185:0.01:1.019849
    
u_bar = linspace(1.019849,1.0185,100);

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

uf_bar = 1.0185;
u0_bar = 1.019849;
u_bar = linspace(1.019849,1.0185,100);

for uf_bar = uf_bar:0.01:u0_bar
headaxis = [];
  
sigma = acos( 2 ./ ( 2 - 2 * E_star .* u_bar * p *eta_p + u_bar.^(4) ) - 1 ) / 2;
  
[u, head] = ode45(@(u,head) vdde(u,head,uf_bar),[u0_bar uf_bar],0);

head = head * 180 / pi;
 
figure(2)
plot(u,head)
grid on
hold on
xlabel('Normalized Speed')
ylabel('Heading(deg)')

end
 
%%
 
lamda = 1 ./ ( u_bar.^(2) .* cos(sigma) );
Cl = lamda * Cl_star;

figure(4)
subplot(2,1,1)
plot(u_bar,lamda)
grid on
xlabel('Normalized Speed')
ylabel('Normalized lift coefficient')
subplot(2,1,2)
plot(u_bar,Cl)
grid on
xlabel('Speed')
ylabel('Normalized lift coefficient')




