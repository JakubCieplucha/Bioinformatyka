%{
A function that takes reads the substitiution matrix from an xls file in
the directory.
Input parameters: filename- the name of the xls file in the directory.
Output parameters;  A,C,G,T-the values for each nucleotide, check- will
return a value of 1 or 0 depending on whether or not the substitiution
matrix in the given file was in the correct format.
%}
function [A,C,G,T,check] = readSubstitiutionMatrix(filename)
[num, txt] = xlsread (filename);
check = 1;
if txt{2,1}~='A'
   check=0;
end
if txt{2,2}~='C'
  check=0;
end
if txt{2,3}~='G'
   check=0;
end
if txt{2,4}~='T'
   check=0;
end
if txt{1,2}~='A'
   check=0;
end
if txt{1,3}~='C'
   check=0;
end
if txt{1,4}~='G'
    check=0;
end
if txt{1,5}~='T'
    check=0;
end
if check==1    
 A=[num(1,1),num(1,2), num(1,3), num(1,4)];  
 C=[num(2,2),num(2,1), num(2,3), num(2,4)];
 G=[num(3,3),num(3,1), num(3,2), num(3,4)];
 T=[num(4,4),num(4,1), num(4,2), num(4,3)]; 
else
    disp("The substitiution matrix is not in the correct format");
end
end