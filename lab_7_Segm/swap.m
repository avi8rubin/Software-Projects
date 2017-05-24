function mediods = swap(Distance,mediods,K)
global minDist
I=size(Distance,1); %holds the number of rows in Distance
for i=1:K
    mediodIndex=mediods(i);
    for j=1:I
        if isNew(j,mediods)==1
            mediods(i)=j;
            tempDist=0;
            
            for s=1:I
                smallest=Distance(mediods(i),s);
                for k=1:K
                    if smallest > Distance(mediods(k),s);
                        smallest = Distance(mediods(k),s);
                    end %end of if
                end %end of for of K
                tempDist=tempDist+smallest;
            end %end of for of s
            
            if tempDist < minDist
                minDist=tempDist;
                mediodIndex=j;
            end %end of if
            tempDist=0;
        end %end of if
    end %end of for of j
    mediods(i)=mediodIndex;
end %end of for of i