function idx = findClosestCentroids(X, centroids) 
  K = size(centroids , 1); 
  idx = zeros(size(X,1),1); 
  
  for i=1:size(X,1)
  minDist = -1 ; 
  for j = 1:K 
    mat = X(i, :) - centroids(j, :) ;
    dist = mat*mat';
    if idx(i) == 0 || dist < minDist 
      minDist = dist; 
      idx(i) = j;
    endif
    endfor
  endfor

end 