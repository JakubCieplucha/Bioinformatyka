 function myDisplay(matrix,row,column,identifier1,identifier2,number)
row1=row+1;
column1=column+1;
figure
spy(matrix)
titleTxt=['Graph depicting the matching of  sequences',identifier1,'and',identifier2];
title(titleTxt);
xlabelTxt=['Index of nucleotide in ',identifier1,' sequence'];
xlabel(xlabelTxt);
ylabelTxt=['Index of nucleotide in ',identifier2,' sequence'];
ylabel(ylabelTxt);
legend({'Match in both sequences'},'Location','southwest')


saveasTxt=['Dot plot',num2str(number),'.png'];
saveas(gcf,saveasTxt);
end