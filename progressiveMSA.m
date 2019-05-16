function[matrix,score]= progressiveMSA(s,s1,numbers,order,gap)
%{
This function is used to match two sequences based on the submited
scoreMatrix.
%}
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
        match = NaN;
        value = NaN;
        across = NaN;
        if s(a) == s1(b)
            number = findValueMSA(numbers,order,s(a),s1(b));
            match = matrix(a-1,b-1) + number;
        elseif s(a) ~= s1(b)
            value = findValueMSA(numbers,order,s(a),s1(b));
            across = matrix(a-1,b-1) + value;
        end
        top = matrix(a-1,b) + gap;
        left = matrix(a,b-1) + gap ;
        val = [left top across match];
        valMin = min(val);
        matrix(a,b) = valMin;
        
    end
end
score = matrix(n,m);
end