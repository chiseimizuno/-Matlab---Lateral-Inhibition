clc;clear;
%Initilization
Dimensions = 80;
HalfDim = Dimensions/2;
Iter = 50;

upperLim = 60;
lowerLim = 0;
lengthConstant = 10;
Epsilon = 0.1;
maxStrength = 1;

%State Vec + Inhibitition weights
[buffer,InhibitWeight] = Inhibitory_weights(Dimensions,lengthConstant,maxStrength);

for i = 1:80
   InhibitWeight(i,i)=0; %Turn off self Inhibition
end

%Figure 4.26
StateVec0 = zeros(Dimensions,1);
StateVec0(16)=10;StateVec0(17)=20;StateVec0(18)=30;StateVec0(19)=40;StateVec0(20)=50;
StateVec0(21)=40;StateVec0(22)=30;StateVec0(23)=20;StateVec0(24)=10;
finalState = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec0,InhibitWeight);


%Figure 4.27
StateVec = 10*ones(Dimensions,1);
StateVec(16)=10;StateVec(17)=20;StateVec(18)=30;StateVec(19)=40;StateVec(20)=50;
StateVec(21)=40;StateVec(22)=30;StateVec(23)=20;StateVec(24)=10;
finalState2 = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec,InhibitWeight);

%Figure 4.28
StateVec2 = 10*ones(Dimensions,1);
StateVec2(14)=20;StateVec2(15)=30;StateVec2(16)=20;StateVec2(17)=10;
StateVec2(18)=10;StateVec2(19)=20;StateVec2(20)=30;StateVec2(21)=40;
StateVec2(22)=30;StateVec2(23)=20;StateVec2(24)=10;
finalState3 = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec2,InhibitWeight);

%Figure 4.29
maxStrength = 2;
[buffer,InhibitWeight2] = Inhibitory_weights(Dimensions,lengthConstant,maxStrength);
for i = 1:80
   InhibitWeight2(i,i)=0; %Turn off self Inhibition
end
StateVec2 = 10*ones(Dimensions,1);
StateVec2(14)=20;StateVec2(15)=30;StateVec2(16)=20;StateVec2(17)=10;
StateVec2(18)=10;StateVec2(19)=20;StateVec2(20)=30;StateVec2(21)=40;
StateVec2(22)=30;StateVec2(23)=20;StateVec2(24)=10;
finalState4 = FinalVector(Dimensions,Iter,Epsilon,upperLim,StateVec2,InhibitWeight2);

figure('Name','4.26');
x = 12:30;
plot(x,StateVec0(12:30),'+',x,finalState(12:30),'*');
ylim([-1,54]);
title('Winner-Take-All Network - Single Peak, No Bias');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');

figure('Name','4.27');
x = 12:30;
plot(x,StateVec(12:30),'+',x,finalState2(12:30),'*');
ylim([-1,54]);
title('Winner-Take-All Network - Single Peak, Bias');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');

figure('Name','4.28');
x = 12:30;
plot(x,StateVec2(12:30),'+',x,finalState3(12:30),'*');
ylim([-1,54]);
title('Winner-Take-All Network - Twin Peak, Inhibition: 1.0');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');

figure('Name','4.29');
x = 12:30;
plot(x,StateVec2(12:30),'+',x,finalState4(12:30),'*');
ylim([-1,54]);
title('Winner-Take-All Network - Twin Peak, Inhibition: 2.0');
xlabel('Neuron');
ylabel('Firing Rate: Spikes/Second');


