% Is Home Run
function madeIt = isHomeRun(x,v0)
if(atFenceHeight(x,v0)>=0)
    madeIt = "Yes";
    %disp(madeIt);
else
    madeIt = "No";
end
