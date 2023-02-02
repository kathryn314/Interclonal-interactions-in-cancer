for q = 0:20
    run Resultclr.m
for k = 1:1000
    run Variables.m
    run Lattice.m
end

% disp('Frequency of mutant cells:')
% disp(Mutant)
% 
% disp('Frequency of normal cells:')
% disp(Normal)
% 
% disp('Total number of stimulations:')
% disp(max(k))
% 
% 
% disp('Average generation for mutant cells to take over:')
% disp(H/Mutant)
% 
% disp('Average generation for normal cells to take over:')
% disp(G/Normal)

disp('Probability of mutation taking over tissue:')
disp(Mutant/max(k))
end
