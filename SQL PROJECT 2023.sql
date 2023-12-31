create database Film
use FILM

CREATE TABLE ARTIST(ART_ID INT,ART_NAME VARCHAR(255),ART_GENDER VARCHAR(10) 
INSERT INTO ARTIST(ART_ID,ART_NAME,ART_GENDER)VALUE(1,'AKSHAY','MALE')
INSERT INTO ARTIST VALUE(2,'NIDHI','FEMALE')
INSERT INTO ARTIST VALUE(3,'AJAY','MALE')
INSERT INTO ARTIST VALUE(4,'GOVINDA','MALE')
INSERT INTO ARTIST VALUE(5,'ANIL','MALE')
INSERT INTO ARTIST VALUE(6,'PRITI','FEMALE')
INSERT INTO ARTIST VALUE(7,'RIYA','FEMALE')
INSERT INTO ARTIST VALUE(8,'HEENA','FEMALE')
SELECT * FROM ARTIST

CREATE TABLE PRODUCER(PROD_ID INT,PROD_NAME VARCHAR(255),PROD_PHONE VARCHAR(15) )
INSERT INTO PRODUCER(PROD_ID,PROD_NAME,PROD_PHONE)VALUE(01,'SHREE',8806876504)
INSERT INTO PRODUCER VALUE(02,'RAJ',7798812334)
INSERT INTO PRODUCER VALUE(03,'MOHAN',9545310152)
INSERT INTO PRODUCER VALUE(04,'NIRAJ',8329609116)
INSERT INTO PRODUCER VALUE(05,'AMAN',8390479892)
INSERT INTO PRODUCER VALUE(06,'MAHESH',8888909091)
INSERT INTO PRODUCER VALUE(07,'ROSHAN',7788996655)
INSERT INTO PRODUCER VALUE(08,'SURYA',1234567890)
SELECT * FROM PRODUCER

CREATE TABLE FILMS(FILM_ID INT,FILM_TITLE VARCHAR(255),FILM_YEAR INT,FILM_LANG VARCHAR(255),PROD_ID INT)
INSERT INTO FILMS(FILM_ID,FILM_TITLE,FILM_YEAR,FILM_LANG,PROD_ID)VALUE(11,'RAMSETU',2023,'HINDI',04)
INSERT INTO FILMS VALUE(12,'WAR',2020,'HINDI',01)
INSERT INTO FILMS VALUE(13,'ANGARE',2002,'HINDI',05)
INSERT INTO FILMS VALUE(14,'MISSION',2021,'ENGLISH',04)
INSERT INTO FILMS VALUE(15,'TERMINATOR',2016,'ENGLISH',08)
INSERT INTO FILMS VALUE(16,'URI',2019,'HINDI',04)
INSERT INTO FILMS VALUE(17,'KHILADI',2013,'TAMIL',02)
INSERT INTO FILMS VALUE(18,'PUSHPA',2022,'TAMIL',03)
INSERT INTO FILMS VALUE(19,'RAJ',2001,'HINDI',06)
INSERT INTO FILMS VALUE(20,'HUM',2003,'TAMIL',08)
INSERT INTO FILMS VALUE(21,'RACE',2004,'HINDI',07)
SELECT * FROM FILMS

CREATE TABLE CASTING(ART_ID INT,FILM_ID INT,PART INT)
INSERT INTO CASTING(ART_ID,FILM_ID,PART)VALUE(01,11,1)
INSERT INTO CASTING VALUE(05,12,1)
INSERT INTO CASTING VALUE(03,13,3)
INSERT INTO CASTING VALUE(04,14,2)
INSERT INTO CASTING VALUE(07,15,1)
INSERT INTO CASTING VALUE(02,16,2)
INSERT INTO CASTING VALUE(06,17,2)
INSERT INTO CASTING VALUE(08,18,1)
INSERT INTO CASTING VALUE(01,19,2)
INSERT INTO CASTING VALUE(02,20,3)
INSERT INTO CASTING VALUE(03,21,3)
SELECT * FROM CASTING

CREATE TABLE REVIEW(FILM_ID INT,STARS DECIMAL(2,1) )
INSERT INTO REVIEW(FILM_ID,STARS)VALUE(11,4.9)
INSERT INTO REVIEW VALUE(12,3.8)
INSERT INTO REVIEW VALUE(13,4.1)
INSERT INTO REVIEW VALUE(14,3.1)
INSERT INTO REVIEW VALUE(15,4.7)
INSERT INTO REVIEW VALUE(16,4.2)
INSERT INTO REVIEW VALUE(17,2.3)
INSERT INTO REVIEW VALUE(18,5)
INSERT INTO REVIEW VALUE(19,2.9)
INSERT INTO REVIEW VALUE(20,4.9)
INSERT INTO REVIEW VALUE(21,4.1)
SELECT * FROM REVIEW

QUERY 1 //FIND THE NAME OF ALL FILMS WHOSE PROD. IS NIRAJ//

SELECT * FROM PRODUCER WHERE PROD_NAME = 'NIRAJ';

SELECT PROD_ID, PROD_NAME FROM PRODUCER
WHERE PROD_PHONE=8329609116;

SELECT PROD_ID FROM PRODUCER
WHERE PROD_NAME="NIRAJ";

SELECT FILM_TITLE FROM FILMS WHERE PROD_ID=04;


ALTER TABLE FILMS
ADD COLUMN RELEAS_DATE DATE;

UPDATE FILMS
SET RELEAS_DATE="2004-12-11" WHERE FILM_TITLE='RACE'

QUERY 2 // WHICH MOVIE RELEAS ON PERTICULER DATE //

SELECT FILM_TITLE FROM FILMS
WHERE RELEAS_DATE='2004-12-11'

SELECT FILM_TITLE FROM FILMS
WHERE RELEAS_DATE='2023-02-11'

SELECT FILM_TITLE FROM FILMS
WHERE RELEAS_DATE='2020-02-12'
 
SELECT FILM_TITLE,FILM_YEAR FROM FILMS
WHERE RELEAS_DATE='2016-01-28'

QUERY 3 // DISPLAY ALL ARTIST WHO ACTED IN A FILM BETWEEN 2016 AND 2020 //

SELECT ARTIST.ART_NAME, FILMS.FILM_TITLE, FILMS.FILM_YEAR
FROM ARTIST, CASTING, FILMS
WHERE ARTIST.ART_ID=CASTING.ART_ID
AND FILMS.FILM_ID=CASTING.FILM_ID
AND FILMS.FILM_YEAR BETWEEN 2016 AND 2020

QUERY 4 // DISPLAY THE NAME OF FILMS WITH THE STARS RECIVED  AND SORT ON BASIS OF STARS

SELECT FILMS.FILM_TITLE, REVIEW.FILM_ID, REVIEW.STARS
FROM FILMS, REVIEW
WHERE FILMS.FILM_ID=REVIEW.FILM_ID

SELECT FILMS.FILM_TITLE, REVIEW.STARS
FROM FILMS,REVIEW
WHERE FILMS.FILM_ID=REVIEW.FILM_ID
ORDER BY STARS

QUERY 5 // UPDATE THE STARS OF ALL FILMS WHOSE PRODUCER IS NIRAJ TO 5

SELECT PROD_ID FROM PRODUCER
WHERE PROD_NAME='NIRAJ'

SELECT * FROM REVIEW

UPDATE REVIEW
SET STARS=5 WHERE FILM_ID=11

UPDATE REVIEW
SET STARS=5 WHERE FILM_ID=14

UPDATE REVIEW
SET STARS=5 WHERE FILM_ID=16

SELECT FILMS.FILM_ID, FILMS.FILM_TITLE, FILMS.PROD_ID, REVIEW.STARS
FROM FILMS, REVIEW
WHERE FILMS.FILM_ID=REVIEW.FILM_ID

QUERY 6 // FILMS AND CASTING JOIN//

SELECT FILMS.FILM_TITLE, FILMS.FILM_YEAR, FILMS.FILM_LANG, CASTING.ART_ID
FROM FILMS
INNER JOIN CASTING
ON FILMS.FILM_ID=CASTING.FILM_ID

SELECT *
FROM FILMS
LEFT JOIN CASTING ON FILMS.FILM_ID=CASTING.FILM_ID

SELECT *
FROM CASTING
RIGHT JOIN FILMS ON FILMS.FILM_ID=CASTING.FILM_ID

SELECT *
FROM FILMS
LEFT JOIN CASTING ON FILMS.FILM_ID=CASTING.FILM_ID
UNION ALL
SELECT *
FROM CASTING
RIGHT JOIN FILMS ON FILMS.FILM_ID=CASTING.FILM_ID



                                                 //END//


















