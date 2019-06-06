function examplesOfMSA(number)
%{
This function allows the user to easily try out the program.
%}
if number == 1
    zadanieMSA('filename1','sequence.fasta','subMatrixFile','msa.xlsx')
elseif number == 2
    zadanieMSA('filename1','file1.fasta','subMatrixFile','msa.xlsx')
elseif number == 3
    zadanieMSA('filename1','sequence.fasta')
elseif number == 4
    zadanieMSA('subMatrixFile','msa.xlsx')
elseif number == 5
    zadanieMSA('filename1','file2.fasta','subMatrixFile','msa.xlsx')
elseif number == 6
    zadanieMSA('filename1','file3.fasta','subMatrixFile','msa.xlsx')
elseif number == 7
    zadanieMSA('filename1','file4.fasta','subMatrixFile','msa.xlsx')
end
end