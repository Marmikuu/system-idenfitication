# system-idenfitication
A simple example of system identification in MATLAB/Simulink


Here's an unknown real system simulated by a following simulink model:
<img width="781" height="372" alt="what_the_realsys_consist_of" src="https://github.com/user-attachments/assets/bd9def4c-cb1b-4867-950b-cab88c2eb865" />
As shown on image below, the simplified real system consists of a third-order transfer funtcion with no zeros and a white noise component.


The goal is to estimate the real system with a transfer function of the lowest order possible.

<img width="1046" height="396" alt="2nd_order_Estimation" src="https://github.com/user-attachments/assets/a5360e59-6ccb-4ee2-a0ee-7fa69075bd5e" />

Let's assume that we don't know what's inside the black box (the real system) - a little overshoot at the step response and oscillation may suggest that the system should be estimated with at least 2nd order transfer function. It's clear that the static error value goes to zero and there's no visible transport delay in the step response.
<img width="1140" height="787" alt="step_response_real_system" src="https://github.com/user-attachments/assets/62f01310-73ed-4613-ae45-b52a80e15010" />

I've estimated the model with 2nd order transfer function with no zeros - it's based on simple equation:
<img width="333" height="87" alt="obraz" src="https://github.com/user-attachments/assets/ff1262ff-c430-463d-b374-e92b53e1a558" />
Initially, the comparision looks like this: 
<img width="1130" height="783" alt="initial_comparision_2nd_order_vs_realsys" src="https://github.com/user-attachments/assets/29f9ee5b-63c0-4294-b410-e19fde95224f" />

After a few changes model's response looks similar to the real system's response. The model fits into test data well, but there's a MATLAB function to estimate a model with just one line of code - this will come in handy in the next release;
<img width="1135" height="783" alt="test_data_2nd_order_est" src="https://github.com/user-attachments/assets/9e03d81b-ec06-4ba2-aee2-bb8cbed4e196" />
