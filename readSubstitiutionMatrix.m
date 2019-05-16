%{
A function that takes reads the substitiution matrix from an xls file in
the directory.
Input parameters: filename- the name of the xls file in the directory.
Output parameters; numbers- the scores for each nucleotide, order- the
order of the nucleotides.
%}
function [numbers,order,check] = readSubstitiutionMatrix(filename)
[numbers, order] = xlsread (filename);
[a,b] = size(order);
check = 1;
if a ~= 5 || b ~= 5 
    check = 0;
end

for x = 2 : 5  
      if (order{1,x} ~='A' && order{1,x} ~='C' && order{1,x} ~='G' && order{1,x} ~='T')
            disp('A')
          check = 0
      end 
end
for y = 2 : 5  
      if (order{y,1} ~='A' && order{y,1} ~='C' && order{y,1} ~='G' && order{y,1} ~='T')
          disp('B')
          check = 0
      end 
end

end