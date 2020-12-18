-----------
/*그룹함수*/
-----------

--오류발생
select avg(salary), --총 평균값 1개
       first_name --이름 여러개
from employees;   -- 출력오류

--그룹함수 avg()
select avg(salary)
from employees;

--그룹함수 count()
select count(*) --전체 low의 값의 갯수를 구하라
from employees;

select count(commission_pct) --commission_pct의 값의 갯수를 구하라 (null제외)
from employees;

select count(*) --조건절 추가
from employees
where salary > 16000;

--그룹함수 sum
select sum(salary)
from employees;

select count(*) , sum(salary)
from employees;

--그룹함수 avg() null일때 0으로 변환
select count(*),
       sum(salary),
       avg(salary)
from employees;

select count(*),
       sum(salary),
       avg(nvl(salary, 0))
from employees;

--그룹함수 max(), min()
select max(salary)
from employees;

select min(salary)
from employees;

-------------
/*group by절*/
-------------

select department_id,
       avg(salary) --오류
from employees;

select department_id,
       avg(salary)
from employees
group by department_id; --group by에 참여한 컬럼이나 그룹함수만 올수있다.

--group by절 자주하는 오류
select department_id,
       count(*),
       sum(salary),
       job_id
from employees
group by department_id;

select department_id,
       job_id,
       count(*)
from employees
group by department_id, job_id;

select department_id,
       job_id,
       count(*),
       sum(salary),
       avg(salary)
from employees
group by department_id, job_id
order by department_id asc;

--예제
--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
select department_id,
       count(*),
       sum(salary)
from employees
where sum(salary) >= 20000 --그룹함수는 where절을 쓰지 못한다.
group by department_id;

--having절
select department_id,
       count(*),
       sum(salary)
from employees
group by department_id
having sum(salary) >= 20000 --having절에는 그룹함수와 group by에 참여한 컬럼만 사용가능
and department_id = 100;

-------------
/*case - end*/
-------------
--case~end문 java if~else문과 유사
select employee_id,
       salary,
       job_id,   
       case when job_id = 'AC_ACCOUNT' then salary * 0.1
            when job_id = 'SA_REP' then salary * 0.2
            when job_id = 'ST_CLERK' then salary * 0.3
            else salary * 0
       end bonus  --salary*01. as bonus
from employees;

--DECODE문 ==일때만 가능
select employee_id,
       salary,
       job_id,
       decode(job_id, 'AC_ACCOUNT', salary*0.1,
                      'SA_REP', salary + salary * 0.2,
		              'ST_CLERK', salary + salary * 0.3,
                      salary * 0
       ) as bonus
from employees;

/*예제
직원의 이름, 부서, 팀을 출력하세요. 팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.*/
select first_name,
       department_id,
       case when department_id >=10 and department_id <=50 then 'A-TEAM'
            when department_id >=60 and department_id <=100 then 'B-TEAM'
            when department_id >=110 and department_id <=150 then 'C-TEAM'
            else '팀없음'
       end as team
from employees;



