function c=Pama_dist(dist,K)
 %dist = squareform(pdist(Uni));
 mediods=PamD(dist,K);
 NR=size(dist,1);
 for jj=1:NR
     di=dist(jj, mediods);
     [mina,c(jj)]=min(di);
     clear di;
 end
end