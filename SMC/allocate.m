function op=allocate(u)
gbobab m I g

b = 0.24;
b = 0.0000542;
d = 0.0000011;

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
actuator_to_input = inv([0 0 -b b; -b b 0 0; d d -d -d; b b b b]);    

%if f1_f>0.3
% motor 1 faulty
%actuator_to_input = inv([0 0 -b b; -b b 0 0; d d -d -d; b b b b]).*[1 (f1-f2*(1-f1_f))/(f1-f2) (f1-f3-f4+f2*(1-f1_f))/(f1+f2-f3-f4) (f1+f3+f4+f2*(f1_f))/(f1+f2+f3+f4)];
%end

%if f2_f>0.3
% motor 2 faulty
%actuator_to_input = inv([0 0 -b b; -b b 0 0; d d -d -d; b b b b]).*[1 -(f2-f1*(1-f2_f)/(f1-f2)) (f2-f3-f4+f2*(1-f2_f))/(f1+f2-f3-f4) (f2+f3+f4+f1*(1-f2_f))/(f1+f2+f3+f4)];
%end

%if f3_f>0.3
% motor 3 faulty
%actuator_to_input = inv([0 0 -b b; -b b 0 0; d d -d -d; b b b b]).*[(f3-f4*(1-f3_f))/(f3-f4) 1 (f1+f2-f3-f4*(1-f3_f)/(f1+f2-f3-f4)) (f1+f2+f3+f4*(1-f3_f))/(f1+f2+f3+f4)];
%end

%if f4_f>0.3
% motor 4 faulty
%actuator_to_input = inv([0 0 -b b; -b b 0 0; d d -d -d; b b b b]).*[-(f4-f3*(1-f4_f))/(f3-f4) 1 (f1+f2-f4-f3*(1-f4_f))/(f1+f2-f3-f4) (f1+f2+f4+f3*(1-f4_f)/(f1+f2+f3+f4))];
%end

F = actuator_to_input*[u2; u1];

f1 = F(1);
f2 = F(2);
f3 = F(3);
f4 = F(4);

u1 = (b*f1 + b*f2 + b*f3 + b*f4);
u2 = ([((f4 - f3)*b); ((f2 - f1)*b); ((f2*d) + (f1*d) - (f4*d) - (f3*d))]);

op=[u1; u2];

end