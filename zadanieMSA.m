function  zadanieMSA(varargin)
%{
This function allows the user to perform a multiple sequence alignment on
sequences provided in two files.
%}
p = inputParser;
p.addParameter('filename1','',@ischar)
p.addParameter('filename2','',@ischar)
p.addParameter('identifier1','',@ischar)
p.addParameter('identifier2','',@ischar)
p.addParameter('subMatrixFile','',@ischar)
p.addParameter('gap',2,@isnumeric)
parse(p,varargin{:})
number=0;

if (isempty(p.Results.filename1) &&  isempty(p.Results.filename2) &&  isempty(p.Results.identifier1) &&  isempty(p.Results.identifier2)  )
    disp('No sequences to compare')
    return
end

if ( ~isempty(p.Results.identifier1) ||  ~isempty(p.Results.filename1) ||  ~isempty(p.Results.filename2)|| ~isempty(p.Results.identifier2)   )
    if( ~isempty(p.Results.identifier1))
        number=number+1;
    end
    if( ~isempty(p.Results.identifier2))
        number=number+1;
    end
    if( ~isempty(p.Results.filename1))
        number=number+1;
    end
    if( ~isempty(p.Results.filename2))
        number=number+1;
    end
    if number>2
        disp('Too many inputs')
        return
    end
end

if number == 2
    if ( ~isempty(p.Results.filename1) &&   ~isempty(p.Results.filename2))
        text=readFile(p.Results.filename1);
        text1=readFile(p.Results.filename2);
    end
    
    if ( ~isempty(p.Results.identifier1) &&   ~isempty(p.Results.identifier2))
        text=fetchFasta(p.Results.identifier1);
        text1=fetchFasta(p.Results.identifier2);
    end
    
    if ( ~isempty(p.Results.identifier1) &&   ~isempty(p.Results.filename1))
        text=fetchFasta(p.Results.identifier1);
        text1=readFile(p.Results.filename1);
    end
    
    if ( ~isempty(p.Results.identifier2) &&   ~isempty(p.Results.filename1))
        text=fetchFasta(p.Results.identifier2);
        text1=readFile(p.Results.filename1);
    end
    
    if ( ~isempty(p.Results.identifier1) &&   ~isempty(p.Results.filename2))
        text=fetchFasta(p.Results.identifier1);
        text1=readFile(p.Results.filename2);
    end
    
    if ( ~isempty(p.Results.identifier2) &&   ~isempty(p.Results.filename2))
        text=fetchFasta(p.Results.identifier2);
        text1=readFile(p.Results.filename2);
    end
    
    
    if p.Results.subMatrixFile ~= ""
        %%
        s=parseFasta(text);
        s1=parseFasta(text1);
        [a,first]=size(s);
        [a,second]=size(s1);
        number = 0;
        for i = 1 : first
            for j = 1 : second
                number = number + 1;
                check(number) = checkSequence(s(i).sequence);
                check1(number) = checkSequence(s(j).sequence);
            end
        end
        ch = sum(ismember(check,0));
        ch1 = sum(ismember(check1,0));
        if ch + ch1 < 1
            [all] = stackSequences(first,second,s,s1);
            [a,sizeAll]=size(all);
            [numbers,order,check] = readScoreMatrix(p.Results.subMatrixFile);
            if check == 1
                [result,scores] = centerSequence(sizeAll,numbers,order,all,p.Results.gap);
                [guidline,ind] = min(result);
                [altered] = multipleSequenceAligment(sizeAll,all,numbers,order,ind,p.Results.gap);
                [a,b] = size(altered);
                [pattern,x] = patternMSA(altered,b);
                [columnCost,compCost] = completeCost(x,numbers,order);
                displayMSA(altered,b,pattern,compCost)
                
            else
                disp ('The given substitiution matrix is not in the correct format');
            end
        else
            disp('At least one submission is not a complete genetic sequence');
        end
    else
        disp('No substitiution matrix file was given')
    end
else
    disp('Not enough inputs')
end
end

