function[operations] = optimalPathMSA(matrix,s,s1,numbers,order,gap)
%{
This function does a traceback of the alignment.
%}
[n,m] = size(matrix);
d=n;
e=m;
numOfOp=0;
while (d ~=0) && (e ~=0)
numOfOp = numOfOp + 1;
    val = [NaN NaN NaN NaN];
    cost=NaN;
    across = NaN;
    if d == 1
        e = e - 1;
        operations(numOfOp) = ("insertion");
    elseif e == 1
        d = d - 1;
        operations(numOfOp) = ("deletion");
    else
        if s(d) == s1(e)
            value = findValueMSA(numbers,order,s(d),s1(e));
            if ( matrix(d-1,e-1) + value ) == matrix(d,e)
                val(4) = matrix(d-1,e-1) + value;
            end
        elseif s(d) ~= s1(e)
            cost = findValueMSA(numbers,order,s(d),s1(e));
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
        [valMin,ind] = min(val);
        if ind == 3
            d = d - 1;
            operations(numOfOp) = ("deletion");
        elseif ind == 2
            e = e - 1;
            operations(numOfOp) = ("insertion");
        elseif ind == 1
            d = d - 1;
            e = e - 1;
            operations(numOfOp) = ("substitiution");
        elseif ind == 4
            d = d - 1;
            e = e - 1;
            operations(numOfOp) = ("match");
        end
    end
end
operations = flip(operations);
operations = operations(2:end);
end


