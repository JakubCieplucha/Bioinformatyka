function [check]= checkSequence(s1,s2)
n= numel(s1);
m= numel (s2);
for i=1 : n 
    switch s1(i)
        case 'A'
            check=1;
        case 'T'
            check=1;
        case 'G'
             check=1;     
        case 'C'
             check=1;
        otherwise 
            check=0;
            return
    end
end
for l=1:m
       switch s2(l)
        case 'A'
            check=1;
        case 'T'
            check=1;
        case 'G'
             check=1;     
        case 'C'
             check=1;
        otherwise 
            check=0;
            return
        end
end 
end