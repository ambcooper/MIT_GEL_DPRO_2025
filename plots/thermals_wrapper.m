clear
CFM = 5:10:300;

p = parameters();
which_heater = 1; 
num_heaters = 1;
[N_cells,m_heater] = heaters(which_heater, num_heaters); % fill in with values
for i=1:length(CFM)
    [time(i),power(i)] = thermals_ode(CFM(i), N_cells, m_heater, p);
    h(i) = heat_transfer_correlation(CFM(i), N_cells, p);
end

figure
yyaxis left
plot(CFM,time)
yyaxis right
plot(CFM,power)
hold on
plot(CFM,h)
legend('Time to 1degC (s)','Steady state power (W)','Heat Transfer Coeff')
xlabel('CFM')
improvePlot