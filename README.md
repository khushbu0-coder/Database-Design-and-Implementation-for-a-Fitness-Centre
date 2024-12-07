# Fitness Centre Database Design and Implementation  

## Project Overview  

This project focuses on the design and implementation of a relational database for a fitness centre. The database captures various entities and their relationships, including locations, gyms, coaches, amenities, classes, and certifications. The aim is to provide a structured way to manage data related to gym operations and enhance the accessibility of information for staff and clients.  

## Business Rules  

1. **Locations to Gym**: Each location may contain multiple gyms, and each gym must be contained by exactly one location (One-to-Many relationship).  
2. **Gym to Amenities**: Each gym may offer multiple amenities, and each amenity may be offered by multiple gyms (Many-to-Many relationship).  
3. **Gym to Coaches**: Each gym must be trained by multiple coaches, and each coach may be trained in multiple gyms (Many-to-Many relationship).  
4. **Gym to Classes**: Each gym must host multiple classes, and each class may be hosted by multiple gyms (Many-to-Many relationship).  
5. **Coaches to Certificates**: Each coach may attain multiple certificates, and each certificate must be attained by exactly one coach (One-to-Many relationship).  
6. **Coaches to Reviews**: Each coach may receive multiple reviews, and each review must be associated with exactly one coach (One-to-Many relationship).  
7. **Coaches to References**: Each coach may be given multiple references, and each reference must be provided by exactly one coach (One-to-Many relationship).  
8. **Courses to Certificates**: Each course may possess multiple certificates, and each certificate must be associated with exactly one course (One-to-Many relationship).  

## Database Structure  

### Tables  

1. **Locations**  
   - Stores information about different gym locations.  
   - Primary Key: `Location_ID`  

2. **Gym**  
   - Contains details about each gym.  
   - Primary Key: `GymID`  
   - Foreign Key: `Location_ID` references `Locations`  

3. **Amenities**  
   - Represents amenities offered by gyms.  
   - Primary Key: `AmenityID, AmenityGymID`  
   - Foreign Key: `AmenityGymID` references `Gym`  

4. **Coach**  
   - Stores information about fitness coaches.  
   - Primary Key: `CoachID`  

5. **Reviews**  
   - Contains reviews for coaches.  
   - Primary Key: `ReviewID, ReviewCoachID`  
   - Foreign Key: `ReviewCoachID` references `Coach`  

6. **Course**  
   - Represents various fitness courses.  
   - Primary Key: `CourseID`  

7. **Certificates**  
   - Contains certificates obtained by coaches.  
   - Primary Key: `CertificateID`  
   - Foreign Keys: `CoachID` references `Coach`, `CourseID` references `Course`  

8. **Reference**  
   - Stores client references for coaches.  
   - Primary Key: `ClientID`  
   - Foreign Key: `CoachID` references `Coach`  

9. **Class**  
   - Represents classes offered at gyms.  
   - Primary Key: `ClassName, RoomName`  

## SQL Implementation  

The SQL scripts provided in this project include:  

- Table creation statements for all entities.  
- Insert statements to populate the tables with sample data.  
- Select statements to query data based on specific conditions.  

## Getting Started  

To set up the database for the Fitness Centre project, follow these steps:  

### Prerequisites  

- Ensure you have a SQL database management system installed on your machine (e.g., MySQL, PostgreSQL).  
- Basic knowledge of SQL and database management.  

### Installation Steps  

1. **Clone the Repository**:  
   Open your terminal and run the following command to clone the repository:  
   ```bash  
   git clone https://github.com/khushbu0-coder/Database-Design-and-Implementation-for-a-Fitness-Centre.git  
   cd Database-Design-and-Implementation-for-a-Fitness-Centre
