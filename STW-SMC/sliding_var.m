function op=sliding_var(u)
dang=[u(1);u(2);u(3)];
ang=[u(4);u(5);u(6)];
angc=[u(7);u(8);u(9)];
dangc=[u(10);u(11);u(12)];
global tuning_parameter;
op=(dang-dangc)+tuning_parameter*(ang-angc);
end