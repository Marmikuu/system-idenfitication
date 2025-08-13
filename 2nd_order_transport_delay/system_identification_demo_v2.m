
%%%% time interval
dt = 0.01;


%%%%%%% import data from Simulink
t = out.tout;
Real_Y = out.Real_Y.Data;
U = out.U.Data;


Real_Y_validation = out.Real_Y_validation.Data;
U_validation = out.U_validation.Data;


%%%%%% Recorded input/output data
%%% step response
data = iddata(Real_Y,U,dt);

%%%% validation data
validation_data = iddata(Real_Y_validation,U_validation,dt);



%%%% step response plot
figure(1)
plot(t,Real_Y,t,U,'LineWidth',0.7);
legend('Real system response Y','Step input U')

%%%% estimate how many samples is

%%% delayest doesn't fit well in this case, but I'll include this in the comparision
delay_samp = delayest(data)


%%%%  estitmate the delay "manually"
delay_samp = (3.01 - 1)./dt; 

Real_Y_no_delay = Real_Y(delay_samp+1:end);
data_offset = iddata(Real_Y_no_delay, U(1:end - delay_samp),dt);

Gss = ssest(data_offset,1:10);


%%%%%%% merging delay into new transfer function
s = tf('s');
G_est = tf(Gss) * exp(-delay_samp*dt*s)


%%%%%%%%%%%%% comparision on step signal
figure(2)
compare(data,G_est);


%%%%%%%%% comparision on validation data
figure(3)
compare(validation_data,G_est)

%%% plot a U_validation signal
%%hold on;
% plot(t,U_validation);

