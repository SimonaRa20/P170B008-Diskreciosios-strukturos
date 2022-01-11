function combs = matlabComb(values, k)
    n = numel(values);% pasiimu elementu skaiciu
    combs = bsxfun(@minus, nchoosek(1:n+k-1,k), 0:k-1); % atimame
    combs = reshape(values(combs),[],k); % sudeda elementus po k į eilutes
end