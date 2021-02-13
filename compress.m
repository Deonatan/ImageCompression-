%Image Compression 
image_name = input('Enter image file name: ','s');
file = double(imread(image_name)); 
file = file/255 ; % range color from 0-1 
img_size = size(file);

X = reshape(file, img_size(1) * img_size(2) , 3); 
K = 16; 
max_iters = 10; 

initial_centroids = kMeansInitCentroids(X , K);
[centroids , idx] = runkMeans(X, initial_centroids , max_iters); 
fprintf('\nApplying K-Means to compress an image.\n\n');
idx = findClosestCentroids(X, centroids); 
X_recovered = centroids(idx,:); 
X_recovered = reshape(X_recovered , img_size(1), img_size(2), 3) ;
%display result 
subplot(1,2,1); 
imagesc(file); 
title('Original'); 
subplot(1,2,2); 
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K)); 
