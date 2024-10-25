use section3;

CREATE TABLE Locations(
    Location_ID Int PRIMARY KEY NOT NULL,
    LocationName Varchar(100),
    NoOfVisits Int 
);

INSERT INTO Locations(Location_ID,LocationName,NoOfVisits)VALUES(101,'Midtown',15);
INSERT INTO Locations(Location_ID,LocationName,NoOfVisits)VALUES(103,'Cabbagetown',8);
INSERT INTO Locations(Location_ID,LocationName,NoOfVisits)VALUES(107,'EastView',3);


CREATE TABLE Class(
    ClassName VARCHAR(50) NOT NULL,
    RoomName VARCHAR(50) NOT NULL, 
    Time DECIMAL(8,2),
    Price DECIMAL(8,2) CHECK (Price>=0),
    Day VARCHAR (10) ,
    PRIMARY KEY (ClassName,RoomName)
);

INSERT INTO Class(ClassName,RoomName,Time,Price,Day)VALUES('Body Pump','Big Studio','9.50',10,'Thursday');
INSERT INTO Class(ClassName,RoomName,Time,Price,Day)VALUES('Hiit','Studio 1','9.50',5,'Thursday');
INSERT INTO Class(ClassName,RoomName,Time,Price,Day)VALUES('Body Pump','Studio 1','10.20',10,'Thursday');
INSERT INTO Class(ClassName,RoomName,Time,Price,Day)VALUES('Yoga','Small Studio','9.50',8,'Thursday');


CREATE TABLE Coach(
    CoachID INTEGER PRIMARY KEY,
    CoachName VARCHAR(50) NOT NULL,
    Level INTEGER ,
    Rating INTEGER CHECK(Rating BETWEEN 0 and 5)
);

INSERT INTO Coach(CoachID, CoachName,Level, Rating)VALUES(201,'Sally',3,5);
INSERT INTO Coach(CoachID, CoachName,Level, Rating)VALUES(203,'Adam',2,4);
INSERT INTO Coach(CoachID, CoachName,Level, Rating)VALUES(205,'Sander',3,5);


CREATE TABLE Reviews(
    ReviewID INTEGER NOT NULL,
    ReviewCoachID INTEGER NOT NULL,
    Date DATE ,
    Communication INTEGER CHECK(Communication BETWEEN 0 and 5),
    Enthusiasm INTEGER CHECK (Enthusiasm BETWEEN 0 and 5),
    Punctuality INTEGER CHECK (Punctuality BETWEEN 0 and 5),
    Description VARCHAR(100),
    PRIMARY KEY(ReviewID, ReviewCoachID),
    CONSTRAINT Fk_RCID FOREIGN KEY (ReviewCoachID)
    REFERENCES Coach(CoachID)
);

INSERT INTO Reviews(ReviewID,ReviewCoachID,Date,Communication,Enthusiasm,Punctuality,Description)VALUES(301,201,'2024-01-02',3,4,3,'You are amazing Coach');
INSERT INTO Reviews(ReviewID,ReviewCoachID,Date,Communication,Enthusiasm,Punctuality,Description)VALUES(303,203,'2024-02-13',4,5,3,'Really Hardworking Coach');
INSERT INTO Reviews(ReviewID,ReviewCoachID,Date,Communication,Enthusiasm,Punctuality,Description)VALUES(305,205,'2024-03-28',4,5,3,'Sally is really Humble and hardworking!');


CREATE TABLE Course(
    CourseID INTEGER PRIMARY KEY NOT NULL,
    CourseName VARCHAR (100)NOT NULL
);

INSERT INTO Course(CourseID,CourseName)VALUES(401,'NASM');
INSERT INTO Course(CourseID,CourseName)VALUES(403,'ACE');
INSERT INTO Course(CourseID,CourseName)VALUES(405,'MBLEX');

CREATE TABLE Certificates(
    CertificateID INTEGER PRIMARY KEY NOT NULL,
    CertificateName Varchar(100) ,
    CoachID INTEGER,
    CourseID INTEGER,
    CONSTRAINT Fk_CoachID FOREIGN KEY (CoachID)
    REFERENCES Coach(CoachID),
    CONSTRAINT Fk_courseID FOREIGN KEY(CourseID)
    REFERENCES Course(CourseID)
);


INSERT INTO Certificates(CertificateID,CertificateName,CoachID,CourseID)VALUES(501,'Advanced Fit',201,403);
INSERT INTO Certificates(CertificateID,CertificateName,CoachID,CourseID)VALUES(503,'Bikram Yoga',201,401);
INSERT INTO Certificates(CertificateID,CertificateName,CoachID,CourseID)VALUES(505,'Massage III',201,405);

