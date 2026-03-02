create schema crime_management;
use crime_management;

CREATE TABLE criminals (
    criminal_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender ENUM('Male','Female','Other'),
    city VARCHAR(100),
    crime_type VARCHAR(100),
    arrest_date DATE
);

CREATE TABLE officers (
    officer_id INT PRIMARY KEY,
    name VARCHAR(100),
    officer_rank VARCHAR(50),
    department VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE cases (
    case_id INT PRIMARY KEY,
    criminal_id INT,
    officer_id INT,
    case_type VARCHAR(100),
    case_date DATE,
    status ENUM('Open','Closed','Under Investigation'),
    FOREIGN KEY (criminal_id) REFERENCES criminals(criminal_id),
    FOREIGN KEY (officer_id) REFERENCES officers(officer_id)
);