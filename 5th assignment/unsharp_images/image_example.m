%% Read an image from a file
clear all
u = imread('testpat_blur4.png');
%u = imread('ellipse_blur2.png');
%u = imread('eye.png');

% convert image to double and scale to [0,1]
u = double(u) / 255;

[n,n2] = size(u);
if (n ~= n2)
  error('by default, this only supports square images')
end


figure(1); clf;
%pcolor(u); % try this one too
imagesc(u);
caxis([0 1])
colormap(gray)
axis equal, axis tight


% "stretch" the matrix representation of the image into one long
% vector.
v = reshape(u, n*n, 1);

% add noise
v = v + 0.2*(rand(size(v)) - 1/2);

% convert the long vector back into a matrix
u2 = reshape(v, n, n);


figure(2); clf;
imagesc(u2);
caxis([0 1])
colormap(gray)
axis equal, axis tight


%% Output original and result side-by-side
% You could look at the resulting file with a web browser or image
% viewer
result = [u  u2];
imwrite(result, 'result.png')


