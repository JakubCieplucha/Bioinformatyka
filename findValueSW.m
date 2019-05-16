function [value] = findValueSW(numbers,order,firstN,secondN)
%{
A function finds the value coresponding to the substitiution of two given
nucleotides
Input parameters: numbers-the scores, order- order of the nucleotides;
firstN,secondN- the given nucleotides
Output parameters; value- the score for a given substitiution
%}
x=0;
y=0;
if firstN == order{2,1}
     x = 1;
elseif firstN == order{3,1}
      x = 2;
elseif firstN == order{4,1}
      x = 3;
elseif firstN == order{5,1}
      x = 4;
end
if secondN == order{1,2}
     y = 1;
elseif secondN == order{1,3}
      y = 2;
elseif secondN == order{1,4}
      y = 3;
elseif secondN == order{1,5}
      y = 4;
end
value = numbers(x,y);


end