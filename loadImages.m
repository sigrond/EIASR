rootFolder = fullfile(outputFolder, '101_ObjectCategories');
% Get a list of all files and folders in this folder.
s = strcat(pwd, '\', rootFolder)
files = dir(s)
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir]
% Extract only those that are directories.
subFolders = files(dirFlags)
% Print folder names to command window.
for k = 1 : length(subFolders)
  fprintf('Sub folder #%d = %s\n', k, subFolders(k).name);
end
categories = cellstr({subFolders(3:end).name})

imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
tbl = countEachLabel(imds)
minSetCount = min(tbl{:,2}); % determine the smallest amount of images in a category

% Use splitEachLabel method to trim the set.
imds = splitEachLabel(imds, minSetCount, 'randomize');

% Notice that each set now has exactly the same number of images.
countEachLabel(imds)
% Find the first instance of an image for some categories
radiowozy = find(imds.Labels == 'radiowozy', 1);
airplanes = find(imds.Labels == 'airplanes', 1);
ferry = find(imds.Labels == 'ferry', 1);
laptop = find(imds.Labels == 'laptop', 1);
figure
subplot(1,4,1);
imshow(readimage(imds,radiowozy))
subplot(1,4,2);
imshow(readimage(imds,airplanes))
subplot(1,4,3);
imshow(readimage(imds,ferry))
subplot(1,4,4);
imshow(readimage(imds,laptop))