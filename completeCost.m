function [columnCost,completeCost] = completeCost(x,numbers,order)
%{
This function calculates the complete cost of a multiple sequence aligment.
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