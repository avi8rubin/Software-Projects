%% Lab 8
function [LL,HL,LH,HH] =wallel(pic)
index =1;
[m,n] = size(pic);
for i=1:2:m-1
    for j=1:2:n-1
        A = pic(i,j);
        B = pic(i+1,j);
        C = pic(i,j+1);
        D = pic(i+1,j+1);
        
        LL(index)=(A+B+C+D)/2;
        HL(index)=(A-B+C-D)/2;
        LH(index)=(A+B-C-D)/2;
        HH(index)=(A+D-B-C)/2;
        index =index+1;
    end
end

end