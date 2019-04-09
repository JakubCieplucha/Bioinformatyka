%{
This function changes the changes the sections of sequences that where
found to be a local pairing according to the operations they were submited
to.
Input parameters: s,s1- the sequences; operations- an array of operations
for each local pairing; x,y- the end coordinates for all local pairings;
sX,sY- the start coordinates for all local pairings.
Output parameters: se,se1- the extracted parts of sequences that
constitiute the local pairings after alterations/
%}
function[se,se1,lengths] = changeSequences(s,s1,operations,x,y,sX,sY)
[a,b] = size(operations);
empty = '_';
for c = 1 : a 
stX = sX(c) + 1;
stY = sY(c) + 1;
amount = length(operations(c,1:end));
tempS=s( stX : x(c) );
tempS1=s1( stY : y(c) );
opr = operations(c,1:end); 
d=0;
    for i = 1 : amount
        if ismissing(operations(c,i))
            d = d + 1;
        end
            switch opr(i)
            case "insertion"
            tempS = [tempS(1 : i - 1 - d) empty tempS(i - d : end)];
            case "deletion"
            tempS1 = [tempS1(1 : i - 1 - d) empty tempS1(i - d : end)];
        end      
    end
    se(c) = {tempS};
    se1(c) = {tempS1};
    lengths(c) = length(tempS);
end

end
