% clc
% clear

% omega = 1;
% dzeta = 0.5;

omega = 0.71; 
dzeta = 0.25;


L = [omega.^2];
M = [1 2*dzeta*omega omega.^2];
Gs = tf(L,M)


%%%%%%% RECORDED INPUT/OUTPUT DATA
data = iddata(out.real_sys.Data,out.input.Data,0.01)



Gest = tfest(data,2,0)
G_est_tf = tf(Gest.Numerator,Gest.Denominator)

compare(data,G_est_tf)
%compare(data,Gs)
%ssest(data,1:20)