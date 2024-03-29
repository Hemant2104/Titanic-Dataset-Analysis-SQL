USE HEMANT;

SELECT * FROM TITANIC;

####### SHOW THE FIRST 10 ROWS OF DATASET ###########

SELECT * FROM TITANIC LIMIT 10;

##### FIND THE NUMBER OF PASSENGER WHO SURVIVED ##########

SELECT COUNT(SURVIVED) AS ALIVE FROM TITANIC WHERE SURVIVED = 1;

######## FIND THE AVG AGE OF ALL PASSENGER ######

SELECT AVG(AGE) AS AVGAGE FROM  TITANIC;

######### FIND THE NUMBER OF PASSENGER IN EACH CLASS #########

SELECT PCLASS, COUNT(PCLASS) AS NO_OF_PASSENGER FROM TITANIC GROUP BY PCLASS;
 
####### FIND THE FIRST 10 ROWS OF DATASET SORTED BY PASSENGER CLASS IN DESC ORDER ###########

SELECT * FROM TITANIC
ORDER BY PCLASS DESC
LIMIT 10;

####### FIND THE NUMBER OF PASSENGER IN EACH CLASS SORTED BY CLASS IN ASC ORDER ###########

SELECT PCLASS, COUNT(PCLASS) AS PCLASS FROM TITANIC 
GROUP BY PCLASS 
ORDER BY PCLASS ASC;

########## FIND THE AVG FAIR PAY BY PASSENGER IN EACH CLASS #########

SELECT PCLASS, ROUND(AVG(FARE), 2) AS AVGFARE FROM TITANIC
GROUP BY PCLASS
ORDER BY AVGFARE;

######## FIND THE NUMBER OF PASSENGER WITH THE HIGHEST FAIR ########

SELECT NAME, SUM(FARE) AS HIGHFARE FROM TITANIC
GROUP BY NAME
ORDER BY HIGHFARE DESC;

######## FIND THE NAME OF THE PASSENGER WHO HAD THE HIGHEST AGE AMONG THE SURVIVORS ########

SELECT NAME, SURVIVED , MAX(AGE) AS AGE FROM TITANIC
WHERE SURVIVED = 1
GROUP BY NAME
ORDER BY AGE DESC
LIMIT 1;

######## FIND THE NUMBER OF PASSENGER WHO PAID MORE THAN AVERAGE FARE ########

SELECT AVG(FARE) FROM TITANIC;

SELECT COUNT(*) AS NO_OF_PASS  FROM TITANIC
WHERE FARE > 32.20;

####### FIND THE NAME OF PASSENGER WHO HAD THE MOST PARENTS OR CHILDREN ON BOARD ######

SELECT * FROM TITANIC;

SELECT NAME,MAX(PARCH) FROM TITANIC 
GROUP BY NAME
ORDER BY MAX(PARCH) DESC
LIMIT 1;
#### ANOTHER WAY OF USING SUBQUERY #####

SELECT NAME, PARCH FROM TITANIC WHERE PARCH = (SELECT MAX(PARCH) FROM TITANIC);

######## FIND THR NUMBER OF MALE AND FEMALE PASSENGER WHO SURVIVED, AND OTHER THE RESULTS BY SEX IN ASC ORDER ############

SELECT * FROM TITANIC;

SELECT SEX, COUNT(SEX) AS ALIVE FROM TITANIC
WHERE SURVIVED = 1
GROUP BY SEX
ORDER BY ALIVE ASC;
	
######## FIND THE NAME,AGE,FARE OF THR OLDEST PASSENGER WHO SURVIVED #######

SELECT * FROM TITANIC;

SELECT NAME,AGE,FARE FROM TITANIC
WHERE SURVIVED = 1
ORDER BY AGE DESC
LIMIT 1;

#### ANOTHER WAY OF USING SUBQUERY #####

SELECT NAME,AGE,FARE FROM TITANIC WHERE AGE = (SELECT MAX(AGE) FROM TITANIC WHERE SURVIVED = 1 );

###### FIND THE NAME AND AGE OF THE YOUNGEST FEMALE PASSENGER WHO SURVIVED IN THIRD CLASS ######

SELECT * FROM TITANIC;

SELECT NAME, AGE FROM TITANIC
WHERE SURVIVED = 1 AND PCLASS = 3 AND SEX = 'FEMALE'
ORDER BY AGE ASC;

######### FIND THE NUMBER OF MALE AND FEMALE PASSENGER ###########

SELECT COUNT(NAME) AS PASSENGER FROM TITANIC;

########### SELECT ALL PASSENGER WHO TRAVELLED IN A CABIN THAT WAS NOT SHARED BY OTHER PASSENGER ########

SELECT * FROM TITANIC WHERE CABIN NOT IN 
(SELECT CABIN FROM TITANIC GROUP BY CABIN HAVING COUNT(*) > 1 );






