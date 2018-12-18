clear all
close all

%net = googlenet;
net = googlenet; 
Labels = readtable('ImagePaths.csv');
TestImagePaths = table2array(Labels(:,1));
current_input(1:2013528,1) = uint8(0);
solutions = {}; 
clear Labels
%%
for i = 1:length(TestImagePaths)
    I = imread(strcat(TestImagePaths{i,1},'_image.jpg'));
   
    inputSize = net.Layers(1).InputSize;
    I = imresize(I,inputSize(1:2));
    [label,scores] = classify(net,I);

    [~,idx] = sort(scores,'descend');
    idx = idx(10:-1:1);
    classNamesTop = net.Layers(end).ClassNames(idx);
    scoresTop = scores(idx);
    
    solutions{i,1} = strcat(TestImagePaths{i,1},'_image.jpg');
    solutions{i, 2} = classNamesTop;
    solutions{i,3} = scoresTop; 
    solutions{i,4} = label;
    solutions{i,5} = scores;
    
end
save('TestingDataGooglenet.mat', 'solutions')


clear all
close all



