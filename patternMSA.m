function [pattern,x] = patternMSA(altered,numberOfSeq)
%{
This function creates a visual representation of the alignment.
%}
len = length(altered(1).sequence);
for i = 1 : len
    for j = 1 : numberOfSeq
        x(i,j)= altered(j).sequence(i);
    end
end
pattern = "";

for l = 1 : len
    check = 1;
    reference = x(l,1);
    for k = 2 : numberOfSeq
        if reference ~= x(l,k)
            check = 0;
        end
    end
    if check == 1
        pattern = pattern + "*";
    else
        pattern = pattern + " ";
    end
    
end
end