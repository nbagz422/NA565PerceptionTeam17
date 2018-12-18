===================================================================
  This is the README file for Team 17's NA565 Perception Project.
===================================================================

The purpose of the  code  in  this  folder is to  train  and test a 
Convolution  Neural Network to identify different types of vehicles 
from image data obtained from the game Grand Theft Auto V. 

Our Code is separated  into  two  folders:  One folder for Training
and one folder  for Testing the Neural  Network. Our Process uses a 
pretrained  Convolution  Neural  Network (CNN)  called Googlenet to
score the images based  on their  resemblance  to  1000 categories,
as various foods,  animals, and  vehicles. We  then take the scores
for the categories associated  with different  vehicles to serve as
the  inputs to a Neural  Network we  trained to further  categorize 
the  images  into  car,  other,  or  unknown  categories  for  this 
assignment. All of  the code written  and used  for this assignment
was written in MATLAB.

Below is the process to train and test our neural network.

===================================================================
			TRAINING INSTRUCTIONS
===================================================================

1: Open the "Train" Folder Contained with this README File.

2: Move  the  "GooglenetClassifierTraining.m",   "NNTrain.m",   and 
	"labels7k.csv" files into a folder that contains all of the
	training images in their respective folders. (This would be
	the  "trainval"  folder  provided to  us for this project.)

3: Open up the two MATLAB scripts in MATLAB.  Note: You need MATLAB 
	R2018b in  order to run  the  scripts as  the Deep Learning 	
	Toolbox is available for that  version of MATLAB. If you do
	not have the Deep  Learning Toolbox  and you try to run the 
	"GooglenetClassifierTraining.m"  script,  you  will receive
	an error in the Command Window with a  link to download the 
	toolbox. 

4: First  run "GooglenetClassifierTraining.m"   This will take some	
	extended period of time (on the order of an hour for a CAEN
	Machine).

5: Then run the "NNTrain.m" script. The file "TrainedNNGooglenet.mat" 
	is needed for testing the Neural Network. Training Completed

===================================================================
			TESTING INSTRUCTIONS
===================================================================

1: Open the "Test" Folder Contained with this README file.

2: Move the "ImagePaths.csv",  "GooglenetClassifierTesting.m",  and
	"TrainedNNClassify.m" files from  the "Test" Folder and the 
	"TrainedNNGooglenet.mat" file from the  "Train" Folder into
	a folder  containing all  of  the testing  images  in their  
	respective  folders.  (This  would  be  the  "test"  folder 
	provided  to us for this project.)

3: Open up the two MATLAB scripts in MATLAB.  Note: You need MATLAB 
	R2018b in  order to run  the  scripts as  the Deep Learning 	
	Toolbox is available for that  version of MATLAB. If you do
	not have the Deep  Learning Toolbox  and you try to run the 
	"GooglenetClassifierTesting.m"  script,  you  will  receive
	an error in the Command Window with a  link to download the 
	toolbox. 

4: First run  "GooglenetClassifierTesting.m"  This  will take  some	
	extended period of time (on  the order of a half hour for a 
	CAEN Machine).

5: Then  run the  "TrainedNNClassify.m" script.  The output file is 
	named  "PerceptionAttemptGooglenet_.csv",  and is formatted 
	to  upload  directly  to  Kaggle  for  submission.  Testing 
	Completed.

===================================================================


	
   
	 