CS3907/CS6444 Big Data and Analytics
Fall 2018
Class Project #2
Due: October 22, 2018

Exploring Variations in Clustering and Predictive Analysis

1. Data Set: Adult (on Blackboard)
These data sets are described in adult.data, adult.names, adult.test

Objective: There are two classes: >50K and <=50K (as determined by the authors- see adult.names)
1. Your job is to determine which of the adults falls into which category by applying clustering, classification, and prediction techniques discussed in class as well as additional functions from the packages mentioned.
2. Using clustering techniques, determine if there are more than just two classes. How many are there?

…………………..
Source:
Donor: 

Ronny Kohavi and Barry Becker 
Data Mining and Visualization 
Silicon Graphics. 

Data Set Information:
Extraction was done by Barry Becker from the 1994 Census database. A set of reasonably clean records was extracted using the following conditions: ((AAGE>16) && (AGI>100) && (AFNLWGT>1)&& (HRSWK>0)) 

Prediction task is to determine whether a person makes over 50K a year. 
Attribute Information:
Listing of attributes: 

>50K, <=50K. 

age: continuous. 
workclass: Private, Self-emp-not-inc, Self-emp-inc, Federal-gov, Local-gov, State-gov, Without-pay, Never-worked. 
fnlwgt: continuous. 
education: Bachelors, Some-college, 11th, HS-grad, Prof-school, Assoc-acdm, Assoc-voc, 9th, 7th-8th, 12th, Masters, 1st-4th, 10th, Doctorate, 5th-6th, Preschool. 
education-num: continuous. 
marital-status: Married-civ-spouse, Divorced, Never-married, Separated, Widowed, Married-spouse-absent, Married-AF-spouse. 
occupation: Tech-support, Craft-repair, Other-service, Sales, Exec-managerial, Prof-specialty, Handlers-cleaners, Machine-op-inspct, Adm-clerical, Farming-fishing, Transport-moving, Priv-house-serv, Protective-serv, Armed-Forces. 
relationship: Wife, Own-child, Husband, Not-in-family, Other-relative, Unmarried. 
race: White, Asian-Pac-Islander, Amer-Indian-Eskimo, Other, Black. 
sex: Female, Male. 
capital-gain: continuous. 
capital-loss: continuous. 
hours-per-week: continuous. 
native-country: United-States, Cambodia, England, Puerto-Rico, Canada, Germany, Outlying-US(Guam-USVI-etc), India, Japan, Greece, South, China, Cuba, Iran, Honduras, Philippines, Italy, Poland, Jamaica, Vietnam, Mexico, Portugal, Ireland, France, Dominican-Republic, Laos, Ecuador, Taiwan, Haiti, Columbia, Hungary, Guatemala, Nicaragua, Scotland, Thailand, Yugoslavia, El-Salvador, Trinadad&Tobago, Peru, Hong, Holand-Netherlands.
……………

You will need to divide your data set into a training set and a test set. Use samples of 50-50, 60-40, and 70-30 for the training-test ratios. One test set, adult.test, is already provided.

Try plotting the data using several plotting functions to see what it looks like. Use pairs (e.g., 2D plots) or 3 variables (3D plots) based on the packages. 

Try to filter the data by selecting samples with only certain attribute values and plotting them.

You should try data reduction to eliminate some attributes through Principal Components Analysis. The idea is to try and select N attributes that will help you focus on identifying the unsure samples.

We discussed a number of techniques in lectures 4 and 5, but you can use other techniques from the contributed R packages.

2. This will involve some statistical analysis and some clustering. Use the R packages and functions in the notes as well as the ones below. Specifically, use k-means clustering, iClust, and hclust. Describe what you find from applying these methods.

3. Deliverables: You will deliver your results by putting a zipfile in your group’s Blackboard file, with the following naming convention: Group-N-Project-2.zip, where N is your group number. Your deliverable should encompass the following items:

A listing of all R functions that you have written
•	A document giving your results which should include:
a. A description of the edible, poisonous classes and the uncertain category, respectively, based on the features using three different clustering methods such as kmeans, k-nearest neighbor, or one other in the R contributed packages. Clearly identify which methods you are using.

Note: The first column in the data set has e for edible and p for poisonous. All well and good but that does not tell you what features distinguish them. That is what you have to determine.

b. a clustering of the samples into N = 3, 5, 7 classes using the three different clustering methods. The idea is to see how the clustering method and its underlying assumptions changes your perspective on the data.
c. prepare a table containing the data from (a & b) with the three training-test ratios for each of the N and each clustering method
d. plots using several methods in lectures 4 and 5.

You should investigate some of the statistics of the data set

4. Try the lm and glm methods to get linear fits for the data. This will not work on all attributes, so you must determine which ones it will work on. Note as discussed in class binomial (logit) expects two categories, so you might combine the two data sets into one and determine if you can distinguish between and how good the fit it.

