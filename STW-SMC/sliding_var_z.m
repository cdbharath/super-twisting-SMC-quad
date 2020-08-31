function op=sliding_var_z(u)

dz = u(1);
z = u(2);
zdes = u(3);
dzdes = u(4);

global tuning_parameter;
%op=(dz-dzdes)+tuning_parameter*(z-zdes);
u1=(dzdes-dz)+tuning_parameter*(zdes-z);
op=u1;

end