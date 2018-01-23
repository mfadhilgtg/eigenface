function [ imgs, labels ] = loadSubset(subsets, yaleDir)
% loadSubset Load a subset or set of subsets from the yale face database,
% returning a matrix of images
%
% INPUT:
%   subsets:  the index of the subset to load, or a vector of sebset
%      indices.  For example, loadSubset(2) loads subset2, whereas
%      loadSubset([0,1]) loads subset0 and subset1
%   yaleDir:  the path to the yale dataset directory.  If left blank,
%      defaults to 'yaleBfaces'
% 
% OUTPUT:
%   imgs: a dXN matrix of images, where N is the number of images and d is
%      the number of pixels in each image
%   labels: a vector of length N, storing the person or class ID of each
%      image
    %default directory
    if nargin < 2,  yaleDir = 'E:\Bahan Kuliah\EL4125 Pengolahan Citra Digital\Tugas Individu\yaleBfaces'; end
    imgs = [];
    labels = [];
    
    for i=1:length(subsets)
        subsetDir = sprintf('%s/subset%d/', yaleDir, subsets(i));
        files = dir(subsetDir);
        for j=1:length(files)
            %get person and count
            [person count] = sscanf(files(j).name, 'person%02d');
            if count == 1
                img = single(im2double(imread([subsetDir files(j).name])));
                imgs = [imgs; img(:)'];
                labels = [labels; person];
            end
        end
    end
    imgs = imgs'; 
end


