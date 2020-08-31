function op=allocate(u)
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

f1 = u(9);
f2 = u(10);
f3 = u(11);
f4 = u(12);

% no faults    
actuator_to_input = inv([0 0 -l l; -l l 0 0; c c -c -c; 1 1 1 1]);    

%if f1_f>0.3
% motor 1 faulty
%actuator_to_input = inv([0 0 -l l; -l l 0 0; c c -c -c; 1 1 1 1]).*[1 (f1-f2*(1-f1_f))/(f1-f2) (f1-f3-f4+f2*(1-f1_f))/(f1+f2-f3-f4) (f1+f3+f4+f2*(f1_f))/(f1+f2+f3+f4)];
%end

%if f2_f>0.3
% motor 2 faulty
%actuator_to_input = inv([0 0 -l l; -l l 0 0; c c -c -c; 1 1 1 1]).*[1 -(f2-f1*(1-f2_f)/(f1-f2)) (f2-f3-f4+f2*(1-f2_f))/(f1+f2-f3-f4) (f2+f3+f4+f1*(1-f2_f))/(f1+f2+f3+f4)];
%end

%if f3_f>0.3
% motor 3 faulty
%actuator_to_input = inv([0 0 -l l; -l l 0 0; c c -c -c; 1 1 1 1]).*[(f3-f4*(1-f3_f))/(f3-f4) 1 (f1+f2-f3-f4*(1-f3_f)/(f1+f2-f3-f4)) (f1+f2+f3+f4*(1-f3_f))/(f1+f2+f3+f4)];
%end

%if f4_f>0.3
% motor 4 faulty
%actuator_to_input = inv([0 0 -l l; -l l 0 0; c c -c -c; 1 1 1 1]).*[-(f4-f3*(1-f4_f))/(f3-f4) 1 (f1+f2-f4-f3*(1-f4_f))/(f1+f2-f3-f4) (f1+f2+f4+f3*(1-f4_f)/(f1+f2+f3+f4))];
%end

F = actuator_to_input*[u2; u1];

f1 = F(1);
f2 = F(2);
f3 = F(3);
f4 = F(4);

u1 = (f1 + f2 + f3 + f4);
u2 = ([((f4 - f3)*l); ((f2 - f1)*l); ((f2*c) + (f1*c) - (f4*c) - (f3*c))]);

op=[u1; u2];

end