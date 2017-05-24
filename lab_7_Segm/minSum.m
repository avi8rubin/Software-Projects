function [var,minimal] = minSum(A)
minimal=[0,1E6];%1st place holds th index of the min sum and 2nd holds the min sum
I=size(A,1);
J=size(A,2);
for i=1:I
    s(i)=sum(A(i,:));
end;
  [var,minimal]=min(s);  
%     sum=0;
%     for j=1:J
%         sum = sum + A(i,j);
%     end %end of for of columns
%     if sum < minimal(2) %if the sum is lower then the known
%         minimal(1)=i;
%         minimal(2)=sum;
%     end %end of if
% end %end of for of rows
