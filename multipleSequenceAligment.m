function [altered] = multipleSequenceAligment(sizeAll,all,numbers,order,ind,gap)
%{
This function is used to align multiple sequences.
Input parameters: sizeAll- the size of the structure containg all the
sequences, all- structure with all sequences, numbers- the values in the
score matrix, order- the order of nucleotides in the score matrix, ind- the
index of the sequence choosen as the center, gap- the gap value.
Output parameters: altered- sequences after being modified.
%}
altered(1).identifier = all(ind).identifier;
altered(1).sequence = all(ind).sequence;
for h = 1 : sizeAll
    if h == ind
    else
        guidlineSequence = insertBefore(altered(1).sequence,1,' ');
        sequenceX = insertBefore(all(h).sequence,1,' ');
        [matrix,score]=progressiveMSA(guidlineSequence,sequenceX,numbers,order,gap);
        [operations] = optimalPathMSA(matrix,guidlineSequence,sequenceX,numbers,order,gap);
        [sequence1,sequence2] = changeSequenceMsa(guidlineSequence,sequenceX,operations);
        altered(1).sequence = sequence1;
    end
end
counter = 1;
for i = 1 : sizeAll
    if i == ind
    else
        counter = counter +1;
        guidlineSequence = insertBefore(altered(1).sequence,1,' ');
        sequenceX = insertBefore(all(i).sequence,1,' ');
        altered(counter).identifier = all(i).identifier;
        [matrix,score]=progressiveMSA(guidlineSequence,sequenceX,numbers,order,gap);
        [operations] = optimalPathMSA(matrix,guidlineSequence,sequenceX,numbers,order,gap);
        [sequence1,sequence2] = changeSequenceMsa(guidlineSequence,sequenceX,operations);
        altered(counter).sequence = sequence2;
    end
end

end

