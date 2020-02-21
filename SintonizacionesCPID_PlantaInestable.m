%Con lo que respecta a este aspecto, una vez identificado el modelo
%equivalente el cual debe ser controlado se analiza su comportamiento ante
%distintos controladores se detallan en la referencia: .  O.  O'Dwyer,  Handbook  of  PI  and 
% PID  controller  tuning  rules,  3rd  ed,Londres: Imperial College Press, 
% pp. 440-480, 2017.


%Para limpiar espacio de trabajo
clc
clear all;
close all;
%se define s para la frencuncia  s para las funciones de transferencia
s = tf('s');

%Dado que el menor IAE dio con el método de alfaro 123c pero debido a la
%documentacion encontrad se escoge el método de chidambaram.

%El modelo equivalente de la planta obtenido es Unestable FOLPD o bien sistema de orden uno, inestable y con tiempo muerto:

P = (1.1331*exp(-0.020*s))/(0.0274*s-1);


%Se analizan los controladores PID mediante 3 diferentes reglas de
%sintonización:

%Método 1 en la bibliografia seccion 4.10.2 
%Parámetros encontrados mediante la regla Valentine y Chimdambaram pagina
%448
K1 = 1.110591192;
Ti1 =  0.30056;
Td1 = 0.0120224;

%La funcion de transferencia que representa al controlador PIDestandar....
%Segun la bibliografia se llama PID ideal
C1 = K1*(1 + 1/Ti1*s + Td1*s);


%salida para el modelo de un vehiculo de levitacion magnetica utilizando regla Valentine y Chimdambaram 
%ante una entrada escalon unitaria
Y1 = (P*C1)/(1+P*C1);


%Método 2 en la bibliografia seccion 4.10.3
%Segun la bibliografia se llama  Ideal controller in 
% series with a first order lag
K2 =  1.325321817;
Ti2 = 0.3545485361;
Td2 = 0.01;
Tf= 0.00255642;

%La funcion de transferencia que representa al controlador PIDestandar....

C2 =  K2*(1 + 1/Ti2*s + Td2*s)*(1/(Tf*s+1));


%salida para el modelo de un vehiculo de levitacion magnetica utilizando regla Valentine y Chimdambaram 
%ante una entrada escalon unitaria
Y2 = (P*C2)/(1+P*C2);


%Método 3 en la bibliografia seccion 4.10.6 según al bibliografía
%Two degree of freedom controller 1
K3 = 1.570602494;
Ti3 = 0.0142747157;
Td3 = 0.0114915; 
B = 1;
a = 0.3137;
%Con N infinito


%graficando la respuesta a una entrada escalon unitaria 
figure(1)
step(Y1);
hold on
%en ventanas separadas
grid


%graficando la respuesta a una entrada escalon unitaria 
figure(2)
step(Y2);
hold on
%en ventanas separadas
grid










