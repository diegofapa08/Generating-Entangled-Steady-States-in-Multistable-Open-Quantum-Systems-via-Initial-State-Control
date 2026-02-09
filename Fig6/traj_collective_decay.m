%This code can be used to simulate the quantum trajectories under the
%collective decay jump operator L1 = S_-

N=4; %Number of qubits
sigma_z = 1/2*[1,0;0,-1]; %spin operators
sigma_m = [0,0;1,0]; %spin operators
dim = 2^N; %We use the full Hilbert space dimension since we use this code for few qubits
gamma = 1; %Decay rate
dt = 0.005; %Time step
T=3*gamma; %Total time
steps = round(T/dt);
Ntraj = 20; %Number of trajectories
Sminus = zeros(dim, dim); %Compute S_-
for k = 1:N
    op = 1;
    for j = 1:N
        if j == k
            op = kron(op, sigma_m);
        else
            op = kron(op, eye(2));
        end
    end
    Sminus = Sminus + op;
end

Sz = zeros(dim, dim); %Compute S_z
for k = 1:N
    op = 1;
    for j = 1:N
        if j == k
            op = kron(op, sigma_z);
        else
            op = kron(op, eye(2));
        end
    end
    Sz = Sz + op;
end

Sx = 1/2*(Sminus'+Sminus);
Sy = -1i/2*(Sminus'-Sminus);
Ssq = Sz^2 + Sx^2 + Sy^2;

%We define the effective Hamiltonian
H_eff = -1i * gamma/2 * (Sminus' * Sminus);
psi0 = kron([1;0],kron([1;0],kron([0;1],[0;1])));
% We define the three Dicke states for the case N=4, for larger N more dark
% states of the form |S,-S> need to be computed
Dark1 = kron([0;1],kron([0;1],kron([0;1],[0;1])));
Dark2 = [0;0;0;0;0;0;0;0.5012;0;0;0;0.5012;0;-0.4988;-0.4988;0];
Dark3 =[0;0;0;0.6190;0;-0.2881;-0.2881;0;0;-0.2881;-0.2881;0;0.5336;0;0;0];
data = zeros(Ntraj,steps,2);
for traj = 1:Ntraj
        psi = psi0;
        for t = 1:steps
            % Compute jump probability
            dp = gamma * (psi' * (Sminus' * Sminus) * psi) * dt;

            if rand < dp       % ---- JUMP ----
                psi = Sminus * psi;
                psi = psi / norm(psi);   % renormalize
            else               % ---- NO JUMP ----
                psi = (eye(dim) -1i*H_eff*dt) * psi;
                psi = psi / norm(psi);
            end
            data(traj,t,1) = norm(Dark1'*psi);
            data(traj,t,2) = norm(Dark2'*psi);
            data(traj,t,3) = norm(Dark3'*psi);
        end
end
%% Plots
%Below we choose trajectories 2,4, and 20 to be highlighted, while all
%others are plotted in gray.
%panel a
cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)
timerange = linspace(0,3,600);

shades = linspace(0.15,1,Ntraj);
hold on
for j=1:Ntraj-1
color = (1 - shades(1))*[1 1 1] + shades(1)*[0,0,0];
plot(timerange,data(j,:,3),'Color',color,'LineWidth',2.5)
%plot(timerange,data(j,:,2),'Color',shades(j)*[1,0,0])
%plot(timerange,data(j,:,3),'Color',shades(j)*[0,0,1])
end
plot(timerange,data(2,:,3),'Color',cmap1(1,:),'LineWidth',2.5)
plot(timerange,data(4,:,3),'Color',cmap1(2,:),'LineWidth',2.5,'LineStyle','--')
plot(timerange,data(20,:,3),'Color',cmap1(3,:),'LineWidth',2.5,'LineStyle',':')
set(gca,'FontSize',14)
ylabel('$\vert \langle \psi(t) \vert 0, 0 \rangle \vert$','Interpreter','latex','FontSize',20)
xlabel('$\gamma t $','Interpreter','latex','FontSize',20)
hold off 
box on
title('(a)','Interpreter','latex','FontSize',20)
pbaspect([1 0.25 1])
exportgraphics(gca,'Trajectories_a.pdf','ContentType','vector')

%% 
%panel b
cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)
timerange = linspace(0,3,600);

shades = linspace(0.15,1,Ntraj);
hold on
for j=1:Ntraj-1
color = (1 - shades(1))*[1 1 1] + shades(1)*[0,0,0];
plot(timerange,data(j,:,2),'Color',color,'LineWidth',2)
%plot(timerange,data(j,:,2),'Color',shades(j)*[1,0,0])
%plot(timerange,data(j,:,3),'Color',shades(j)*[0,0,1])
end
plot(timerange,data(2,:,2),'Color',cmap1(1,:),'LineWidth',2.5)
plot(timerange,data(4,:,2),'Color',cmap1(2,:),'LineWidth',2.5,'LineStyle','--')
plot(timerange,data(20,:,2),'Color',cmap1(3,:),'LineWidth',2.5,'LineStyle',':')
set(gca,'FontSize',14)
ylabel('$\vert \langle \psi(t) \vert 1, -1 \rangle \vert$','Interpreter','latex','FontSize',20)
xlabel('$\gamma t $','Interpreter','latex','FontSize',20)
hold off 
title('(b)','Interpreter','latex','FontSize',20)
pbaspect([1 0.25 1])
box on
exportgraphics(gca,'Trajectories_b.pdf','ContentType','vector')

%% 
%panel b
cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)
timerange = linspace(0,3,600);

shades = linspace(0.15,1,Ntraj);
hold on
for j=1:Ntraj-1
color = (1 - shades(1))*[1 1 1] + shades(1)*[0,0,0];
plot(timerange,data(j,:,1),'Color',color,'LineWidth',2)
end
plot(timerange,data(2,:,1),'Color',cmap1(1,:),'LineWidth',2.5)
plot(timerange,data(4,:,1),'Color',cmap1(2,:),'LineWidth',2.5,'LineStyle','--')
plot(timerange,data(20,:,1),'Color',cmap1(3,:),'LineWidth',2.5,'LineStyle',':')
set(gca,'FontSize',14)
ylabel('$\vert \langle \psi(t) \vert 2, -2 \rangle \vert$','Interpreter','latex','FontSize',20)
xlabel('$\gamma t $','Interpreter','latex','FontSize',20)
hold off 
box on
title('(c)','Interpreter','latex','FontSize',20)
pbaspect([1 0.25 1])
exportgraphics(gca,'Trajectories_c.pdf','ContentType','vector')




