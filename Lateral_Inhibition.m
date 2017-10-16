clc;clear;
%Initilization
Dimensions = 80;
HalfDim = Dimensions/2;
Iter = 50;

upperLim = 60;
lowerLim = 0;
lengthConstant = 2;
Epsilon = 0.1;
maxStrength = 0.1;

%4.19
[StateVec,InhibitWeight] = Inhibitory_weights(Dimensions,lengthConstant,maxStrength);
finalState = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec,InhibitWeight);
%4.20
maxStrength = 0.2;
[StateVec,InhibitWeight2] = Inhibitory_weights(Dimensions,lengthConstant,maxStrength);
finalState2 = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec,InhibitWeight2);
%4.21
maxStrength = 0.5;
[StateVec,InhibitWeight3] = Inhibitory_weights(Dimensions,lengthConstant,maxStrength);
finalState3 = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec,InhibitWeight3);
%4.22
maxStrength = 1;
[StateVec,InhibitWeight4] = Inhibitory_weights(Dimensions,lengthConstant,maxStrength);
finalState4 = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec,InhibitWeight4);
%4.23
maxStrength = 2;
[StateVec,InhibitWeight5] = Inhibitory_weights(Dimensions,lengthConstant,maxStrength);
finalState5 = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec,InhibitWeight5);

figure('Name','4.19');
x = 12:30;
plot(x,StateVec(12:30),'+',x,finalState(12:30),'*');
ylim([0,50]);
title('Simple Lateral Inhibition - Maximum Inhibition: 0.1');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');

figure('Name','4.20');
x = 12:30;
plot(x,StateVec(12:30),'+',x,finalState2(12:30),'*');
ylim([0,50]);
title('Simple Lateral Inhibition - Maximum Inhibition: 0.2');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');

figure('Name','4.21');
x = 12:30;
plot(x,StateVec(12:30),'+',x,finalState3(12:30),'*');
ylim([0,50]);
title('Simple Lateral Inhibition - Maximum Inhibition: 0.5');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');

figure('Name','4.22');
x = 12:30;
plot(x,StateVec(12:30),'+',x,finalState4(12:30),'*');
ylim([0,50]);
title('Simple Lateral Inhibition - Maximum Inhibition: 1.0');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');

figure('Name','4.23');
x = 12:30;
plot(x,StateVec(12:30),'+',x,finalState5(12:30),'*');
ylim([0,50]);
title('Simple Lateral Inhibition - Maximum Inhibition: 2.0');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');



