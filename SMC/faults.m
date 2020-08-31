function op=faults(u)
global m I g

l = 0.24;
b = 0.0000542;
d = 0.0000011;

u1=u(1);
u2=[u(2);u(3);u(4)];
t = u(5);

actuator_to_input = inv([0 0 -b b; -b b 0 0; d d -d -d; b b b b]);

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
    
    u1 = b*f1 + b*f2 + b*f3 + b*f4 ;
    u2 = [(f4 - f3)*b; (f2 - f1)*b; f2*d + f1*d - f4*d - f3*d];
   
    
else
    f1 = f1*1;
    f2 = f2*1;
    f3 = f3*1;
    f4 = f4*1;
    
    u1 = b*f1 + b*f2 + b*f3 + b*f4 ;
    u2 = [(f4 - f3)*b; (f2 - f1)*b; f2*d + f1*d - f4*d - f3*d];
    
end    

op=[u1; u2; [f1; f2; f3; f4]];

end