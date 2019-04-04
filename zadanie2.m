%{
This function combaines all the functions created for the second program.It
serves as a user interface.By using different parameters the
user can specify where the compared sequences will come from.He can also
specify the mode and its parameters.
The value of "input' one and two can be anything as it is only indicates 
that the user wants to input the Fasta content themselfs. 
%}
function zadanie2(varargin)

p = inputParser;

p.addParameter('filename1','',@ischar)
p.addParameter('filename2','',@ischar)
p.addParameter('identifier1','',@ischar)
p.addParameter('identifier2','',@ischar)
p.addParameter('input1','',@ischar)
p.addParameter('input2','',@ischar)
p.addParameter('mode','distance',@ischar)
p.addParameter('match',0,@isnumeric)
p.addParameter('mismatch',1,@isnumeric)
p.addParameter('gap',1,@isnumeric)
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
      disp('Too many sequences inputs')
      return
  end
end


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

mode = p.Results.mode;
if  mode == "distance" || mode == "similarity"
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
sequence1 = insertBefore(s(i).sequence,1,' ');
sequence2 = insertBefore(s1(i).sequence,1,' ');
if mode == "distance"
[score,operations,matrix] = distance(sequence1,sequence2,p.Results.match,p.Results.mismatch,p.Results.gap);   
else 
[score,operations,matrix] = similarity(sequence1,sequence2,p.Results.match,p.Results.mismatch,p.Results.gap);      
end
[seq,seq1,pattern,len,identity,gaps] = optimalPath(sequence1,sequence2,operations);
id1 = s(i).identifier;
id1 = strsplit((char(id1)),' ');
id2 = s1(j).identifier;
id2 = strsplit((char(id2)),' ');
saveParameters(number,id1(1),id2(1),mode,p.Results.match,p.Results.mismatch,p.Results.gap,score,len,identity,gaps,seq,seq1,pattern);
nwDisplay(matrix,operations,id1(1),id2(1),number);
else
disp('At least one submission is not a complete genetic sequence'); 
end
end
end
else 
    disp('This function does not support the mode you chose')
end
end
