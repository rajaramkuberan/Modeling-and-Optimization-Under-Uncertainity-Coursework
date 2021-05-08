%% simannul 15 iterations
initial_flag = 0;
options = optimoptions('simulannealbnd','PlotFcns',{@saplotbestf});
for i=1:15
    % Rastrigins Function for D=2
    [sn_x,sn_val,sn_exit_flag,sn_output] = simulannealbnd(@rast,[1 1],[-100,-100],[100,100],options)
    % Rastrigins Function for D=10
    % [sn_x,sn_val,sn_exit_flag,sn_output] =simulannealbnd(@rast,[1 1 1 1 1 1 1 1 1 1],[-100,-100],[100,100],options)
    saa_x(i,:) = sn_x
    saa_val(i) = sn_val
    saa_exit_flag(i) = sn_exit_flag
    saa_output(i) = sn_output
    % save visualizations to file
    fname = sprintf('saa(%d).fig', i) ;
    savefig(fname)
end
%% Metrics
saa_max = max(saa_val)
saa_min = min(saa_val)
saa_mean = mean(saa_val)
saa_std = std(saa_val)