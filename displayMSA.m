function  displayMSA(altered,numberOfSeq,pattern,completeCost)
%{
This function displays and saves the results of the MSA.
Input parameters: altered- the altered sequences, NumberOfSeq- amount of
sequences, pattern- pattern of the alignment, completeCost- the complete
cost of the alignment.
%}
len = length(altered(1).sequence);
magic = 30 ;
times = ceil(len/magic);
a=1;
left = (times * magic) - len ;
pat = convertStringsToChars(pattern);
fileName = ['ParametersMSA.fasta'];
fileID = fopen (fileName, "at" );
fprintf(fileID,"Complete cost : " + completeCost + "\n");
disp("Complete cost : " + completeCost);
for i = 1 : times
    if i ~= 1
        a = a + magic ;
    end
    for j = 1 : numberOfSeq
        id = altered(j).identifier;
        id = strsplit((char(id)),' ');
        c = convertStringsToChars(id{1});
        leng = length(c);
        value = 10 - leng;
        space = "";
        for o = 1 :  value
            space = space + " ";
        end
        if times == 1
            number = length(strfind(altered(j).sequence(1:len),'_'));
            disp( id(1) + space + " " + altered(j).sequence(1:len) + "  " + (len - number) );
            fprintf(fileID,id(1)  + space + " " + altered(j).sequence(1:len) + "  " + (len - number) + "\n");
        elseif i == times
            number = length(strfind(altered(j).sequence(a : a + left),'_'));
            disp(id(1) + space + " " + altered(j).sequence(a : a + left) + "  " + (a + left -number));
            fprintf(fileID,id(1) + space + " " + altered(j).sequence(a : a + left) + "  " + (a + left -number) + "\n");
        elseif times > 1
            number = length(strfind(altered(j).sequence( a : magic * i ),'_'));
            disp(id(1) + space + " " + altered(j).sequence( a : magic * i) + "  " + ( magic * i - number));
            fprintf (fileID,id(1) + space + " " + altered(j).sequence( a : magic * i) + "  " + ( magic * i - number) + "\n");
        end
    end
    
    if times ==1
        disp( "           " + pat  );
        fprintf (fileID, "           " + pat + "\n");
    elseif i == times
        disp( "           " + pat( a : a + left) );
        fprintf (fileID, "           " + pat( a : a + left) + "\n" );
    elseif times > 1
        disp( "           " + pat( a : magic * i) );
        fprintf (fileID, "           " + pat( a : magic * i) + "\n");
    end
end
fclose("all");
end