function A = Net_ER(N,p)

Rpm = rand(N) .* ( ones(N) - eye(N) );
RewirteMatrix = triu(Rpm <= p,1) .* 1;
A = RewirteMatrix + RewirteMatrix';