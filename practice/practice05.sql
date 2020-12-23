
/*practice05*/
----------------------------------------------------------------------------------------------------------------------

/*문제1.(45건)
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.*/
select first_name,
       manager_id
       commission_pct,
       salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;


/*문제2.(11건) 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date),
전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.*/
select max(salary)
from employees
group by department_id; --부서별 최고급여 리스트

select employee_id,
       first_name,
       salary,
       to_char(hire_date, 'YYYY-MM-DD DAY'),
       replace(phone_number, '.', '-'),
       department_id
from employees
where (department_id, salary) in (select department_id,
                                         max(salary) salary
                                  from employees
                                  group by department_id)
order by salary desc;
                 

/*문제3.(9건)
매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여 입니다.*/
select round(avg(salary),1) as,
       min(salary) mis,
       max(salary) mas
from employees
where manager_id is not null
group by manager_id
order by manager_id asc; --매니저별 담당직원들 평균급여,최소급여,최대급여

select man.manager_id,
       em.first_name,
       man.asal,
       man.misal,
       man.masal
from employees em, (select round(avg(salary),1) asal,
                           min(salary) misal,
                           max(salary) masal,
                           manager_id
                    from employees
                    where manager_id is not null
                    and hire_date > '05/01/01'
                    group by manager_id) man
where em.employee_id = man.manager_id
and man.asal >= 5000
order by man.asal desc;



/*문제4.(106명)
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name),
매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.*/
select em.employee_id,
       em.first_name,
       de.department_name,
       ema.first_name
from employees em left outer join departments de
               on em.department_id = de.department_id
    ,employees ema
where em.manager_id = ema.employee_id;


/*문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요*/
select em.employee_id,
       em.first_name,
       de.department_name,
       em.salary,
       em.hire_date
from employees em left outer join departments de
on em.department_id = de.department_id
where hire_date > '05/01/01'
order by em.hire_date asc; --2005년 이후 입사한 직원의 사번,이름,부서명,입사일 리스트/입사일순서로

select rownum,
       o.employee_id,
       o.first_name,
       o.department_name,
       o.salary,
       o.hire_date
from (select em.employee_id,
             em.first_name,
             de.department_name,
             em.salary,
             em.hire_date
      from employees em left outer join departments de
      on em.department_id = de.department_id
      where hire_date > '05/01/01'
      order by em.hire_date asc) o;  --입사일 순으로 정렬한 정보에 rownum으로 일련번호
      
select ro.rn,
       ro.employee_id,
       ro.first_name,
       ro.department_name,
       ro.salary,
       ro.hire_date
from (select rownum rn,
             o.employee_id,
             o.first_name,
             o.department_name,
             o.salary,
             o.hire_date
      from (select em.employee_id,
                   em.first_name,
                   de.department_name,
                   em.salary,
                   em.hire_date
            from employees em left outer join departments de
            on em.department_id = de.department_id
            where hire_date > '05/01/01'
            order by em.hire_date asc) o
      )ro
where ro.rn >= 11
and ro.rn <= 20;

/*문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름(department_name)은?*/
select max(hire_date)
from employees; --가장 늦은 입사일 08/04/21

select em.first_name || ' ' || em.last_name,
       em.salary,
       de.department_name,
       em.hire_date
from employees em, departments de
where em.department_id = de.department_id
order by hire_date desc;  --직원 이름,연봉,부서이름 리스트 입사늦은순서로 정렬 (rownum을 이용해 1,2번을 뽑을 계획)

select rownum rn,
       o.name,
       o.salary,
       o.department_name,
       o.hire_date
from (select em.first_name || ' ' || em.last_name name,
             em.salary,
             de.department_name,
             em.hire_date
      from employees em, departments de
      where em.department_id = de.department_id
      order by hire_date desc) o; -- rownum으로 번호생성
      
select ro.name "이름",
       ro.salary "연봉",
       ro.department_name "부서이름",
       ro.hire_date
from (select rownum rn,
             o.name,
             o.salary,
             o.department_name,
             o.hire_date
      from (select em.first_name || ' ' || em.last_name name,
                   em.salary,
                   de.department_name,
                   em.hire_date
            from employees em, departments de
            where em.department_id = de.department_id
            order by hire_date desc) o
      ) ro
where ro.rn >= 1
and ro.rn <= 2;

--max(hire_date)
select em.first_name || ' ' || em.last_name,
       em.salary,
       de.department_name,
       em.hire_date
from employees em, departments de
where em.department_id = de.department_id
and em.hire_date = (select max(hire_date) --max(hire_date)테이블-컬럼 필요
                    from employees)
order by hire_date desc;


/*문제7.
평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성(last_name)과
업무(job_title), 연봉(salary)을 조회하시오.*/
select max(avg(salary))
from employees
group by department_id; --평균연봉이 가장 높은 부서의 연봉 19333.3333...

select avg(salary),
       department_id
from employees
group by department_id; --부서별 평균연봉

select asal.avs,
       asal.department_id
from (select avg(salary) avs,
             department_id
      from employees
      group by department_id) asal, (select max(avg(salary))mas
                                      from employees
                                      group by department_id) masal
where asal.avs = masal.mas; --부서별 평균연봉이 가장높은(평균최대연봉인) 부서

select em.employee_id "사번",
       em.first_name "이름",
       em.last_name "성",
       em.salary "급여",
       ss.avs,
       jo.job_title
from employees em, (select asal.avs,
                           asal.department_id
                    from (select avg(salary) avs,
                          department_id
                    from employees
                    group by department_id) asal, (select max(avg(salary))mas
                                                   from employees
                                                   group by department_id) masal
                                                   where asal.avs = masal.mas) ss
                    , jobs jo
where em.department_id = ss.department_id
and em.job_id = jo.job_id;
                                                   


/*문제8.
평균 급여(salary)가 가장 높은 부서는?*/
select avg(salary)
from employees
group by department_id; --부서별 평균급여

select max(avg(salary))
from employees
group by department_id; --부서 최대평균급여

select avgs.av
from (select avg(salary) av
      from employees
      group by department_id) avgs, (select max(avg(salary)) ma
                                     from employees
                                     group by department_id) maxs
where avgs.av = maxs.ma; --평균급여가 가장 높은 부서의 급여

select de.department_name
from departments de, (select avgs.av,
                             avgs.department_id
                      from (select avg(salary) av,
                                   department_id
                            from employees
                            group by department_id) avgs, (select max(avg(salary)) ma
                                                           from employees
                                                           group by department_id) maxs
                                                           where avgs.av = maxs.ma) ss
where de.department_id = ss.department_id;


/*문제9.
평균 급여(salary)가 가장 높은 지역은?*/


/*문제10.
평균 급여(salary)가 가장 높은 업무는?*/




