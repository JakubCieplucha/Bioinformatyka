%{
This function determins the pattern- a visal representation of all the
operations that where made between all the local pairings inside the score
matrix.
Input parameters: operations- all the operations between each local
pairing.
Output parameters: patterns- the generated patterns, gaps- the number of gaps in each local pairing,
 identity- the number of matches in all local pairings 
%}
function [patterns,gaps,identity] = patterns (operations)
[a,b]=size(operations);
for i = 1 : a
    patterns(i)="";
    gaps(i) = 0;
    identity(i) = 0;
    for j = 1 : b
        if operations(i,j) == "insertion"
        patterns(i) =  patterns(i) + " ";
        gaps(i) = gaps(i) + 1;
        elseif operations(i,j) == "deletion"
        patterns(i) =  patterns(i) + " ";
        gaps(i) = gaps(i) + 1;
        elseif operations(i,j) ==  "substitiution"
        patterns(i) =  patterns(i) + "|";
        elseif operations(i,j) == "match"
        patterns(i) =  patterns(i) + "*" ;
        identity(i) = identity(i) + 1;
        end
    end
end
end