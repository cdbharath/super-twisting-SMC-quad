function op=altitude_control(u)
global I tuning_parameter g m

phi = u(1);
tht = u(2);
psi = u(3);

dz = u(4);

sz = u(5);
int_sign_sz = u(6);

dzdes = u(7);
ddzdes = u(8);

k1 = 55;
K = 50;

op = (m/(cos(phi)*cos(tht)))*(ddzdes + g + tuning_parameter*(dz) + k1*sign(sz));
%op = (m/(cos(phi)*cos(tht)))*(ddzdes + g + tuning_parameter*(dzdes - dz) - k1*sign(sz));
%op = (m/(cos(phi)*cos(tht)))*(g + tuning_parameter*(dz) + (-1.5*power(K,1/2))*power(abs(sz),1/2)*sign(sz)+(-1.1*K)*int_sign_sz);

end