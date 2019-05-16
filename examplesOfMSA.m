function examplesOfMSA(number)
%{
This function allows the user to easily try out the program.
%}
if number == 1
    zadanieMSA('filename1','sequence.fasta','filename2','sequence1.fasta','subMatrixFile','msa.xlsx');
    if number == 2
        zadanieMSA('filename1','file1.fasta','filename2','file2.fasta','subMatrixFile','msa.xlsx');
    elseif number == 3
        zadanieMSA('filename1','sequence.fasta','subMatrixFile','msa.xlsx')
    elseif number == 4
        zadanieMSA('filename1','sequence.fasta','filename2','sequence1.fasta')
    elseif number == 5
        zadanieMSA('filename1','sequence.fasta','filename2','sequence1.fasta','subMatrixFile','msa.xlsx')
    end
end