function exe2(s,s1,mode,number,match,mismatch,gap,i,j)
%{
This function utilises the functionality of the second program without the
redunant code.
%}
sequence1 = insertBefore(s(i).sequence,1,' ');
sequence2 = insertBefore(s1(i).sequence,1,' ');
if mode == "distance"
[score,operations,matrix] = scoreMatrix(sequence1,sequence2,match,mismatch,gap,1);   
elseif mode == "similarity"
[score,operations,matrix] = scoreMatrix(sequence1,sequence2,match,mismatch,gap,2);      
end
[seq,seq1,pattern,len,identity,gaps] = optimalPath(sequence1,sequence2,operations);
id1 = s(i).identifier;
id1 = strsplit((char(id1)),' ');
id2 = s1(j).identifier;
id2 = strsplit((char(id2)),' ');
saveParameters(number,id1(1),id2(1),mode,match,mismatch,gap,score,len,identity,gaps,seq,seq1,pattern);
nwDisplay(matrix,operations,id1(1),id2(1),number);
end