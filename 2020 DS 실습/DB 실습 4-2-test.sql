use university;
set sqp_safe_updates=0;
show tables;

select 학번,점수 from 수강 where 과목번호=11 and 점수>=90;

select s.학번, 이름, 점수 from 수강 e, 학생 s
where 과목번호=11 and 점수 >=90 and e.학번=s.학번;

select s.학번, 이름, 점수 from 수강 e, 학생 s
where 과목번호=11 and 점수 >=90 and e.학번=s.학번;

select s.학번, 이름, 학과명, 점수 from 수강 e, 학생 s, 학과 d
where 과목번호=11 and 점수>=90 and e.학번=s.학번 and s.학과번호=d.학과번호;

select s.학번, 이름, 학과명, 점수
from (수강 e join 학생 s on e.학번=s.학번) join 학과 d on s.학과번호=d.학과번호
where 과목번호=11 and 점수>=90;

select 학번, 이름 from 학생 where 학번 in
(select 학번 from 수강 where 과목번호=11 and 점수>=90);

select 학번, 이름 from 학생 s where exists
(select * from 수강 e where 과목번호=11 and 점수>=90 and e.학번=s.학번);

select 담당교수, 강의실 from 과목
where 과목명='네트워크';

select 학생.학번
from 학생,수강
where 학생.학번=수강.학번 and 수강.과목번호=10;

select 학번
from 학생
where 학번 in (select 학번
				 from 수강
                 where 과목번호=10);

select s.학번
from 학생 as s
where s.학번 in (select 학번
			 from 수강 as c
			 where s.학번=c.학번 and c.과목번호=10);
             
select 학번
from 학생
where 학번 not in (select 학번
				 from 수강
                 where 과목번호=10); 
				
select s.학번
from 학생 as s
where s.학번 not in (select 학번
			 from 수강 as c
			 where s.학번=c.학번 and c.과목번호=10);                