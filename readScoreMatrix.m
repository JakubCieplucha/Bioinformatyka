%{
A function that reads the substitiution matrix from an xls file in
the directory.
Input parameters: filename- the name of the xls file in the directory.
Output parameters; numbers- the scores for each nucleotide, order- the
order of the nucleotides.
%}
function [numbers,order,check] = readScoreMatrix(filename)
[numbers, order] = xlsread (filename);
[a,b] = size(order);
check = 1;
if a ~= 6 || b ~= 6
    check = 0;
end

for x = 2 : 5
    if (order{1,x} ~='A' && order{1,x} ~='C' && order{1,x} ~='G' && order{1,x} ~='T' && order{1,x} ~='_')
        
        check = 0;
    end
end
for y = 2 : 5
    if (order{y,1} ~='A' && order{y,1} ~='C' && order{y,1} ~='G' && order{y,1} ~='T' && order{y,1} ~='_')
        
        check = 0;
    end
end

end
