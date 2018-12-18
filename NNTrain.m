%% NNTrain loads in the output data from inceptionv3 and 
%trains a Neural network to to label the images as a 0,1,or 2.

clear 

%Read in training outputs of inceptionv3 network 
%data = load('TrainingData.mat');

data = load('TrainingDataGooglenet.mat');
%read in labels csv
Labels = readtable('labels7k.csv');

NNlabels = table2array(Labels(:,2));
a = length(NNlabels);

% make list of indicies from Solutions that matter to identifying cars:
idx = [404,405,406,408,445,469,473,480,485,511,512,...
       518,519,538,548,555,556,562,566,570,574,576,557,...
       587,596,604,610,622,626,628,655,657,...
       661,662,666,671,672,676,691,706,731,735,...
       752,758,780,781,792,803,804,813,815,818,821,...
       830,834,848,865,867,868,871,872,875,881,896,915];
   
   %Set NNinputs to the inceptionv3 scores of labels that are vehicle
   %things
   NNInputs(a,65) = 0;
   
   %creat target matrix from NNlabels
   NNTarget(3,a) = 0;
   
   
   for i = 1:a
NNInputs(i,:) = data.solutions{i,5}(1,idx);

NNTarget(NNlabels(i)+1,i) = 1;
   end
   
   %Create neural network structure with one hidden layer
   %having 20 nodes
NET = feedforwardnet([20,20]);

%Train the Neural Network using the GPU
trainedNet = train(NET,NNInputs',NNTarget);

save('TrainedNNGooglenet.mat', 'trainedNet', 'idx');

