function Combined(varargin)
%{
This function utilises the functionality of all three previous programs.The
user must simply specify which aspects he wants to use.
%}

p = inputParser;
p.addParameter('filename1','',@ischar)
p.addParameter('filename2','',@ischar)
p.addParameter('identifier1','',@ischar)
p.addParameter('identifier2','',@ischar)
p.addParameter('input1','',@ischar)
p.addParameter('input2','',@ischar)
p.addParameter('window',10,@isnumeric)
p.addParameter('error',4,@isnumeric)
p.addParameter('mode','distance',@ischar)
p.addParameter('match',-1,@isnumeric)
p.addParameter('mismatch',1,@isnumeric)
p.addParameter('gapGlobal',2,@isnumeric)
p.addParameter('gapLocal',-2,@isnumeric)
p.addParameter('subMatrixFile','',@ischar)
p.addParameter('dotPlot',false,@logical)
p.addParameter('global',false,@logical)
p.addParameter('local',false,@logical)
parse(p,varargin{:})
number=0;


if (isempty(p.Results.filename1) &&  isempty(p.Results.filename2) &&  isempty(p.Results.identifier1) &&  isempty(p.Results.identifier2) && isempty(p.Results.input1) && isempty(p.Results.input1) )
disp('No sequences to compare')
return
end

if ( ~isempty(p.Results.identifier1) ||  ~isempty(p.Results.filename1) ||  ~isempty(p.Results.filename2)|| ~isempty(p.Results.identifier2) || ~isempty(p.Results.input1) || ~isempty(p.Results.input2)  )
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
  if( ~isempty(p.Results.input1))
      number=number+1;
  end
  if( ~isempty(p.Results.input2))
      number=number+1;
  end
  if number>2
      disp('Too many sequence inputs')
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

if ( ~isempty(p.Results.input1) &&   ~isempty(p.Results.input2))
    disp('First sequence')
    text=inputFasta();
    disp('Second sequence')
    text1=inputFasta();
end

if ( ~isempty(p.Results.input1) &&   ~isempty(p.Results.filename2))
    text=inputFasta();
    text1=readFile(p.Results.filename2);
end

if ( ~isempty(p.Results.input2) &&   ~isempty(p.Results.filename2))
    text=inputFasta();
    text1=readFile(p.Results.filename2);
end

if ( ~isempty(p.Results.input2) &&   ~isempty(p.Results.filename1))
    text=inputFasta();
    text1=readFile(p.Results.filename1);
end

if ( ~isempty(p.Results.input1) &&   ~isempty(p.Results.filename1))
    text=inputFasta();
    text1=readFile(p.Results.filename1);
end

if ( ~isempty(p.Results.input1) &&   ~isempty(p.Results.identifier1))
    text=inputFasta();
    text1=fetchFasta(p.Results.identifier1);
end

if ( ~isempty(p.Results.input2) &&   ~isempty(p.Results.identifier1))
    text=inputFasta();
    text1=fetchFasta(p.Results.identifier1);
end

if ( ~isempty(p.Results.input2) &&   ~isempty(p.Results.identifier2))
    text=inputFasta();
    text1=fetchFasta(p.Results.identifier2);
end

if ( ~isempty(p.Results.input1) &&   ~isempty(p.Results.identifier2))
    text=inputFasta();
    text1=fetchFasta(p.Results.identifier2);
end

s = parseFasta(text);
s1 = parseFasta(text1);
[a,first] = size(s);
[a,second] = size(s1);
number = 0;
for i = 1 : first
    for j = 1 : second
        number = number + 1;
        check = checkSequence(s(i).sequence);
        check1 = checkSequence(s(j).sequence);   
        if check + check1 == 2
            if p.Results.dotPlot == true
                exe1(s,s1,p.Results.window,p.Results.error,i,j,number);
            end
            if p.Results.global == true
                mode = p.Results.mode;
            if  mode == "distance" || mode == "similarity"
                disp('Global pairing results:')
                disp(' ')
                exe2(s,s1,mode,number,p.Results.match,p.Results.mismatch,p.Results.gapGlobal,i,j);
                disp(' ')
            else
                disp('This function does not support the mode you chose')
            end
            end
            if p.Results.local == true
                if p.Results.subMatrixFile ~= ""
                    disp('Local pairing results:')
                    disp(' ')
                    exe3(s,s1,p.Results.subMatrixFile,p.Results.gapLocal,i,j);
                else
                    disp('No substitiution matrix file was given')
                end
            end
        else
            disp('At least one submission is not a complete genetic sequence');
        end
    end
end
else 
    disp('Not enough inputs')
end
end



