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