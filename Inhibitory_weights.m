function [vec,weights] = Inhibitory_weights(Dim,lengthC,MaxStrength)

vec = zeros(Dim,1);
weights = zeros(Dim,Dim);
halfDim = Dim/2;

%state_vectors
for i = 1:80
    if (i < 21)
        vec(i) = 10;
    elseif (i < 61)
        vec(i) = 40;
    else
        vec(i) = 10;
    end                  
end

%one weight
for i = 1:halfDim
    weights(i,1) = -1*MaxStrength * exp(-1*(i-1) / lengthC);
end

for i = (halfDim+1):Dim
    weights(i,1) = -1*MaxStrength * exp(-1*((Dim+1)-i) / lengthC);
end

%all weights
for j = 2:80
    weights(1,j) = weights(Dim,j-1);
    for k = 1:Dim-1
    weights(k+1,j) = weights(k,j-1);
    end
end
    
