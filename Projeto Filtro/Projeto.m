close all;
clear all;
clc;

fc=1.9; %freqCorte
Rl=8;   %impCarga
wc=2*pi*fc;

%Mili Henry
indutores = [0.10, 0.12, 0.15, 0.18, 0.22, 0.27, 0.33, 0.39, 0.47, 0.56, 0.68, 0.82, 1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2, 10, 12, 15];

%Micro Faraday
capacitores = [1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2, 10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82, 100];

%Passa baixa 2ª Ordem
fprintf("\nButterworth Passa-Baixa\n");

Li = Rl/(pi*fc); %Indutor Ideal;
fprintf("Indutor ideal %.2f mH\n",Li);
Lr = Componente(Li,indutores,'L'); %Indutor Real

Ci = 1/(2*pi*fc*Rl); %Capacitor Ideal
fprintf("Capacitor ideal %.2f µF\n",Ci);
Cr = Componente(Ci,capacitores,'C'); %Capacitor Real

%%Passa-Baixa 2ª Ordem Ideal
C = Ci;
L = Li;
Q = Rl *sqrt(C/L);  %Fator de Qualidade
num = wc^2;
den = [1, wc/Q, num];
LP2I= tf(num,den); %Lowpass Ideal

%%Passa-Baixa 2ª Ordem Real
C = Cr;
L = Lr;
Q = Rl *sqrt(C/L);  %Fator de Qualidade
num = wc^2;
den = [1, wc/Q, num];
LP2R = tf(num,den); %Lowpass Real

%%Comparação
figure;
bode(LP2I, 'b', LP2R, 'r--');
legend('Filtro Ideal','Filtro Real');
grid on;
title('Bode Passa-Baixa 2ª Ordem Woofer');

%Passa alta 2ª Ordem
fprintf("\nButterworth Passa-Alta\n");
Li = Rl/(2*pi*fc); %Indutor Ideal;
fprintf("Indutor ideal %.2f mH\n",Li);
Lr = Componente(Li,indutores,'L'); %Indutor Real

Ci = 1/(pi*fc*Rl); %Capacitor Ideal
fprintf("Capacitor ideal %.2f µF\n",Ci);
Cr = Componente(Ci,capacitores,'C'); %Capacitor Real

s=tf('s');
%%Passa-Alta 2ª Ordem Ideal
C = Ci;
L = Li;
Zc = 1/(s*C);           %Impedancia Capacitor
Zl = s*L;               %Impedancia Indutor
Z1 = (Zl*Rl)/(Zl+Rl);   %Impedancia Paralela 
HP2I = Z1/(Zc+Z1);      %Highpass Ideal

%%Passa-Alta 2ª Ordem Real
C = Cr;
L = Lr;
Zc = 1/(s*C);           %Impedancia Capacitor
Zl = s*L;               %Impedancia Indutor
Z1 = (Zl*Rl)/(Zl+Rl);   %Impedancia Paralela 
HP2R = Z1/(Zc+Z1);      %Highpass Real

%%Comparação
figure;
bode(HP2I, 'b', HP2R, 'r--');
legend('Filtro Ideal','Filtro Real');
grid on;
title('Bode Passa-Alta 2ª Ordem Tweeter');
