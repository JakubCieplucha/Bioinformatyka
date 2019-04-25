function [r] = dotPlot(genX,genY)
n= length(genX);
m= length (genY);
for i =1 : n
    for j =1 : m
          if genX(i) == genY(j);
              r(i,j)=1;
          else 
              r(i,j)=0;
          end
    end
end