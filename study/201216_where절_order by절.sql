--오라클 주석
/*이것도 주석
주석
*/

select * from employees;

--원하는 컬럼 조회하기
select employee_id, 
       first_name, 
       last_name
from employees;

select employee_id
from employees;

--사원의 이름(first_name)과 전화번호 입사일 연봉을 출력하세요.
select  first_name,
        phone_number,
        hire_date,
        salary
from    employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요.
select  first_name,
        last_name,
        salary,
        phone_number,
        email,
        hire_date
from  employees;

--순서는 마음대로 지정할 수 있음 (위에서부터 차례대로 보여짐) 맨 마지막줄 , 주의
select  hire_date,
        last_name,
        salary,
        phone_number,
        email,
        first_name
from  employees;

/*출력할 때 컬럼에 별명 사용하기*/
select  employee_id as empNo, --정석문법 as 별명
        first_name "f Name", --as 생략가능/ 별명에 대소문자 구분, 공백, 특수문자 등이 필요한 경우 " " (쌍따옴표)
        salary "연 봉"
from  employees;

--사원의 이름(fisrt_name)과 전화번호 입사일 급여 로 표시되도록 출력하세요
select  first_name "이름",
        phone_number "전화번호",
        hire_date "입사일",
        salary "급여"
from  employees;

/*사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요*/
select  first_name 이름,
        last_name 성,
        salary 급여,
        phone_number 전화번호,
        email 이메일,
        hire_date 입사일
from   employees;

/*연결 연산자(Concatenation)로 컬럼들 붙이기*/
select  first_name || last_name
from  employees;

select  first_name || ' ' || last_name as name
from  employees;

select  first_name || 'hire date is' || hire_date
from  employees;

--산술 연산자 사용하기
select  first_name, salary
from  employees;

select  first_name,
        salary,
        salary*12
from  employees;

select  first_name,
        salary,
        salary*12 as 연봉,
        (salary+300)*12
from  employees;

--문자열은 산술연산되지않음
select job_id*12 
from employees;

/*전체직원의 정보를 다음과 같이 출력하세요
      성명(first_name last_name)
      성과 이름사이에 ? 로 구분 ex) William-Gietz
      급여
      연봉(급여*12)
      연봉2(급여*12+5000)
      전화번호
*/
select  first_name || '-' || last_name "성명",
        salary "급여",
        salary*12 "연봉",
        salary*12+5000 "연봉2",
        phone_number "전화번호"
from  employees;

/*select문 > where절*/
select  first_name
from  employees
where  department_id = 10; --부서번호가 10인 사원의 이름을 출력

--연봉이 15000 이상인 사원들의 이름과 연봉을 출력하세요
select  first_name,
        last_name,
        salary*12
from  employees
where  salary >=15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  first_name,
        hire_date
from  employees
where  hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select  salary
from  employees
where  first_name = 'Lex';

--조건이 2개 이상일때 한거번에 조회하기
select first_name,
       salary
from employees
where salary >=14000
and salary <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where salary <= 14000
or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name 이름,
       hire_date 입사일
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--between and 
select first_name 이름,
       salary 연봉
from employees
where salary between 14000 and 17000;

--bitween and 같은 표현
select first_name 이름,
       salary 연봉
from employees
where salary <= 14000
or salary >= 17000;

--in 연산자로 여러 조건을 검사하기
select first_name, last_name, salary
from employees
where first_name in ('Neena');

--in 같은 표현
select first_name, last_name, salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

/*연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오*/
select first_name,
       salary
from employees
where salary in (2100, 3100, 4100, 5100);

--like 연산자
select first_name,
       last_name,
       salary
from employees
where first_name like 'L%';

select first_name,
       last_name,
       salary
from employees
where first_name like '%am%'; --앞뒤로 뭐가 오든 am 포함

select first_name,
       last_name,
       salary
from employees
where first_name like '_a%'; -- _(한칸),두번째에 a, 뒤는 몇글자가 와도 상관없음

select first_name,
       last_name,
       salary
from employees
where first_name like '_a___'; -- _(한칸),두번째에 a, 뒤로 세글자___(세칸)

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '__a_';

--null
--직원테이블에서 급여가 13000~15000인 직원의 이름, 급여, 커미션%, 급여*커미션
select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where salary between 13000 and 15000;

select *
from employees
where commission_pct is null;

select *
from employees
where commission_pct is not null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name,
       salary,
       commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null
and commission_pct is null;

--pk
select email, employee_id
from employees
where employee_id = 110;

/*
select 문
  select절
  from절
  where절
  order by절 -->정렬
*/

select first_name,
       salary
from employees
order by employee_id desc;

select first_name,
       salary
from employees
where salary >= 9000
order by salary asc; --내림차순 desc / 오름차순 asc

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id
       salary,
       first_name
from employees
order by department_id asc;

--급여가 1000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name,
       salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select department_id,
       salary,
       first_name
from employees
where department_id = department_id
order by department_id asc, salary desc;







