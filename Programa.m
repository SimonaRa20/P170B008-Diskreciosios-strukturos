clc; close all; clear 
%----------------Duomenys---------------
k = 2;
elements = ["k","l"];
%----------------Konstanta--------------
l = 1;
line = '';
n = length(elements);
chr = convertStringsToChars(elements);

%-----------------Programa--------------

%------Grafines sasajos deriniu lentele-

fig = uifigure(); % sukuriama erdve grafinei lentelej
uit = uitable(fig, 'Data', array2table(zeros(0, n+1))); % nubraižoma lentele
pause(1)
if n > 1
    for i = 2:n+1
        uit.ColumnName(i) = chr(i-1); % į pirmą eilutę surašomos galimo reikšmės
    end
else
    uit.ColumnName(2) = cellstr(chr(1));
end
uit.ColumnName(1) = {'Nr.'}; 

%---------------------------------------

disp('v Galimi variantai')
tic
Recursive(line,elements,n,k,l,uit);
toc 
disp('^ Rekursinio metodo trukme')

disp('v Galimi variantai')
combos = matlabComb(elements,k);
combosConvert = cell2mat(combos);
disp(combosConvert);
tic
cc = matlabComb(elements,k);
toc
disp('^ Matlabo deriniu apskaiciavimas')

data = get(uit,'Data');
data(:,1) = [];
data.Variables
imagesc(data.Variables);
colorbar
disp('v Pagal deriniu matematine formule apskaiciuotas deriniu kiekis')
count1 = factorial(n+k-1)/(factorial(n-1)*factorial(k));
disp(count1)
tic
ccc = factorial(n)/(factorial(mod(n-k,1))*factorial(k));
toc
disp('^ Trukme matematines deriniu formules')

disp('v Pagal Matlabo formule apskaiciuotas deriniu kiekis')
count = nchoosek(n+k-1,k);
disp(count)
tic
cc2 = nchoosek(n+k-1,k);
toc
disp('^ Trukme Matlabo formules');

