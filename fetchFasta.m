%{
This function gets a specific Fasta content from the ncib database.
Input parameters: identifier- the identifer of the sequence you wish to
receive.
Output parameter: fastaContent- the received Fasta content.
%}
function fastaContent = fetchFasta(identifier)
URL= 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end