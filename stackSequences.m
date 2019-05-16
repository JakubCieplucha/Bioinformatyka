function [all] = stackSequences(first,second,s,s1)
%{
This function combines all given sequences into a single struct.
%}
for l = 1 : first
    all(l).identifier = s(l).identifier;
    all(l).sequence = s(l).sequence;
end
for t = 1 : second
    all(t+first).identifier = s1(t).identifier;
    all(t+first).sequence = s1(t).sequence;
end
end