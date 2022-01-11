function re = Recursive(line,elements,n,k,l,table)
% suku cikla per visus elementus()
for i = l:n 
    % isidedu elementa
    line = line + elements(i); 
    % tikrinu ar atitinka kiek galima pasirinkti kiekis
    if strlength(line) == k 
        % isspausdinu i 'Command Window' galima pasirinkimo varianta
        disp(line);
        % papildau lentele vienu deriniu
        table = Table(elements,n,table,line);
    else
        % kadangi neatitinka salygos kartoju rekursini metoda
        Recursive(line,elements,n,k,i,table) 
    end  
    % išima iš derinio paskutinį pridetą elementą, jog sekanti galėtume patikrinti
    line = extractBetween(line, 1, strlength(line)-1);    
end
return