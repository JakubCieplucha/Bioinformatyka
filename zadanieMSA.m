function  zadanieMSA(varargin)
%{
This function allows the user to perform a multiple sequence alignment on
sequences provided in a single file or from the ncib database.
*It is required for each sequence to have an indentifier and a short
description.
%}
p = inputParser;
p.addParameter('filename1','',@ischar)
p.addParameter('identifier1','',@ischar)
p.addParameter('subMatrixFile','',@ischar)
p.addParameter('gap',2,@isnumeric)
parse(p,varargin{:})
number=0;

if (isempty(p.Results.filename1) &&    isempty(p.Results.identifier1))
    disp('No sequences to compare')
    return
end

if ( ~isempty(p.Results.identifier1) ||  ~isempty(p.Results.filename1))
    if( ~isempty(p.Results.identifier1))
        number=number+1;
    end
    if( ~isempty(p.Results.filename1))
        number=number+1;
    end
    if number > 1
        disp('Too many inputs')
        return
    end
end

if number == 1
    if  ~isempty(p.Results.filename1) 
        text=readFile(p.Results.filename1);
    end
    
    if ~isempty(p.Results.identifier1) 
        text=fetchFasta(p.Results.identifier1);
    end
    
    if p.Results.subMatrixFile ~= ""
        %%
        s=parseFasta(text);
        [a,first]=size(s);
        place = 0;
        for i = 1 : first
                place = place + 1;
                check(place) = checkSequence(s(i).sequence);
        end
        ch = sum(ismember(check,0));
        if ch == 0
            [a,sizeAll]=size(s);
            [numbers,order,correct] = readScoreMatrix(p.Results.subMatrixFile);
            if correct == 1
                [result,scores] = centerSequence(sizeAll,numbers,order,s,p.Results.gap);
                [guidline,ind] = min(result);
                [altered] = multipleSequenceAligment(sizeAll,s,numbers,order,ind,p.Results.gap);
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

