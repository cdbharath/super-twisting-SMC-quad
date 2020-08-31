function op=model(u)

global m I g

T = u(1);
Tau = [u(2); u(3); u(4)];

phi = u(5);
tht = u(6);
psi = u(7);

dphi = u(8);
dtht = u(9);
dpsi = u(10);

Rbv = [cos(tht)*cos(psi)                            cos(tht)*sin(psi)                            -sin(tht);
       sin(phi)*sin(tht)*cos(psi)-cos(phi)*sin(psi) sin(phi)*sin(tht)*sin(psi)+cos(phi)*cos(psi) sin(phi)*cos(tht);
       cos(phi)*sin(tht)*cos(psi)+sin(phi)*sin(psi) cos(phi)*sin(tht)*sin(psi)-sin(phi)*cos(psi) cos(phi)*cos(tht)];
 
ddr = (1/m)*([0; 0; m*g] + transpose(Rbv)*[0; 0; -T]);
dang = [dphi; dtht; dpsi];

ddang = inv(I)*Tau - inv(I)*cross(dang, I*dang);

op = [ddr; ddang];

end