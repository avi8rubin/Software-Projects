function mediods=build(Distance,K) %function build gets the distance matrix and the nunber of clusters wanted
[minmal,mediods(1)]=minSum(Distance);%1st place holds the index of the min sum and 2nd holds the min sum
% mediods(1)=minmal(1);
for i=2:K %the purpose of this loop is to find the next mediods
    mediods(i)=findMediods(Distance,mediods);
end %end of for