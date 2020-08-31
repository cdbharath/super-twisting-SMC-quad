function op=dThtdPhidPsi2pqr(u)

phi=u(1);
tht=u(2);
psi=u(3);

dphi=u(4);
dtht=u(5);
dpsi=u(6);

Rotn=[cos(tht) 0 -cos(phi)*sin(tht);
             0 1           sin(phi);
      sin(tht) 0  cos(phi)*cos(tht)];
% Rotn=eye(3);
  
op=Rotn*[dphi;dtht;dpsi];

end