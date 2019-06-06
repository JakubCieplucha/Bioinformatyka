function [columnCost,completeCost] = completeCost(x,numbers,order)
%{
This function calculates the complete cost of a multiple sequence aligment.
Input parameters: x- all neclueotides of every sequence placed in a matrix,
 numbers- the values for the substitiution matrix, order- the order of
 nucleotides in the substitution matrix.
Output parameters: columnCost- the cost of each column in an array,
completeCost- the complete cost of the alignment.
%}
[a,b] = size(x);

for i = 1 : a
    cost = 0;
    for j = 1 : b - 1
        for k = j + 1 : b
            value = findValueMSA(numbers,order,x(i,j),x(i,k));
            cost = cost + value;
            %%
        end
    end
    columnCost(i)=cost;
end
completeCost=sum(columnCost);
end