
/*join*/
------------------------------------------------------------------------------------------------------------

-- employees의 department_id = department의 department_id
select *
from employees, departments
where employees.department_id = departments.department_id;

select first_name,
       department_name,
       --department_id 어느쪽의 department_id인지 명확하지 않아 오류
       em.department_id --테이블 지정시 오류없음
from employees em, departments de
where em.department_id = de.department_id;

/*예제
모든 직원이름, 부서이름, 업무명 을 출력하세요*/
select em.first_name "직원이름",
       de.department_name "부서이름",
       jo.job_title "업무명"
from employees em, jobs jo, departments de
where em.job_id = jo.job_id
and em.department_id = de.department_id;

--left조인
select em.department_id,
       em.first_name,
       de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

--right조인
select em.department_id,
       em.first_name,
       de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

--right조인 --> left조인
select *
from departments de left outer join employees em
on de.department_id = em.department_id;

--오라클만 (+)
select de.department_id,
       em.first_name,
       de.department_name
from employees em, departments de
where em.department_id = de.department_id(+); 

--full outer join
select em.department_id, 
       em.first_name, 
       de.department_name
from employees em full outer join departments de
on em.department_id = de.department_id ;

select em.department_id,
       em.first_name,
       de.department_name,
       de.department_id
from employees em, departments de
where em.department_id(+) = de.department_id(+); --사용x

select em.department_id,
       em.first_name,
       de.department_name,
       de.department_id
from employees em, departments de
where em.department_id = de.department_id(+);

--join 실행순서
select em.department_id,
       em.first_name,
       de.department_name,
       de.department_id
from employees em, departments de
where em.department_id = de.department_id
--group by
--having
order by em.department_id desc;

--self join 자기자신과 join
select emp.employee_id,
       --employees.first_name 오류. alias 사용해야함
       emp.first_name,
       emp.manager_id,
       man.first_name "manager"
from employees emp, employees man
where emp.manager_id = man.employee_id;

--잘못된 사용 예시
select *
from employees em, locations lo
where em.salary = lo.location_id;
