function examplesOfCombined(number)
%{
This function alows the user to check the different uses of the combined
program.
%}
if number == 1
  Combined('identifier1','AJ441334.1','identifier2','KT257138.1','subMatrixFile','strona','dotPlot',true,'global',true,'local',true)  
elseif number == 2
    Combined('identifier1','AJ441334.1','identifier2','KT257138.1','subMatrixFile','strona','dotPlot',true,'global',true)
elseif number == 3 
    Combined('identifier1','AJ441334.1','identifier2','KT257138.1','subMatrixFile','strona','dotPlot',true,'local',true)
elseif number == 4 
    Combined('identifier1','AJ441334.1','identifier2','KT257138.1','subMatrixFile','strona','global',true,'local',true)
end
end