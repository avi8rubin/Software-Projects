function dist = geo_distance(sig, beta, mm)

rows= size(sig,1);%the matrix size(rows);
cols= size(sig,2);%the matrix size(cols);
b= 0.25*((mm+2*beta)/(mm+2));

for i=1:rows
  for k=1:rows
    for j=1:cols
    r=sig(k,j)/sig(i,j);
    r=log(r);
    GD(j)=sqrt((3*b-0.25)*r*r+0*2*(b-0.25)*r*r);
   
end
dist(i,k)=sum(GD);
  end
   
end

end