function sz=SzOP(NA,NB,h)
%Define the Sz operator for Dicke states |N/2, m>
%NA and NB are the number of spins in the ensemble and h can have values 1
%or 2 depending on whether we are computing an operator for ensemble A or B
if h==1
    Szdiag = zeros(NA+1,1);
    for n=1:NA+1
        Szdiag(n,1) = NA/2 + (1-n);
    end
    Szop = spdiags(Szdiag,0,NA+1,NA+1);
    sz = kron(Szop,speye(NB+1));
else
    Szdiag = zeros(NB+1,1);
    for n=1:NB+1
        Szdiag(n,1) = NB/2 + (1-n);
    end
    Szop = spdiags(Szdiag,0,NB+1,NB+1);
    sz = kron(speye(NA+1),Szop);
end
end