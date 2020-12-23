
/*rownum*/
------------------------------------------------------------------------------------------------------------

--급여를 가장 많이 받는 직원 5명의 이름을 출력하시오
--rownum이 order by보다 먼저 생겨서 번호가 섞인다
select rownum,
       employee_id,
       first_name,
       salary
from employees
order by salary desc;

--정렬하고 rownum을 사용
select rownum,
       employee_id,
       first_name,
       salary
from (select *
      from employees
      order by salary desc) o; --salary로 정렬되어있는 테이블 사용 / o로 테이블명 만들어줌
      
select rownum,
       o.id,
       o.name,
       o.salary
from (select em.employee_id id,
             em.first_name name,
             em.salary
      from employees em
      order by salary desc) o
where rownum >= 1    -- where절 조건이 2부터 값이 없음
and rownum <= 5;    

--일련번호 주고 바로 조건을 판단해서
select ro.rnum,
       ro.employee_id,
       ro.first_name,
       ro.salary
from (select rownum rnum,
             o.employee_id,
             o.first_name,
             o.salary
from (select em.employee_id,
             em.first_name,
             em.salary
      from employees em
      order by salary desc) o
     ) ro
where rnum >=11
and rnum <=20;

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은? 
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
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc) o
      ) ro
where ro.rn >= 3
and ro.rn <=7;

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
        where hire_date >= '07/01/01'
        and hire_date <= '07/12/31'
        order by salary desc) o ;  --07년에 입사한 직원 리스트 급여순 정렬/rownum

select first_name,
       salary,
       hire_date
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc;  --07년에 입사한 직원 리스트 급여순 정렬




