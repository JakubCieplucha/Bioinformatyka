%{
This function displays and saves the parameters and results to a file.
Input arguments: seq- the first sequence, seq1- the second sequence, A,C,G,T-
the values for each nucleotide, gap- the gap value, number - a value to
keep track of how different sequences have been compared, id1- id of the
first sequence, id2- id of the second sequence, score- the highest value
obteined from the score matrix, lengths- a matrix of the lenghts of
obtained local parings, identity- a matrix determinig how many nucleotides
where a match in both localy paired sequences, gaps- a matrix determinig
how many gaps there where after the pairing, patterns- a matrix with all
the patterns for each local pairing.
%}
function saveParametersSW (A,C,T,G,number,id1,id2,gap,score,lengths,identity,gaps,seq1,seq2,patterns)

n = length(identity);
for i = 1 : n 
disp("     " + i );    
disp("# 1: " + id1);
disp("# 2: " + id2);
disp("# Match A: " + A(1));
disp("# Match C: " + C(1));
disp("# Match G: " + G(1));
disp("# Match T: " + T(1));
disp("# Mismatch A-C: " + A(2));
disp("# Mismatch A-G: " + A(3));
disp("# Mismatch A-T: " + A(4));
disp("# Mismatch C-A: " + C(2));
disp("# Mismatch C-G: " + C(3));
disp("# Mismatch C-T: " + C(4));
disp("# Mismatch G-A: " + G(2));
disp("# Mismatch G-C: " + G(3));
disp("# Mismatch G-T: " + G(4));
disp("# Mismatch T-A: " + T(2));
disp("# Mismatch T-C: " + T(3));
disp("# Mismatch T-G: " + T(4));
disp("# Gap: " + gap);
disp("# Score: " + score );
disp("# Length: " + lengths(i));
disp("# Identity: " + identity(i) +  "("+round((identity(i)/lengths(i))*100) + "%)");
disp("# Gaps: "+ gaps(i) + "("+round((gaps(i)/lengths(i)*100)) + "%)");
disp(seq1{i});
disp(patterns(i));
disp(seq2{i});
disp("");

a = round((identity(i)/lengths(i))*100);
b = round((gaps(i)/lengths(i))*100);
fileName = ['ParametersSW',num2str(number),'.txt'];
fileID = fopen (fileName, "at" );
fprintf (fileID,"     " + i + "\n");    
fprintf (fileID,"# 1: " + id1 + "\n");
fprintf (fileID,"# 2: " + id2 + "\n");
fprintf (fileID,"# Match A: " + A(1) + "\n");
fprintf (fileID,"# Match C: " + C(1) + "\n");
fprintf (fileID,"# Match G: " + G(1) + "\n");
fprintf (fileID,"# Match T: " + T(1) + "\n");
fprintf (fileID,"# Mismatch A-C: " + A(2) + "\n");
fprintf (fileID,"# Mismatch A-G: " + A(3) + "\n");
fprintf (fileID,"# Mismatch A-T: " + A(4) + "\n");
fprintf (fileID,"# Mismatch C-A: " + C(2) + "\n");
fprintf (fileID,"# Mismatch C-G: " + C(3) + "\n");
fprintf (fileID,"# Mismatch C-T: " + C(4) + "\n");
fprintf (fileID,"# Mismatch G-A: " + G(2) + "\n");
fprintf (fileID,"# Mismatch G-C: " + G(3) + "\n");
fprintf (fileID,"# Mismatch G-T: " + G(4) + "\n");
fprintf (fileID,"# Mismatch T-A: " + T(2) + "\n");
fprintf (fileID,"# Mismatch T-C: " + T(3) + "\n");
fprintf (fileID,"# Mismatch T-G: " + T(4) + "\n");
fprintf (fileID,"# Gap: " + gap + "\n");
fprintf (fileID,"# Score: " + score + "\n");
fprintf (fileID,"# Length: " + lengths(i) + "\n");
fprintf (fileID,"# Identity: " + identity(i) +  "("+ a + "%%)\n");
fprintf (fileID,"# Gaps: "+ gaps(i) + "("+ b + "%%)\n");
fprintf (fileID,seq1{i} + "\n");
fprintf (fileID,patterns(i) + "\n");
fprintf (fileID,seq2{i} + "\n");
fclose("all");
end
end