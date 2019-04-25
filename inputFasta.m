%{
This function allows the user to input the desired Fasta content
himself.After starting you will be asked to give the identifier and the
sequence.
Output parameter: fastaContent- the given Fasta content.
%}
function fastaContent = inputFasta()
fastaContent=['>',input('identifier: ','s'),char(10),input('sequence: ','s')];
end