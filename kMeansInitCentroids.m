function centroids = kMeansInitCentroids(X,K) 
  randomized = randperm(size(X,1)); 
  centroids = X(randomized(1:K),:); 
end