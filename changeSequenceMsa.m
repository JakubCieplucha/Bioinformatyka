function [sequence1,sequence2] = changeSequenceMsa(sequence1,sequence2,operations)
%{
This function alters two given sequences based on the operations they were
submited to in order to match them.
%}
sequence1 = sequence1(2:end);
sequence2 = sequence2(2:end);
n = length(sequence1);
m = length(sequence2);
empty = '_';
amount = length(operations);
for i = 1 : amount
    
    if i == 1 && operations(1) == "insertion"
        sequence1 = [empty sequence1(1:end)];
    elseif i == 1 &&  operations(1) == "deletion"
        sequence2 = [empty sequence2(1:end)];
    elseif i == amount && operations(amount) == "insertion"
        sequence1=[sequence1(1:end) empty];
    elseif i == amount &&  operations(amount)== "deletion"
        sequence2 = [sequence2(1:end) empty];
    else
        switch operations (i)
            case "insertion"
                sequence1 = [sequence1(1:i-1) empty sequence1(i:end)];
            case "deletion"
                sequence2 = [sequence2(1:i-1) empty sequence2(i:end)];
        end
    end
end