select *
from book;

select *
from author;

select *
from user_sequences;

--author 테이블 생성
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--book 테이블 생성
create table book(
    book_id number(5),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint c_book_fk foreign key (author_id)
    references author(author_id)
);

--author 시퀀스 생성
create sequence seq_author_id
increment by 1
start with 1;

--book 시퀀스 생성
create sequence seq_book_id
increment by 1
start with 1;

--author 데이터 insert
insert into author
values (SEQ_AUTHOR_ID.nextval, '이문열', '경북 영양');

insert into author
values (SEQ_AUTHOR_ID.nextval, '박경리', '경상남도 통영');

insert into author
values (SEQ_AUTHOR_ID.nextval, '유시민', '17대 국회의원');

insert into author
values (SEQ_AUTHOR_ID.nextval, '기안84', '기안동에서 산 84년생');

insert into author
values (SEQ_AUTHOR_ID.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values (SEQ_AUTHOR_ID.nextval, '김영하', '알쓸신잡');

--book 데이터 insert
insert into book
values (SEQ_BOOK_ID.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into book
values (SEQ_BOOK_ID.nextval, '삼국지', '민음사', '2002-03-01', 1);

insert into book
values (SEQ_BOOK_ID.nextval, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values (SEQ_BOOK_ID.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values (SEQ_BOOK_ID.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values (SEQ_BOOK_ID.nextval, '순정만화', '재미주의', '2011-08-03', 5);

insert into book
values (SEQ_BOOK_ID.nextval, '오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values (SEQ_BOOK_ID.nextval, '26년', '재미주의', '2012-02-04', 5);

--select문
select bo.book_id,
       bo.title,
       bo.pubs,
       to_char(bo.pub_date, 'YYYY-MM-DD') pub_date,
       au.author_id,
       au.author_name,
       au.author_desc
from book bo, author au
where bo.author_id = au.author_id;

--강풀 author_desc 정보 변경 --> '서울특별시'
update author
set author_desc = '서울특별시'
where author_name = '강풀';

--author 테이블에서 기안84 데이터 삭제
delete from book
where author_id = 4;

delete from author
where author_name = '기안84';
