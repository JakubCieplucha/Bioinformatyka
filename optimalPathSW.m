%{
This function generates the optimal path for all local pairings, find the
start and end point in all pairings.
Input parameters : matrix- the score matrix, s- the first sequence, s1- the
second sequence,numbers- the scores for each nucleotide, order- the
order of the nucleotides, gap- the gap value.
Output parameters: x,y- the end coordinates of all pairings;
startingPointX,startingPointY- the start coordinates for all the pairings,
biggest- the maximum value in the score matrix.
%}

function[x,y,operations,startingPointX,startingPointY,biggest] = optimalPathSW(matrix,s,s1,numbers,order,gap)
biggest = max(max(matrix));
[n,m] = size(matrix);
number=0;
for a = 2 : n
    for b = 2 : m
        if matrix(a,b) == biggest
        number = number + 1;
        x(number) = a;
        y(number) = b;
        end
    end
end


for c = 1 : length(x)
    d = x(c);
    e = y(c);
    numOfOp=0;
    while matrix(d,e) ~= 0
        
        val = [NaN NaN NaN NaN];
        numOfOp = numOfOp + 1;
        cost = -100;
        if s(d) == s1(e)
            value = findValueSW(numbers,order,s(d),s1(e));
        if ( matrix(d-1,e-1) + value ) == matrix(d,e)
            val(4) = matrix(d-1,e-1) + value;
        end
        elseif s(d) ~= s1(e)
            cost = findValueSW(numbers,order,s(d),s1(e));
            across = matrix(d-1,e-1);
            if (across + cost) == matrix(d,e)
            val(1) = across;
            end      
        end
            top = matrix(d-1,e);
            left = matrix(d,e-1);
            if matrix(d,e) == (top + gap)
            val(3)= top;
            end
            if matrix(d,e) == (left + gap)
            val(2)= left;
            end
            [valMax,ind] = max(val);
            if ind == 3
            d = d - 1;
            operations(c,numOfOp) = ("deletion");
            elseif ind == 2
            e = e - 1;
            operations(c,numOfOp) = ("insertion");
            elseif ind == 1
            d = d - 1;
            e = e - 1;
            operations(c,numOfOp) = ("substitiution");
            elseif ind == 4
            d = d - 1;
            e = e - 1;
            operations(c,numOfOp) = ("match");    
            end
        
        if matrix(d,e) == 0
        startingPointX(c) = d;
        startingPointY(c) = e;
        end
    end
end
found = exist ('operations','var');
if found == 1
[k,l] = size(operations);
for v = 1 : k
operations(v,1:l) = flip(operations(v,1:l));
end
else
operations = 0;
startingPointX = 0;
startingPointY = 0;
x = 0;
y = 0;
end
end