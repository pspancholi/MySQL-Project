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

# Write a query to display officer_id and officer name of officers who have not handled any cases
select o.officer_id,o.name
from officers o
left join cases c
on o.officer_id = c.officer_id
where c.case_id is null ;

#Write a query to display criminal name and case_id including all criminals even if they don’t have any case registered
select cr.name,ca.case_id
from criminals cr
left join cases ca
on cr.criminal_id=ca.criminal_id;

#Write a query to display case_id, case_type and status where case_type is 'Theft' and status is 'Open'
select case_id,case_type,status from cases where case_type='Robbery Case' and status='Open';

#Write a query to display criminal_id, name and city where the name starts with 'R'
select criminal_id,name,city from criminals where name like 'L%';

#Write a query to display officer_id and number of cases handled by each officer
select officer_id,count(*) from cases group by officer_id;

#Write a query to display officer_id and number of cases handled, but show only officers who handled more than 3 cases
select officer_id,count(*) as Cased_Handled from cases group by officer_id having count(*)>2;

#Write a query to display criminal name and arrest_date of criminals whose arrest_date is after '2023-01-01'
select name, arrest_date from criminals where arrest_date > '2024-02-18';

#Write a query to display case_id and case_type for cases where the criminal belongs to city 'Delhi'
select c.case_id,c.case_type
from cases c
left join criminals cr
on c.criminal_id=cr.criminal_id
where city ='Chicago';

#Write a query to display criminal name and city for criminals who are involved in more than 2 cases
select cr.name,cr.city
from criminals cr
left join cases c
on cr.criminal_id = c.criminal_id group by cr.name,cr.city having count(c.case_id)>1 ;

#Write a query to display the name of the officer who handled the maximum number of cases

select name from officers where officer_id = (select officer_id from cases group by officer_id order by count(*) desc limit 1);

select name from officers where officer_id = (select officer_id from cases group by officer_id order by count(*) desc limit 1);