clear all
close all

net = googlenet;
%net = squeezenet; 
Labels = readtable('labels7k.csv');
TrainImagePaths = table2array(Labels(:,1));
TrainLabels = table2array(Labels(:,2));
current_input(1:2013528,1) = uint8(0);
solutions = {}; 
clear Labels
%%
for i = 1:length(TrainImagePaths)
    I = imread(strcat(TrainImagePaths{i,1},'_image.jpg'));
   
    inputSize = net.Layers(1).InputSize;
    I = imresize(I,inputSize(1:2));
    [label,scores] = classify(net,I);

    [~,idx] = sort(scores,'descend');
    idx = idx(10:-1:1);
    classNamesTop = net.Layers(end).ClassNames(idx);
    scoresTop = scores(idx);
    
    solutions{i,1} = strcat(TrainImagePaths{i,1},'_image.jpg');
    solutions{i, 2} = classNamesTop;
    solutions{i,3} = scoresTop; 
    solutions{i,4} = label;
    solutions{i,5} = scores;
    
end
Classes = net.Layers(end).ClassNames;
save('TrainingData.mat', 'solutions',  'Classes');

