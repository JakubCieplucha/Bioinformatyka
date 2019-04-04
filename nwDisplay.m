%{
This function displays the score matrix in a graphical form of a heat map,
changing the elements along the optimal path to a higher value, so that
they are distinct from the rest.It also saves the heat map to a .png file.
Input parameters: matrix- the score matrix, operations- an ordered
array of operations, indentifier1 - the id of the first
sequence,indentifier2 - the id of the second sequence, number- in case at
least one of the Fasta files had more than one sequence in it, more than
one graph will have to be drawn.To make sure that the graphs are not saved over each other, 
this number is added to the name of the file to keep track of all the graphs
%}
function nwDisplay(matrix,operations,identifier1,identifier2,number)
[n,m] = size(matrix);
newMatrix = matrix;
newMatrix(1,1) = 333;
n = 1;
m = 1;
for i = 1 : length(operations)
    
   switch operations(i)
        
       case "insertion"
          m = m + 1;
          newMatrix(n,m) = 333;
       case "deletion"
           n = n + 1;
           newMatrix(n,m) = 333;
       case "substitiution"
               m = m + 1;
               n = n + 1;
               newMatrix(n,m) = 333;
       case "MatchSub"
            m = m + 1;
            n = n + 1;
            newMatrix(n,m) = 333;
   end
    
end

imagesc(newMatrix);
titleTxt=['Needelman-Wunsh algorithim for ',identifier1,'and',identifier2];
title(titleTxt);
xlabelTxt=['Index of nucleotide in ',identifier2,' sequence'];
xlabel(xlabelTxt);
ylabelTxt=['Index of nucleotide in ',identifier1,' sequence'];
ylabel(ylabelTxt);
if n<50 && m<50
   for a = 1 : n
       for b = 1 : m
            text(b,a,num2str(matrix(a,b)))
       end
   end
end
saveasTxt=['NW',num2str(number),'.png'];
saveas(gcf,saveasTxt);
end