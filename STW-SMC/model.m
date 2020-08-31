function op=model(u)
global m I g
u1=u(1);
u2=[u(2);u(3);u(4)];

%dphi=u(5);
%dtht=u(6);
%dpsi=u(7);
%phi=u(8);
%tht=u(9);
%psi=u(10);

phi=u(5);
tht=u(6);
psi=u(7);

dphi=u(8);
dtht=u(9);
dpsi=u(10);

R=[cos(psi)*cos(tht)-sin(phi)*sin(psi)*sin(tht) -sin(psi)*cos(phi) cos(psi)*sin(tht)+sin(psi)*sin(phi)*cos(tht);
      cos(tht)*sin(psi)+cos(psi)*sin(phi)*sin(tht)  cos(phi)*cos(psi) sin(psi)*sin(tht)-cos(psi)*cos(tht)*sin(phi);
                                -cos(phi)*sin(tht)           sin(phi)                           cos(phi)*cos(tht)];
ddr=(1/m)*([0;0;-m*g]+R*[0;0;u1]);
dang=[dphi;dtht;dpsi];                            
ddang=inv(I)*u2-inv(I)*cross(dang,I*dang);
op=[ddr;ddang];
end