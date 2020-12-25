use company;
show tables;

select * from employee;
select fname, lname, bdate from employee where address like '%Houston%';

select fname,lname,bdate from employee
where bdate like '19__-__-__';

select distinct salary from employee; 

select fname, lname,bdate
from employee
where dno in (select dnumber from department where dname='Research');

select fname, lname, bdate 
from employee as e
where exists(select * from department as d
where dname='Research'and e.dno=d.dnumber);

select fname, lname, bdate
from employee as e
where not exists ( select * from dependent as d where e.ssn=d.essn);

select fname, lname from employee, dependent where ssn=essn;
select fname,lname from employee as e inner join dependent as d
on e.ssn=d.essn;

select fname,lname from employee as e left join dependent as d
on e.ssn=d.essn; 

select dno,count(*), avg(salary)
from employee 
group by dno;

select avg(salary), dno,count(*)
from employee, department
where dno=dnumber
group by dname
having count(*)>2;

create view works_info as (select fname, lname, pname, dname,hours
from employee, department, project, works_on where ssn=essn and dnumber=dnum
and pnumber=pno);

select fname, lname, pname,hours from works_info;
select count(*), sum(hours) from works_info
group by pname;

