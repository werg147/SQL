/*단일행 함수*/
select email "eMail",
       INITCAP('the soap'), --첫글자만 대문자로 변경
       department_id
from employees
where department_id = 100;

--문자함수 LOWER(컬럼명) / UPPER(컬럼명)
select first_name,
       lower(first_name), --소문자로 변경
       upper(first_name) --대문자로 변경
from employees
where department_id = 100;

--문자함수 SUBSTR(컬럼명, 시작위치, 글자수)
select first_name,
       substr(first_name, 1, 3), --(앞에서)1부터 3개
       substr(first_name, -3, 2) --(뒤에서)3부터 2개
from employees
where department_id = 100;

--문자함수 LPAd(컬럼명, 자리수, '채울문자') / RPAD(컬렴명, 자리수, '채울문자')
select first_name,
       lpad(first_name, 10, '*'), --왼쪽 공백에 *로 채움
       rpad(first_name, 10, '*') --오른쪽 공백에 *로 채움
from employees;

--문자함수 REPLACE(컬럼명, 문자1, 문자2)
select first_name,
       replace(first_name, 'a', '*'), --문자1을 문자2로 바꿈
       department_id
from employees
where department_id = 100;

--함수 조합
select first_name,
       REPLACE(first_name,'a','*'), --문자 a를 *로 바꿈
       substr(first_name, 2, 3),    --문자 2번째부터 3개까지
       replace(first_name, SUBSTR(first_name,2,4), '***') --문자 2번째부터 4개까지,***로 바꿈
from employees
where department_id = 100;

--숫자함수 ROUND(숫자, 출력을 원하는 자리수)
select round(123.456, 2) r2, --소수점 2번째 자리에서 반올림
       round(123.656, 0) r0, 
       round(123.456, -1) "r-1"
from dual;

select salary,
       round(salary, -3) "sR2"
from employees;

--숫자함수 TRUNC(숫자, 출력을 원하는 자리수)
select trunc(123.456, 2) as r2,
       trunc(123.456, 0) as r0,
       trunc(123.456, -1) as "r-1"
from dual;

--날짜함수 SYSDATE() 현재날짜를 출력
select sysdate
from dual;

select sysdate,
       first_name
from employees;

--날짜함수 MONTH_BETWEEN(d1, d2)
select sysdate,
       hire_date,
       MONTHS_BETWEEN(sysdate, hire_date) as "workMonth",
       trunc(MONTHS_BETWEEN(sysdate, hire_date),0) "workMonth2"
from employees
where department_id = 100;

--날짜함수 LAST_DAY(d1)
select last_day('19/02/06'),
       last_day(sysdate)
from dual;

--변환함수
--TO_CHAR(숫자, '출력모양') 숫자형->문자형으로 변환하기
select first_name,
       salary,
       salary*12,
       to_char(salary*12, '$999,999.00'), --$표시를 붙여서 표시
       to_char(salary*12, '999,999.00'), 
       to_char(salary*12, '999,999'), 
       to_char(salary*12, '099,999'), --빈자리를 0으로 채우기
       to_char(salary*12, '99999') --9의 개수 자리수 만큼 표시(5자리)
from employees
where department_id = 100;

--변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜문자형으로 변환하기
select sysdate,
       to_char(sysdate , 'YYYY') YYYY,
       to_char(sysdate , 'YY') YY,
       to_char(sysdate , 'MM') MM,
       to_char(sysdate , 'MONTH') MONTH,
       to_char(sysdate , 'DD') DD,
       to_char(sysdate , 'DAY') DAY,
       to_char(sysdate , 'HH') HH,
       to_char(sysdate , 'HH24') HH,
       to_char(sysdate , 'MI') MI,
       to_char(sysdate , 'SS') SS
from dual;

--년월일 시분초
select sysdate,
       to_char(sysdate , 'YYYY-MM-DD HH24:MI:SS'),
       to_char(sysdate , 'YYYY"년"MM"월"DD"일"')
from dual;

select first_name,
       hire_date,
       to_char(hire_date , 'YYYY_MM_DD HH24:MI:SS')
from employees;

--일반함수 일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select first_name,
       commission_pct,
       NVL(commission_pct, 0), --null을 0으로 보여준다
       NVL2(commission_pct, 100, 0) --null이 아닐때 100, null이면 0
from employees;

