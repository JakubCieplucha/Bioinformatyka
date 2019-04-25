%{
This function gets the content of a Fasta file specified by the user.
Input parameter: filename- the name of the Fasta file in the current
directory.
Output parameter: fastaContent- the Fasta content from file.
%}
function [ fastaContent ] = readFile( fileName )
fastaContent = fileread(fileName);
end

