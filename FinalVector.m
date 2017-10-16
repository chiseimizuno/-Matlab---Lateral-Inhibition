function [currentState] = FinalVector(Dim,iter,epsilon,upperLim,initState,inhibit)

%current neuron

currentState = initState;
newState = zeros(Dim,1);

for i = 1:iter
    for j = 1:Dim
       newState(j) = currentState(j) + epsilon*(initState(j)...
           + dot(inhibit(:,j),currentState)-currentState(j));
    end
    % Limits
    for l = 1:Dim
        if (newState(l) > upperLim)
            newState(l) = upperLim;
        elseif (newState(l) < 0)
            newState(l) = 0;
        end
    end
    % Show the change
    if ( (sum(newState) - sum(currentState)) == 0)
       break
    end
    % convert
    currentState = newState;
    
end
