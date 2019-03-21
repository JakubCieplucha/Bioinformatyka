function zadanie1(varargin)

p = inputParser;

p.addParameter('filename1','',@ischar)
p.addParameter('filename2','',@ischar)
p.addParameter('identifier1','',@ischar)
p.addParameter('identifier2','',@ischar)
p.addParameter('window',10,@isnumeric)
p.addParameter('error',4,@isnumeric)

parse(p,varargin{:})
number=0;

if (isempty(p.Results.filename1) &&  isempty(p.Results.filename2) &&  isempty(p.Results.identifier1) &&  isempty(p.Results.identifier2) )
disp('No sequences to compare')
return
end

if ( ~isempty(p.Results.identifier1) ||  ~isempty(p.Results.filename1) ||  ~isempty(p.Results.filename2)|| ~isempty(p.Results.identifier2)  )
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



s=parseFasta(text);
s1=parseFasta(text1);

[a,first]=size(s);
[a,second]=size(s1);
number=0;
for i=1:first
for j=1:second
number=number+1;
check=checkSequence(s(i).sequence,s1(j).sequence);
if check == 1;
r=dotPlot(s(i).sequence,s1(j).sequence);
id1=s(i).identifier;
id1=strsplit((char(id1)),' ');
id2=s1(j).identifier;
id2=strsplit((char(id2)),' ');
[newMatrix,row,column]=myFilter(r,p.Results.window,p.Results.error);
myDisplay(newMatrix,row,column,id1(1),id2(1),number);
else 
   disp('At least one submission is not a complete genetic sequence');
end
end
end
end