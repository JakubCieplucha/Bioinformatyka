%{
This function displays all the local pairings in a graphical form, each in
a different figure/
Input parameters: matrix- the score matrix, operations- an array of all the
operations between all the local pairs; identifier1,identifier2- the id's
of both sequences; number- the succesion of compared sequnces; sX,sY- the
starting coordinates of all local pairings.
%}

function displaySW(matrix,operations,identifier1,identifier2,number,sX,sY)
[n,m] = size(matrix);
[o,p] = size(operations);
biggest=max(max(matrix));
change = 3 * biggest;
for l = 1 : o
    newMatrix = matrix;
    i = sX(l);
    j = sY(l);
    newMatrix(i,j) = change;
    for h = 1 : p
        if operations(l,h) == "match"
            i = i + 1;
            j = j + 1;
            newMatrix(i,j) = change ;
        elseif  operations(l,h) == "insertion"
            j = j + 1;
            newMatrix(i,j) = change ;
        elseif operations(l,h) == "substitiution"
            i = i + 1;
            j = j + 1;
            newMatrix(i,j) = change ;
        elseif operations(l,h) == "deletion"
            i = i + 1;
            newMatrix(i,j) = change ;
        end 
    end
figure;
imagesc(newMatrix);
colorbar;
titleTxt=['Smith-Waterman algorithim for ',identifier1,'and',identifier2,num2str(l)];
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
saveasTxt=['SW',num2str(l),num2str(number),'.png'];
saveas(gcf,saveasTxt);
end
end