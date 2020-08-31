function op=attitude_control(u)
global I tuning_parameter

Ix=I(1,1);
Iy=I(2,2);
Iz=I(3,3);

dphi=u(1);
dtht=u(2);
dpsi=u(3);

s1=u(4);
s2=u(5);
s3=u(6);

int_sign_s1=u(7);
int_sign_s2=u(8);
int_sign_s3=u(9);

dang=[dphi;dtht;dpsi];
alpha=[(Iy-Iz)*dpsi*dtht/Ix;(Iz-Ix)*dpsi*dphi/Iy;(Ix-Iy)*dphi*dtht/Iz]+tuning_parameter*dang;
beta=inv(I);
k1=55;
k2=10;
k3=55;
K = 50;
op=inv(beta)*(-alpha+[-k1*sign(s1);-k2*sign(s2);-k3*sign(s3)]);
%op=inv(beta)*(-alpha+[(-1.5*power(K,1/2))*power(abs(s1),1/2)*sign(s1)+(-1.1*K)*int_sign_s1; (-1.5*power(K,1/2))*power(abs(s2),1/2)*sign(s2)+(-1.1*K)*int_sign_s2; (-1.5*power(K,1/2))*power(abs(s3),1/2)*sign(s3)+(-1.1*K)*int_sign_s3;]);
%op=inv(beta)*(-alpha+[(-1.5*power(k1,1/2))*power(abs(s1),1/2)*sign(s1)+(-1.1*k1)*int_sign_s1; (-1.5*power(k2,1/2))*power(abs(s2),1/2)*sign(s2)+(-1.1*k2)*int_sign_s2; (-1.5*power(k3,1/2))*power(abs(s3),1/2)*sign(s3)+(-1.1*k3)*int_sign_s3;]);
end


 