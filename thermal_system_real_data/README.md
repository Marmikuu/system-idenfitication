# system-idenfitication
In this example, I will attempt to identify real thermal plant - it was controlled by Mitsubishi FX5CPU PLC in a laboratory setting;

The real plant consist of a metal sheet enclosure with Pt100 temperature sensor and a hot-end heater controlled with PWM signal through SSR(solid state relay);
The data had to be offset, for the initial temperature was about 25C and it caused some bugs when using ssest() function; I'll try to fix this in the new release;


Estimate transport delay was done manually:
The first data set (25 % PWM duty cycle step response)
Step signal rises at t =  56.2 seconds and the response of the system starts to rise at t = 58.0 s. That means the delay is 1.8 s long and its 1.8s/0.1s = 18 PLC cycles
<img width="652" height="513" alt="obraz" src="https://github.com/user-attachments/assets/720f1b26-c479-4eda-878e-accd1c09d3e6" />

Similarly, I calculated transport delay at the second data set (50 % PWM duty cycle step response). 
<img width="627" height="520" alt="obraz" src="https://github.com/user-attachments/assets/3dfca196-9790-4b2f-ac32-fa2979300a1b" />

An initial identification was done with ssest() function. But there was some room for improvement, so I adjusted coefficients manually
<img width="660" height="520" alt="obraz" src="https://github.com/user-attachments/assets/a8f9f70f-dbde-40f2-9b23-56da408452f1" />

Here are the results - fortunately, model was validated with two independent data sets and fit tends to be about 83%. I will attempt to fit the model better in the next release
<img width="1712" height="890" alt="obraz" src="https://github.com/user-attachments/assets/6d883c91-ff07-429d-9ace-1347202aefc1" />
