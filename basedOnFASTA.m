%{
This function saves the results of the program to a file based on the FASTA
format.
Input parameters: s1,s2- the sequences; sX,sY- the starting coordinates of
all local pairings; x,y- the end coordinates of all local pairings; number-
the succession of compared sequences.
%}
function basedOnFASTA(s1,s2,sX,sY,x,y,number)
n = length(s1);
for i = 1 : n  
fileName = ['BasedOnFASTA',num2str(number),'.txt'];
fileID = fopen (fileName, "at" );
fprintf (fileID,"     " + i + "\n");    
fprintf (fileID,">seq1: " + sX(i) + "-" + (x(i) - 1) + "\n");
fprintf (fileID,s1{i} + "\n");
fprintf (fileID,">seq2: " + sY(i) + "-" + (y(i) - 1) + "\n");
fprintf (fileID,s2{i} + "\n");
fclose("all");
end
end