function op=faults(u)
global m I g

l = 0.125;
c1 = 0.029107;
c2 = 0.027543;
c3 = 0.036171;
c4 = 0.040559;
c = 0.033;

u1=u(1);
u2=[u(2);u(3);u(4)];
t = u(5);

actuator_to_input = inv([0 0 -l l; -l l 0 0; c c -c -c; 1 1 1 1]);

F = actuator_to_input*[u2; u1];

f1 = F(1);
f2 = F(2);
f3 = F(3);
f4 = F(4);

if t>30 & t<100
    f1 = f1*1;
    f2 = f2*1;
    f3 = f3*1;
    f4 = f4*1;
    
    u1 = f1 + f2 + f3 + f4 ;
    u2 = [(f4 - f3)*l; (f2 - f1)*l; f2*c + f1*c - f4*c - f3*c];
   
    
else
    f1 = f1*1;
    f2 = f2*1;
    f3 = f3*1;
    f4 = f4*1;
    
    u1 = f1 + f2 + f3 + f4 ;
    u2 = [(f4 - f3)*l; (f2 - f1)*l; f2*c + f1*c - f4*c - f3*c];
    
end    

op=[u1; u2; [f1; f2; f3; f4]];

end