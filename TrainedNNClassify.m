%% Use this code to classify the test images as a car (1), other (2), or unknown (3)

clear 
% Load in Neural Net data
NetData = load('TrainedNNGooglenet.mat');

% Load in Classified Test Image Data

TestInputs = load('TestingDataGooglenet.mat');

%Load in Image Paths for Writing the CSV
Labels = readtable('ImagePaths.csv');
TestImagePaths = table2array(Labels(:,1));

% Set Up Inputs into Neural Net
 NNInputs(2631,65) = 0;
   
   
   for i = 1:2631
NNInputs(i,:) = TestInputs.solutions{i,5}(1,NetData.idx);

   end

%Run the Test Data through the Trained Neural Network
Output = sim(NetData.trainedNet,NNInputs');


% Format Data to write .csv file
labels = cell(2631,1);
b(2631,1 ) =0; 

for i = 1:2631
  [~,a] = max(Output(:,i));
%   labels{i,1} = TestImagePaths{i,1};
%   labels{i,2} = a-1;
  b(i) = a-1;
end

top = string({'guid/image,label'});
T{2631,1} = { ' '};
T{1,1} = top;

fid = fopen('PerceptionAttemptGooglenet_.csv','wt');

fprintf(fid, strcat(T{1,1},'\n'));


for i = 2:2632
T{i,1} = strcat(TestImagePaths{i-1,1}, ',', num2str(b(i-1)));
fprintf(fid, strcat(T{i,1}, '\n'));
end


fclose(fid);
%save('PerceptionAttempt_.csv', 'T');

