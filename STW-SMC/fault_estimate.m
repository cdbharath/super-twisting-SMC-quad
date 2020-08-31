function op=fault_estimate(u)
global m I g

l = 0.125;
c1 = 0.029107;
c2 = 0.027543;
c3 = 0.036171;
c4 = 0.040559;
c = 0.033;

u1=u(1);
u2=[u(2);u(3);u(4)];
f1_f = u(5);
f2_f = u(6);
f3_f = u(7);
f4_f = u(8);

actuator_to_input = inv([0 0 -l l; -l l 0 0; c c -c -c; 1 1 1 1]);

F = actuator_to_input*[u2; u1];

f1 = F(1);
f2 = F(2);
f3 = F(3);
f4 = F(4);

op=[(f1 - f1_f)/f1; (f2 - f2_f)/f2; (f3 - f3_f)/f3; (f4 - f4_f)/f4];
end