%{
This function checks if a sequence contains any unknown parts.If the 
sequence is complete it will return 1 and if not 0.
Input parameters: s- the sequence being evaluated.
Output parameters: check- the end result of the evaluation.
%}
function [check]= checkSequence(s)
n = numel(s);
    for i = 1 : n 
      switch s(i)
            case 'A'
            check = 1;
            case 'T'
            check = 1;
            case 'G'
             check = 1;     
            case 'C'
             check = 1;
            otherwise 
            check = 0;
            return
      end
   end
end