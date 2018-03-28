%% Author: Harikrishnan NB
% This code does DFT (Discrete Fourier Transform) from scratch


close all;
clear all;
clc;


t = 0+0.001:0.001:2;
x = sin(2*pi*13*t) + cos(2*pi *25*t) ; % Input Signal


%x = [zeros(1,975) ones(1,50) zeros(1,975)];% Give a square wave input 

f0 = 1/t(end);% Fundamental Frequency

N = length(t);
k1 = [0: N/2];
k2= [-(N-(N/2 + 1)):-1];
k = [k1, k2];

theta = [0:N-1]*(2*pi/N);

B = 1/sqrt(N)*exp(-i*k'*theta); % Basis

X = B*x';% X is the DFT Coeffcients


subplot(311);
h = plot(t,x,'Linewidth',1.2);
grid;
xlabel('Time');
ylabel('Amplitude');
title('Original Signal');

subplot(312)
h = plot([k2,k1]*f0, abs([X(N/2 + 1 : N);X(1 : N/2)]),'Linewidth',1.1);
grid;
xlabel('Frequency f ');
ylabel('Magnitude Spectrum');
title('DFT');

% Inverse Discrete Fourier Transform

yhat = B'*X;
subplot(313);
h = plot(t, yhat,'Linewidth',1.2);
grid;
xlabel('Time');
ylabel('Amplitude');
title('IDFT');