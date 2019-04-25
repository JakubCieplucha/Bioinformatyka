%{
This function calculates the score for similarity mode,creates a score
matrix and puts all the operations needed to pair two sequences ia an array .
Input parameters : s-the first sequence, s1-the second sequence;
match,mismatch,gap- the number of points assigned to a specific operation.
Output parameters: score- the similarity between both sequences, operations- an ordered
array of operations, matrix- the generated score matrix.
%}
function [score,operations,matrix ] = similarity(s,s1,match,mismatch,gap )
n = length(s);
m = length(s1);
matrix = zeros(n,m);

for i = 2 : m
    previous = matrix(1,i-1);
    matrix(1,i) = previous + gap;
end
for j = 2 : n
    previous = matrix(j-1,1);
    matrix(j,1) = previous + gap;
end

for a = 2 : n
   for b = 2 : m
            top = matrix(a-1,b) + gap;
            left = matrix(a,b-1) + gap;
      if s(a) == s1(b)
            across = matrix(a-1,b-1) + match;
      else 
            across = matrix(a-1,b-1) + mismatch;
      end
            val = [top left across];
            valMax = max(val);
            matrix(a,b) = valMax ;
   end
end

score = matrix(n,m);

t = n;
y = m;
number = 0;
while  ((t ~= 0) & (y ~= 0))
    
    if s(t) == s1(y)
          number = number + 1;
           t = t - 1;
           y = y - 1;
           operations(number) = ("MatchSub");
      elseif t == 1
             number = number + 1;
             y = y - 1;
             operations(number) = ("insertion");
      elseif y == 1        
            number = number + 1; 
            t = t - 1;
            operations(number) = ("deletion");
      else 
         top = matrix(t-1,y);
         left = matrix(t,y-1);
         across = matrix(t-1,y-1);
         val = [across left top];
         [valMax,ind] = max(val);
      if ind == 3
             number = number + 1;
             t = t - 1;
             operations(number) = ("deletion");
      end
      if ind == 2
            number = number + 1;
            y = y - 1;
               operations(number) = ("insertion");
      end
      if ind == 1 
           number = number + 1;
           t = t - 1;
           y = y - 1;
               operations(number) = ("substitiution");
      end
   end
end

operations = flip(operations);
operations = operations(2:end);
end