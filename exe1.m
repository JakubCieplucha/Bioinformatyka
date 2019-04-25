function exe1(s,s1,window,error,i,j,number)
%{
This function utilises the functionality of the first program without the
redunant code.
%}
r=dotPlot(s(i).sequence,s1(j).sequence);
id1=s(i).identifier;
id1=strsplit((char(id1)),' ');
id2=s1(j).identifier;
id2=strsplit((char(id2)),' ');
[newMatrix,row,column]=myFilter(r,window,error);
myDisplay(newMatrix,row,column,id1(1),id2(1),number);
end