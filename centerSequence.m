function [result,scores] = centerSequence(sizeAll,numbers,order,all,gap)
%{
This function finds all the scores of matching different sequences.
%}
scores = zeros(sizeAll-1,sizeAll);
for i=1:sizeAll - 1
    for j=(i+1):sizeAll
        sequence1 = insertBefore(all(i).sequence,1,' ');
        sequence2 = insertBefore(all(j).sequence,1,' ');
        [matrix,score]=progressiveMSA(sequence1,sequence2,numbers,order,gap);
        scores(i,j)=score;
    end
end
for b = 1 : sizeAll
    if b==1
        result(b)=sum(scores(b,1:end));
    elseif b < sizeAll
        result(b)=sum(scores(b,1:end)) + sum(scores(1:end,b));
    elseif b == sizeAll
        result(b)= sum(scores(1:end,b)) ;
    end
end
end