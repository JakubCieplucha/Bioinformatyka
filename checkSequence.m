%{
This function checks if a sequence contains any unknown parts.If the
sequence is complete it will return 1 and if not 0.
Input parameters: s- the sequence being evaluated.
Output parameters: check- the end result of the evaluation.
%}
function [check]= checkSequence(s)
n = numel(s);
check = 1;
for i = 1 : n
    if s(i) ~='A' && s(i) ~='C' && s(i) ~='G' && s(i) ~='T'
        check = 0;
    end
end
end