%{
This function creates a score matrix based on the provided substitiution
matrix.
Input arguments: s- the first sequence, s1- the second sequence,numbers-the scores, order- order of the nucleotides,
 gap- the gap value.
Output arguments: matrix- the generated score matrix.
%}
function[matrix]= smithWatermanAlgorithm(s,s1,numbers,order,gap)
n = length(s);
m = length(s1);
matrix = zeros(n,m);

for a = 2 : n
    for b = 2 : m
        match = NaN;
        value = NaN;
        number = NaN;
        across = NaN;
        if s(a) == s1(b)
             number = findValueSW(numbers,order,s(a),s1(b));
             match = matrix(a-1,b-1) + number;
        elseif s(a) ~= s1(b)
            value = findValueSW(numbers,order,s(a),s1(b));
            across = matrix(a-1,b-1) + value;
        end
            top = matrix(a-1,b) + gap;
            left = matrix(a,b-1) + gap ;
            val = [match across left top];
            valMax = max(val);
            matrix(a,b) = valMax;
       
    end
end

for g = 2 : n
    for e = 2 : m
        if matrix(g,e) < 0
        matrix(g,e) = 0;
        end
    end
end
end