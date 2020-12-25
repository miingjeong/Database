use company;
set sql_safe_updates =0;
show tables;

select * from dept_locations;
alter table dept_locations add column phone char(15);
select * from dept_locations;

update dept_locations set phone='010-1234-9234' where dlocation='Houston';
update dept_locations set phone='010-8888-1234' where dlocation='Stafford';
update dept_locations set phone='010-6666-1234' where dlocation='Bellaire';
update dept_locations set phone='010-4444-1234' where dnumber=5;
update dept_locations set phone='010-2121-1234' where dlocation='Sugarland';
select * from dept_locations;

alter table project add column money int;
update project set money=30 where pnumber=1;
update project set money=55 where pnumber=2;
update project set money=62 where pnumber=3;
update project set money=11 where pnumber=10;
update project set money=70 where pnumber=20;
update project set money=86 where pnumber=30;
select * from project;

insert into department values('영업부',7,'333445555','1990-01-01');
insert into department values('비서실',8,'999887777','2010-01-01');
select * from department;

insert into dept_locations values('7','Seoul','010-2412-9310');
insert into dept_locations values('7','Chuncheon','010-1111-9310');
insert into dept_locations values('7','Guri','010-3333-9310');
select * from dept_locations;

insert into employee values ('Minji','T','Wong','11122333','1955-12-08','638 Voss,
Houston,TX','M',40000,'888665555',7);
insert into employee values ('Hosu','T','NON','432432432','1955-12-08','638 Voss,
Houston,TX','M',40000,'888665555',7);
insert into employee values ('Jon','T','Park','678678678','1955-12-08','638 Voss,
Houston,TX','M',40000,'888665555',7);
select * from employee;

insert into works_on values('678678678',1,40.0);
insert into works_on values('678678678',2,20.0);
insert into works_on values('678678678',3,30.0);
insert into works_on values('11122333',10,21.0);
insert into works_on values('11122333',20,31.0);
select * from works_on;

select ssn,fname,lname,bdate from employee where salary>=30000;

select ssn,fname,lname,bdate from employee where dno=5 and salary>=30000;

select essn,pno from works_on where pno=1 or pno=2 or pno=3;

select ssn,pnumber from employee,project,department where dname='reserch'and mgr_ssn=ssn and dno=dnum;

select dnumber,mgr_ssn from department where dname='영업부';

select dlocation,phone from dept_locations where dnumber=7;

select E.fname, E.lname, S.fname, S.lname
from employee as E, employee as S
where E.super_ssn=S.ssn;

select E.fname,E.lname, S.Fname,S.lname
from employee as E, employee as S,department as D 
where E.super_ssn=S.ssn and E.dno <> D.dnumber;
