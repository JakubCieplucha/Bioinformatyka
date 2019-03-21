function [s]= parseFasta (text)
a=strsplit(text,'>');
a(cellfun('isempty', a)) = [];
[m,n]=size(a);
number=0;
s= struct ('identifier',[],'sequence',[]);
for i=1:n
number=number+1;
k=char(a(i));
c=strsplit(k,'\n');
s(number).identifier = c(1);
sequence = char(c(2:end));
[row,column]=size(sequence);
element=0;
for i=1:row
for j=1:column
element=element +1;
sekwencja(element)=sequence(i,j);
end
end
sekwencja=strtrim(sekwencja);
s(number).sequence=sekwencja;
end
end