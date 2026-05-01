x0 = -0.162;% Initial displacement [m]
H  =  5;  % Height in meters 
v0 = sqrt(2*9.81*H); % Initial velocity [m/s]
dt = 0.01;          % Simulation time step [s]
tend = 20;          % Max simulation time [s]
t = 0:dt:tend;      % ode45() time vector [s]
m = 8;             % Mass [kg]
k = 484.7;             % Spring constant [N/m]
cvec = [0 25 60];    % Vector of damping coefficients [kg/s = N*s/m]
options = odeset('RelTol',1e-6,'AbsTol',1e-6);  % Change ode45() tolerances
% mck() Function Call
xc = zeros(length(cvec),length(t));     % Preallocate matrix storing positions for each cvec case
vc = 0*xc;                              % Preallocate matrix storing velocities for each cvec case

for i=1:length(cvec)
    % Call mck() function, then store results in appropriate row
    [~,xc(i,:),vc(i,:)] = mck(m,cvec(i),k,t,x0,v0,options);
end
% Plot position
figure
sgtitle('Effect of Damping, $c$','fontsize',14,'Interpreter','latex')

subplot(2,1,1)
plot(t,xc,'linewidth',2)
grid on; hold on
ylabel('Position (m)','fontsize',14,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
% Plot velocity
subplot(2,1,2)
plot(t,vc,'linewidth',2)
grid on; hold on
xlabel('Time (s)','fontsize',14,'Interpreter','latex')
ylabel('Velocity $\left( \frac{m}{s} \right)$','fontsize',14,'Interpreter','latex')
legend([repmat('$c= $ ',[length(cvec) 1]) num2str(cvec')...
    repmat(' $\frac{N \cdot s}{m}$',[length(cvec) 1])],...
    'fontsize',14,'Interpreter','latex','location','southeast')

set(gca,'TickLabelInterpreter','latex')
set(gcf,'Position',[988 196 881 714])  


 
