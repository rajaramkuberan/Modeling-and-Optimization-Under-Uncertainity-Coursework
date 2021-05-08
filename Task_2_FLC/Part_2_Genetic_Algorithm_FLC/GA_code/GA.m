% Genetic Algorithm

clear
clc

%% controling paramters of the GA algortihm

M = 50; % number of chromosomes(assumed)
N = 50;  % number of genes assumed(variables)
MaxGen = 150;
Pc = 0.85;
Pm = 0.01;
Er = 0.05;


%%  Initialization
[ population ] = initialization(M, N);
for i = 1 : M
    population.Chromosomes(i).fitness = mean( population.Chromosomes(i).Gene(:) );
end

g = 1;
disp(['Generation #' , num2str(g)]);

%% GA Process loop
for g = 2 : MaxGen
    disp(['Generation #' , num2str(g)]);
    
    for k = 1: 2: M
        % Selection
        [ parent1, parent2] = selection(population);
        
        % Crossover
        
        [child1 , child2] = crossover(parent1 , parent2, Pc, 'single');
        
        % Mutation
        
        [child1] = mutation(child1, Pm);
        [child2] = mutation(child2, Pm);
        
        newPopulation.Chromosomes(k).Gene = child1.Gene;
        newPopulation.Chromosomes(k+1).Gene = child2.Gene;
    end
    
    for i = 1 : M
        newPopulation.Chromosomes(i).fitness = mean( newPopulation.Chromosomes(i).Gene(:) );
    end
    % Elitism
    [ newPopulation ] = elitism(newPopulation, Er);
    
    population = newPopulation;
    
end

for i = 1 : M
    population.Chromosomes(i).fitness = mean( population.Chromosomes(i).Gene(:) );
end


disp('The best solution found is: ');

[max_val , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');

population.Chromosomes(indx(1)).Gene
population.Chromosomes(indx(1)).fitness

