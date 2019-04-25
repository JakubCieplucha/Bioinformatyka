function saveParameters(number,id1,id2,mode,match,mismatch,gap,score,len,identity,gaps,seq1,seq2,pattern)

disp("# 1: " + id1);
disp("# 2: " + id2);
disp("# Mode: " + mode );
disp("# Match: " + match);
disp("# Mismatch: " + mismatch);
disp("# Gap: " + gap);
disp("# Score: " + score );
disp("# Length: " + len);
disp("# Identity: " + identity +  "("+round((identity/len)*100) + "%)");
disp("# Gaps: "+ gaps + "("+round((gaps/len)*100) + "%)");
disp(seq1);
disp(pattern);
disp(seq2);

a = round((identity/len)*100);
b = round((gaps/len)*100);
fileName = ['Parameters',num2str(number),'.txt'];
fileID = fopen (fileName, "wt" );
fprintf (fileID,"# 1: " + id1 + "\n");
fprintf (fileID,"# 2: " + id2 + "\n");
fprintf (fileID,"# Mode: " + mode + "\n");
fprintf (fileID,"# Match: " + match + "\n");
fprintf (fileID,"# Mismatch: " + mismatch + "\n");
fprintf (fileID,"# Gap: " + gap + "\n");
fprintf (fileID,"# Score: " + score + "\n");
fprintf (fileID,"# Length: " + len + "\n");
fprintf (fileID,"# Identity: " + identity +  "("+ a + "%%)\n");
fprintf (fileID,"# Gaps: "+ gaps + "("+ b + "%%)\n");
fprintf (fileID,seq1 + "\n");
fprintf (fileID,pattern + "\n");
fprintf (fileID,seq2);
fclose("all");
end

