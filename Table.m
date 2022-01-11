function [table] = Table(elements, n, table, line)
lineArray = convertStringsToChars(line);
newRow = zeros(1,n); % susikuriu masyva su 0-ais - nauju elementu masyva
for i = 1:n % einame per elementus
    for j=1:strlength(line) % einu per isrinktu variantus
        if lineArray(j) == elements(i) % tikriname ar isrinktame variante yra tam tikras elementas
            newRow(i) = newRow(i) + 1; % jei yra, irasome 1 toje vietoje
        end
        
    end
end
% is lenteles pasiimame visus duomenis
data = get(table,'Data');

if size(data) == [0, n+1] % kai nera nei vienos duomenu eilutes
    newRow = cat(2, 1, newRow); % pridedam 1 pradžioje pirmos eilutes
    table.Data = array2table(newRow); % prilyginame, irasydami newRow reiksmes
else
    data(end+1,:)= {0}; % uzpildome pirmaja eilute 0
    data(end,1) = num2cell(height(data)); % isidedame derinio numeri
    data{end,2:n+1} = newRow(1:n); % perrasome informacija is newRow
    set(table,'data', data);
end
return
