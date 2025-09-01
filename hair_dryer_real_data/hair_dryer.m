%%%%%%%%%%%%%%%%% NOTICE - the following data set is avaiable through the
%%%%%%%%%%%%%%%%% webiste below:
% https://homes.esat.kuleuven.be/~smc/daisy/daisydata.html

%%%%% In this example project i'm using the data to practice system
%%%%% identification skills. Any rights to data set belong to the author.

% Contributed by:
% 	Favoreel
% 	KULeuven
% 	Departement Electrotechniek ESAT/SISTA
% 	Kardinaal Mercierlaan 94
% 	B-3001 Leuven
% 	Belgium
% 	wouter.favoreel@esat.kuleuven.ac.be
% Description:
% 	Laboratory setup acting like a hair dryer. Air is fanned through a tube
% 	and heated at the inlet. The air temperature is measured by a 
% 	thermocouple at the output. The input is the voltage over the heating 
% 	device (a mesh of resistor wires).
% Sampling:
% Number:
% 	1000
% Inputs:
% 	u: voltage of the heating device 
% Outputs:
% 	y: output air temperature 
% References:
% 	- Ljung L.  System identification - Theory for the 
% 	  User. Prentice Hall, Englewood Cliffs, NJ, 1987.
% 
% 	- Ljung. L. System Identification Toolbox. For Use 
% 	   with Matlab. The Mathworks Inc., Mass., U.S.A., 1991.
% Properties:
% Columns:
% 	Column 1: input u
% 	Column 2: output y
% Category:
% 	mechanical systems


%%%%%%%%%%%%%%%%% Let's start %%%%%%%%%5


clc
clear

%%%%%%%%%%% Import data

load ('hair_dryer_real_data\dryer.dat')


t= (0:1:length(dryer(:,1))-1);

offset_value = 3.5;
x = dryer(:,1);
dryer(:,1) = (x - min(x)) / (max(x) - min(x));

u = dryer(:,1);
y = dryer(:,2);


%%%%%%%%%%%%% Plot the data

figure;
subplot(2,1,1)
plot(t,dryer(:,2))
subplot(2,1,2)
plot(t,dryer(:,1))


figure;
data_dryer = iddata(y,u,1);
system = tfest(data_dryer, 3,2,NaN)
mhw1 = nlhw(data_dryer, [40 12 1], idPiecewiseLinear, idPiecewiseLinear);



system2= nlarx(data_dryer, [1 2 2], 'idSigmoidNetwork');
compare(data_dryer,system, system2,mhw1)
