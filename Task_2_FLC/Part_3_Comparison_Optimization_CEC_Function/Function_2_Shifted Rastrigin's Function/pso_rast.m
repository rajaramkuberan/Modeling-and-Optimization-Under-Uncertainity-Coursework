%% Particle Swarm Optimization 15 Iterations
options = optimoptions('particleswarm','PlotFcn',{@pswplotbestf});
%rng default
initial_flag = 0;
for i=1:15
    % Rastrigins Function for D=2
    [swarm_x,swarm_val,swarm_exit_flag,swarm_output] = particleswarm(@rast,2,[-100,-100],[100,100],options)
    % Rastrigins Function for D=10
    [swarm_x,swarm_val,swarm_exit_flag,swarm_output] = particleswarm(@rast,10,[-100,-100],[100,100],options)
    swarm_m_x(i,:) = swarm_x
    swarm_m_val(i) = swarm_val
    swarm_m_exit_flag(i) = swarm_exit_flag
    swarm_m_output(i) = swarm_output
    % save visualizations to file
    fname = sprintf('pso(%d).fig', i) ;
    savefig(fname)
end
%% Metrics
swarm_val_max = max(swarm_m_val)
swarm_val_min = min(swarm_m_val)
swarm_val_mean = mean(swarm_m_val)
swarm_val_std = std(swarm_m_val)