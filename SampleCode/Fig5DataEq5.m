%This is the code used to generate the data on Fig.5 panel e.
%We study the steady states under the collective operator L1 = S_-


N=20; %Number of total atoms (A+B)
Imbalrange = linspace(0,N/2-1,N/2); %We consider the value of \eta
data = zeros(length(Imbalrange),3);
indd=1;
for Imbal = Imbalrange

    NA = N/2; NB=N/2-Imbal; %NA>=NB
    
    %We define the Liouvillian superoperator which is defined by collective
    %decay
    tic
    dim = (NA+1)*(NB+1); %Dimension of the Hilbert space, note that due to symmetry we can work on the Dicke basis for each ensemble
    
    JOP = SmOP(NA,NB,1) + SmOP(NA,NB,2); %The function SmOP creates the S_-  operator in the Dicke basis.
    
    LSOP = kron(JOP,JOP) - 1/2*kron(transpose(JOP)*JOP,speye(dim)) - 1/2*kron(speye(dim),transpose(JOP)*JOP); %Liouvillian superoperator
    TotalSz = SzOP(NA,NB,1)+SzOP(NA,NB,2); %S_z = S_z^A + S_z^B
    DiffSz = SzOP(NA,NB,1)-SzOP(NA,NB,2); %S_z^- = S_z^A - S_z^B
    SzA = SzOP(NA,NB,1); %S_z^A
    SzB = SzOP(NA,NB,2); %S_z^B
    
    %In this case we use Eq(5) so we only need to set up the value of
    %\epsilon

    epsilon = 1e-5;
    
    
    
    %% Initial state
    %In this case we consider the case where all particles in one ensemble are
    %all pointing up, while in the other ensemble they are all pointing down
    state0A = sparse(NA+1,1);
    state0A(NA+1,1) = 1;
    state0B = sparse(NB+1,1);
    state0B(1,1)=1;
    state0 = kron(state0A,state0B);
    
    
    InitialSt = reshape(state0*ctranspose(state0),dim^2,1);
    
    %Now we can compute the steady state for each case using Eq.(3), notice
    %that the line of code below effectively computes 
    %\sum_j (U_j^\dagger \rho_0) V_j
    statef = reshape((speye(dim^2)-1/epsilon*LSOP)\InitialSt,dim,dim);
    
    %Now we can compute the desired observables using the the state

    data(indd,1) = Imbal;
    data(indd,2) = trace(reshape(statef,dim,dim)*SzA);
    data(indd,3) = trace(reshape(statef,dim,dim)*SzB);
    data(indd,4) = trace(reshape(InitialSt,dim,dim)*SzA);
    data(indd,5) = trace(reshape(InitialSt,dim,dim)*SzB);
    data(indd,6) = trace(reshape(statef,dim,dim)*(SzA+SzB));
    data(indd,7) = trace(reshape(InitialSt,dim,dim)*(SzA+SzB));
    indd = indd+1;  
end

