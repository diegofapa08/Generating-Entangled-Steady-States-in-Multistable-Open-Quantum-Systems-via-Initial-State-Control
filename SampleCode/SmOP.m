function sm=SmOP(NA,NB,h)
%Define the S+ operator for Dicke states |N/2, m>

if h==1
    Smdiag= zeros(NA+1,1);
    for n=1:NA
        j = NA/2;
        mj = NA/2 - n+1;
        Smdiag(n,1) = sqrt(j*(j+1)-mj*(mj-1));
    end
    Smop = spdiags(Smdiag,-1,NA+1,NA+1);
    sm = kron(Smop,speye(NB+1));
else
    Smdiag= zeros(NB+1,1);
    for n=1:NB
        j = NB/2;
        mj = NB/2 - n+1;
        Smdiag(n,1) = sqrt(j*(j+1)-mj*(mj-1));
    end
    Smop = spdiags(Smdiag,-1,NB+1,NB+1);
    sm = kron(speye(NA+1),Smop);
end
end