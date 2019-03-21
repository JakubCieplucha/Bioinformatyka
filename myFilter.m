function [filteredMatrix,row,column] = myFilter(matrix,window,error)
filteredMatrix = zeros(size(matrix));
[row,column]=size(matrix);
c=window-1;
d=row- window + 1 ;
e=column - window + 1;
for i = 1:d
    for j = 1:e
            a=i+window-1;
            b=j+window-1;
           check= diag(matrix(i:a,j:b));
           if sum(check)>=(window-error)
           for r=0:c
               filteredMatrix(i+r,j+r)=matrix(i+r,j+r);
           end
           end
    end
end
end