CREATE TABLE Reference(
    ClientID INTEGER PRIMARY KEY NOT NULL,
    ClientName Varchar(50)NOT NULL,
    Phone VARCHAR(20) ,
    Email VARCHAR(50),
    CoachID INTEGER,
    CONSTRAINT Fk_cID FOREIGN KEY(CoachID)
    REFERENCES Coach(CoachID)
);

INSERT INTO Reference(ClientID,ClientName,Phone,Email,CoachID)VALUES(601,'Mamta',289-885-1649,'mamta2@gmail.com',201);
INSERT INTO Reference(ClientID,ClientName,Phone,Email,CoachID)VALUES(603,'Chan',905-598-7602,'sinchang@gmail.com',203);
INSERT INTO Reference(ClientID,ClientName,Phone,Email,CoachID)VALUES(605,'Khushbu',289-885-8497,'khushbu0@gmail.com',205);



CREATE TABLE Gym(
    GymID INTEGER PRIMARY KEY NOT NULL,
    GymName VARCHAR(50) NOT NULL,
    GymAddress VARCHAR (100) NOT  NULL,
    Telephone Varchar(50) ,
    Email VARCHAR(50),
    Location_ID INTEGER ,
    ClassName VARCHAR(50),
    RoomName VARCHAR(50),
    CoachID INTEGER ,
    CONSTRAINT Fk_LID FOREIGN KEY(Location_ID)
    REFERENCES Locations(Location_ID),
    CONSTRAINT Fk_C_ID FOREIGN KEY(CoachID)
    REFERENCES Coach(CoachID),
    CONSTRAINT FK_Class FOREIGN KEY (ClassName, RoomName)
    REFERENCES Class(ClassName, RoomName)
);

INSERT INTO Gym(GymID, GymName,GymAddress,Telephone,Email,Location_ID,ClassName,RoomName,CoachID)
VALUES
(701,'The Fitness Centre','94 Haliford Place',288-789-7898,'fitness501@gmail.com',107,'Body Pump','Big Studio',205),
(703,'Pulse Fitness Studio','64 Windmill Blvd',288-603-1567,'pulse41@gmail.com',101,'Hiit','Studio 1',201),
(705,'Iron Forge Gym','4 Trewartha Crescent',289-345-1267,'forge890@gmail.com',101,'Body Pump','Studio 1',201),
(707,'Training Centre','13 Coin Street',275-321-1897,'centre57@gmail.com',107,'Yoga','Small Studio',203);


CREATE TABLE Amenities(
    AmenityID INTEGER NOT NULL ,
    AmenityGymID INTEGER NOT NULL,
    AmenityName VARCHAR(20) ,
    PRIMARY KEY (AmenityID,AmenityGymID),
    CONSTRAINT Fk_AGID FOREIGN KEY (AmenityGymID)
    REFERENCES Gym(GymID)
);

INSERT INTO Amenities(AmenityID,AmenityGymID,AmenityName)VALUES(801,705,'Sauna');
INSERT INTO Amenities(AmenityID,AmenityGymID,AmenityName)VALUES(803,701,'GreenZone');
INSERT INTO Amenities(AmenityID,AmenityGymID,AmenityName)VALUES(805,703,'Hot Yoga');
INSERT INTO Amenities(AmenityID,AmenityGymID,AmenityName)VALUES(807,701,'Spinning');
INSERT INTO Amenities(AmenityID,AmenityGymID,AmenityName)VALUES(809,705,'Pool');

--Select Statements : 

--statement1
SELECT * 
From Locations;

-- statement2
SELECT L.LocationName , G.GymAddress,G.Email,G.Telephone,A.AmenityName,C.CoachName
From Locations L  JOIN Gym G ON L.Location_ID = G.Location_ID
INNER JOIN Amenities A ON G.GymID = A.AmenityGymID
INNER JOIN Coach C ON G.CoachID = C.CoachID
WHERE LocationName='Midtown';

-- statement3
SELECT *
FROM Coach;

--statement4
SELECT C.CoachName, C.Level, C.Rating, L.LocationName, CF.CertificateName, R.ClientName, R.Phone, R.Email
FROM Coach C INNER JOIN Reference R
ON C.CoachID = R.CoachID
INNER JOIN Certificates CF ON CF.CoachID = C.CoachID
INNER JOIN Gym G ON G.CoachID = C.CoachID
INNER JOIN Locations L ON L.Location_ID = G.Location_ID
WHERE C.CoachName = 'Sally';