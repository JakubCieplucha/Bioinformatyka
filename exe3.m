function exe3(s,s1,subMatrixFile,gap,i,j)
%{
This function utilises the functionality of the third program without the
redunant code.
%}
sequence1 = insertBefore(s(i).sequence,1,' ');
sequence2 = insertBefore(s1(i).sequence,1,' ');
[A,C,G,T,equal]=readSubstitiutionMatrix(subMatrixFile);
if equal == 1
matrix = smithWatermanAlgorithm(sequence1,sequence2,A,C,G,T,gap);
[x,y,operations,sX,sY,score] = optimalPathSW(matrix,sequence1,sequence2,A,C,G,T,gap);
if isstring(operations)
[pattern1,gaps,identity] = patterns(operations);
[sequence,sequence1,lengths] = changeSequences(sequence1,sequence2,operations,x,y,sX,sY);
id1 = s(i).identifier;
id1 = strsplit((char(id1)),' ');
id2 = s1(j).identifier;
id2 = strsplit((char(id2)),' ');
saveParametersSW(A,C,T,G,1,id1(1),id2(1),gap,score,lengths,identity,gaps,sequence,sequence1,pattern1)
basedOnFASTA(sequence,sequence1,sX,sY,x,y,1);
displaySW(matrix,operations,id1(1),id2(1),1,sX,sY);
else 
    disp('No local parings where found')
end
end
end