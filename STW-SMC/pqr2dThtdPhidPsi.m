function op=pqr2dThtdPhidPsi(u)

p=u(1);
q=u(2);
r=u(3);
phi=u(4);
tht=u(5);
psi=u(6);

Rotn=[cos(tht) 0 -cos(phi)*sin(tht);
             0 1           sin(phi);
      sin(tht) 0  cos(phi)*cos(tht)];
% Rotn=eye(3);
op=inv(Rotn)*[p;q;r];

end