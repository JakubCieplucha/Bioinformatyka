%{
This function generates the optimal path for all local pairings, find the
start and end point in all pairings.
Input parameters : A,C,G,T- the values for each nucleotide, matrix- the
score matrix, s- the first sequence, s1- the second sequence.
Output parameters: x,y- the end coordinates of all pairings;
startingPointX,startingPointY- the start coordinates for all the pairings,
biggest- the maximum value in the score matrix.
%}

function[x,y,operations,startingPointX,startingPointY,biggest] = optimalPathSW(matrix,s,s1,A,C,G,T,gap)
maximum = max(matrix);
biggest = max(1);
for i = 2 : length(maximum)
    if max(i) > maximum(i-1)
    biggest = maximum(i);
    end
end
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
        if s(d) == s1(e)
            switch s(d)
            case 'A'
            value = A(1);
            case 'C'
            value = C(1);
            case 'G'
            value = G(1);
            case 'T'
            value = T(1);
            end
        if ( matrix(d-1,e-1) + value ) == matrix(d,e)
            numOfOp = numOfOp + 1;
            d = d - 1;
            e = e - 1;
            operations(c,numOfOp) = ("match");
        end
        else
            val = [-2 -2 -2];
            numOfOp = numOfOp + 1;
            top = matrix(d-1,e);
            left = matrix(d,e-1);
            if matrix(d,e) == (top + gap)
            val(3)= top;
            end
            if matrix(d,e) == (left + gap)
            val(2)= left;
            end
            if s(d) == 'A'
            switch s1(e)
            case 'C'
            cost = A(2);
            case 'G'
            cost = A(3);
            case 'T'
            cost = A(4);
            end
            elseif s(d)=='C'
            switch s1(e)
            case 'A'
            cost = C(2);
            case 'G'
            cost = C(3);
            case 'T'
            cost = C(4);
            end
            elseif s(d)=='G'
            switch s1(e)
            case 'A'
            cost = G(2);
            case 'C'
            cost = G(3);
            case 'T'
            cost = G(4);
            end
            else %% T
            switch s1(e)
            case 'A'
            cost = T(2);
            case 'C'
            cost = T(3);
            case 'G'
            cost = T(4);
            end
            end
            across = matrix(d-1,e-1);
            if (across + cost) == matrix(d,e)
            val(1) = across;
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
            end
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