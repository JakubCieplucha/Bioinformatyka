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
function saveParametersSW (numbers,order,number,id1,id2,gap,score,lengths,identity,gaps,seq1,seq2,patterns)

n = length(identity);
for i = 1 : n 
disp("     " + i );    
disp("# 1: " + id1);
disp("# 2: " + id2);
disp("# Match A: " + findValueSW(numbers,order,'A','A'));
disp("# Match C: " + findValueSW(numbers,order,'C','C'));
disp("# Match G: " + findValueSW(numbers,order,'G','G'));
disp("# Match T: " + findValueSW(numbers,order,'T','T'));
disp("# Mismatch A-C: " + findValueSW(numbers,order,'A','C'));
disp("# Mismatch A-G: " + findValueSW(numbers,order,'A','G'));
disp("# Mismatch A-T: " + findValueSW(numbers,order,'A','T'));
disp("# Mismatch C-A: " + findValueSW(numbers,order,'C','A'));
disp("# Mismatch C-G: " + findValueSW(numbers,order,'C','G'));
disp("# Mismatch C-T: " + findValueSW(numbers,order,'C','T'));
disp("# Mismatch G-A: " + findValueSW(numbers,order,'G','A'));
disp("# Mismatch G-C: " + findValueSW(numbers,order,'G','C'));
disp("# Mismatch G-T: " + findValueSW(numbers,order,'G','T'));
disp("# Mismatch T-A: " + findValueSW(numbers,order,'T','A'));
disp("# Mismatch T-C: " + findValueSW(numbers,order,'T','C'));
disp("# Mismatch T-G: " + findValueSW(numbers,order,'T','G'));
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
fprintf (fileID,"# Match A: " + findValueSW(numbers,order,'A','A') + "\n");
fprintf (fileID,"# Match C: " + findValueSW(numbers,order,'C','C') + "\n");
fprintf (fileID,"# Match G: " + findValueSW(numbers,order,'G','G') + "\n");
fprintf (fileID,"# Match T: " + findValueSW(numbers,order,'T','T') + "\n");
fprintf (fileID,"# Mismatch A-C: " + findValueSW(numbers,order,'A','C') + "\n");
fprintf (fileID,"# Mismatch A-G: " + findValueSW(numbers,order,'A','G') + "\n");
fprintf (fileID,"# Mismatch A-T: " + findValueSW(numbers,order,'A','T') + "\n");
fprintf (fileID,"# Mismatch C-A: " + findValueSW(numbers,order,'C','A') + "\n");
fprintf (fileID,"# Mismatch C-G: " + findValueSW(numbers,order,'C','G') + "\n");
fprintf (fileID,"# Mismatch C-T: " + findValueSW(numbers,order,'C','T') + "\n");
fprintf (fileID,"# Mismatch G-A: " + findValueSW(numbers,order,'G','A') + "\n");
fprintf (fileID,"# Mismatch G-C: " + findValueSW(numbers,order,'G','C') + "\n");
fprintf (fileID,"# Mismatch G-T: " + findValueSW(numbers,order,'G','T') + "\n");
fprintf (fileID,"# Mismatch T-A: " + findValueSW(numbers,order,'T','A') + "\n");
fprintf (fileID,"# Mismatch T-C: " + findValueSW(numbers,order,'T','C') + "\n");
fprintf (fileID,"# Mismatch T-G: " + findValueSW(numbers,order,'T','G') + "\n");
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