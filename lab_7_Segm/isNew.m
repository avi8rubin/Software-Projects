%the roll of isNew is to check if i exists in mediods
function val = isNew(i,mediods)
J=size(mediods,2);
val = 1; %assuming that i does not exist in mediods
for j=1:J
    if mediods(j)==i
        val=0; %i does not exist in mediods
        return
    end %end of if
end