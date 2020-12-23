
/*practice04*/
----------------------------------------------------------------------------------------------------------------------

/*문제1.(56건)
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.*/
select round(avg(salary), 0) --6462
from employees;

select employee_id,
       first_name,
       salary
from employees
where salary < (select round(avg(salary), 0) --6462
                from employees);


/*문제2.(51건)
평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요*/
select round(avg(salary),0)
from employees; --평균급여

select max(salary)
from employees; --최대급여

select employee_id,
       first_name,
       salary,
       round(avg(salary),0),
       max(salary)
from employees
where salary >= (select round(avg(salary),0)
                 from employees)
and salary <= (select max(salary)
               from employees)
group by employee_id, first_name, salary
order by max(salary) asc;

/*문제3.(1건)
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주(state_province),
나라아이디(country_id) 를 출력하세요*/
select department_id
from employees
where first_name = 'Steven'
and last_name = 'King'; --Steven king이 소속된 부서아이디(department_id)

select lo.location_id,
       lo.street_address,
       lo.postal_code,
       lo.city,
       lo.state_province,
       lo.country_id
from locations lo, departments de 
where lo.location_id = de.location_id
and de.department_id in (select department_id
                        from employees
                        where first_name = 'Steven'
                        and last_name = 'King');

/*문제4.(74건)
job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용*/
select salary --8000, 8200, 7900, 6500, 5800
from employees
where job_id in 'ST_MAN';

select employee_id,
       first_name,
       salary
from employees
where salary <any (select salary --8000, 8200, 7900, 6500, 5800
                     from employees
                     where job_id in 'ST_MAN');

/*문제5.(11건)
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요*/
select department_id,
       max(salary)
from employees
group by department_id; --부서별 최고급여

select employee_id,
       first_name,
       salary,
       department_id
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;
                                  
select em.employee_id,
       em.first_name,
       em.salary,
       de.department_id
from employees em, (select department_id,
                           max(salary) salary
                    from employees
                    group by department_id) de
where em.department_id = de.department_id
and em.salary = de.salary
order by em.salary desc;


/*문제6.(19건)
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오*/
select job_id,
       sum(salary)
from employees
group by job_id; --업무별 연봉 총합

select jo.job_title,
       ems.salary
from jobs jo, (select job_id,
               sum(salary) salary
               from employees
               group by job_id) ems
where jo.job_id = ems.job_id
order by ems.salary desc;


/*문제7.(38건)
자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 급여(salary)을 조회하세요*/
select department_id, 
       round(avg(salary),0)
from employees
group by department_id; --부서별 평균 급여 리스트

select em.employee_id,
       em.first_name,
       em.salary
from employees em, (select department_id, 
                           round(avg(salary),0) salary
                    from employees
                    group by department_id) emd
where em.department_id = emd.department_id
and em.salary > emd.salary;

/*문제8.
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력하세요*/
select employee_id,
       first_name,
       salary,
       hire_date
from employees
order by hire_date asc; --입사일 순서로 정렬

select rownum,
       o.employee_id,
       o.first_name,
       o.salary,
       o.hire_date
from (select employee_id,
             first_name,
             salary,
             hire_date
      from employees
      order by hire_date asc) o; -- 입사일 순서로 정렬/일련번호 생성rownum
      
select ro.rn,
       ro.employee_id,
       ro.first_name,
       ro.salary,
       ro.hire_date
from (select rownum rn,
             o.employee_id,
             o.first_name,
             o.salary,
             o.hire_date
      from (select employee_id,
             first_name,
             salary,
             hire_date
            from employees
            order by hire_date asc) o
      ) ro
where ro.rn >= 11
and ro.rn <= 15;








