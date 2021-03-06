% Corentin Rejaud, Section #1
% Recitation Problems - Week #1, 01/28/2013

%%Problem 2
P = linspace(0, 400, 5)';
T_i = P.*1./0.08314472;
T_vw = (P + (2^2*5.536)/(1^2)) * (1-2*0.03049) / (0.08314472);
char('    P       T_i       T_vw     ', ...
'--------------------------', ...
num2str([P,T_i,T_vw], '%10.2f'))
V = linspace(1, 9, 9)';
T_i = (220.*V) ./ (0.08314472);
T_vw = (220 + (2^2*5.536)./(V.^2)).*(V-2*0.03049) / (0.08314472);
char('  V           T_i         T_vw', ...
'-------------------------------', ...
num2str([V,T_i,T_vw], '%13.3f'))