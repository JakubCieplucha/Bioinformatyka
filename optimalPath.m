%{
This function alters the sequences to reflect the nescessary operations for the matching of both sequences.
It also generates a pattern, to visualise these operations(| : substitiution, * : match, _ : insertion or deletion).
Input parameters : sequence1 -  the first sequence,sequence2 - the second sequence,  operations- an ordered array of operations.
Output parameters : sequence1 -  the first sequence after alterations ,sequence2 - the second sequence after alterations,
patter - the visual represantation of changes made, len - the lenght of
both sequences ater alterations, identity-  matches between both
sequences , gaps- gaps between both sequences.
%}
function [sequence1,sequence2,pattern,len,identity,gaps] = optimalPath(sequence1,sequence2,operations)
sequence1 = sequence1(2:end);
sequence2 = sequence2(2:end);
n = length(sequence1);
m = length(sequence2);
empty = '_';
amount = length(operations);
for i = 1 : amount
    if n == m
       switch operations(i)   
            case "insertion"
            sequence2(i) = empty;
            case "deletion"
            sequence1(i) = empty;
       end
   elseif i == 1 && operations(1) == "insertion"
         sequence1 = [empty sequence1(1:end)];
   elseif i == 1 &&  operations(1) == "deletion"
         sequence2 = [empty sequence2(1:end)];
   elseif i == amount && operations(amount) == "insertion"
         sequence1=[sequence1(1:end) empty];
   elseif i == amount &&  operations(amount)== "deletion"
         sequence2 = [sequence2(1:end) empty];
   else 
      switch operations (i)  
            case "insertion"
           sequence1 = [sequence1(1:i-1) empty sequence1(i:end)];
            case "deletion"
            sequence2 = [sequence2(1:i-1) empty sequence2(i:end)];
      end
   end
end
len = length(sequence1);
pattern = "";
gaps = 0;
identity = 0;
for j = 1 : length(operations)
   switch operations(j)
       case "insertion"
         pattern = pattern + " ";
         gaps = gaps + 1;
       case "deletion"
        pattern = pattern + " ";
        gaps = gaps+1;
       case "substitiution"
        pattern = pattern + " ";
       case "MatchSub"
        pattern = pattern + "|" ;
        identity = identity+1;
   end 
end
end