function mediods=PamD(Distance,K)
global minDist
minDist=1E6;
mediods=build(Distance,K);
% disp('build succeeded')
lastDist=minDist;
mediods=swap(Distance,mediods,K);
% minDist
while minDist < lastDist
    lastDist=minDist;
    mediods=swap(Distance,mediods,K);
%     minDist
end % end of while
