%{
This function creates a score matrix based on the provided substitiution
matrix.
Input arguments: s- the first sequence, s1- the second sequence, A,C,G,T-
the values for each nucleotide, gap- the gap value.
Output arguments: matrix- the generated score matrix.
%}
function[matrix]= smithWatermanAlgorithm(s,s1,A,C,G,T,gap)
n = length(s);
m = length(s1);
matrix = zeros(n,m);

for a = 2 : n
    for b = 2 : m
        if s(a) == s1(b)
            switch s(a)
                case 'A'
                matrix(a,b) = matrix(a-1,b-1) + A(1);
                case 'C'
                matrix(a,b) = matrix(a-1,b-1) + C(1);
                case 'G'
                matrix(a,b) = matrix(a-1,b-1) + G(1);
                case 'T'
                matrix(a,b) = matrix(a-1,b-1) + T(1);
            end
            else
                top = matrix(a-1,b) + gap;
                left = matrix(a,b-1) + gap ;

            if s(a) == 'A'
                switch s1(b)
                case 'C'
                value = A(2);
                case 'G'
                value = A(3);
                case 'T'
                value = A(4);
                end

            elseif s(a)=='C'
                switch s1(b)
                case 'A'
                value = C(2);
                case 'G'
                value = C(3);
                case 'T'
                value = C(4);
                end
            elseif s(a)=='G'
                switch s1(b)
                case 'A'
                value = G(2);
                case 'C'
                value = G(3);
                case 'T'
                value = G(4);
                end
            else %% T
                switch s1(b)
                case 'A'
                value = T(2);
                case 'C'
                value = T(3);
                case 'G'
                value = T(4);
                end
            end
            across = matrix(a-1,b-1) + value;
            val = [across left top];
            valMax = max(val);
            matrix(a,b) = valMax;
        end
    end
end

for a = 2 : n
    for b = 2 : m
        if matrix(a,b) <0
        matrix(a,b) = 0;
        end
    end
end
end