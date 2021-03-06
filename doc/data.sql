
-- 책 데이터
insert into BOOK(book_name, book_author, book_price)
values('살인 현장은 구름 위', '히가시노 게이고', 13500);
insert into BOOK(book_name, book_author, book_price)
values('시노부 선생님, 안녕!', '히가시노 게이고', 11500);
insert into BOOK(book_name, book_author, book_price)
values('라플라스의 마녀', '히가시노 게이고', 13000);
insert into BOOK(book_name, book_author, book_price)
values('나미야 잡화점의 기적', '히가시노 게이고', 11000);
insert into BOOK(book_name, book_author, book_price)
values('공허한 십자가', '히가시노 게이고', 12500);
insert into BOOK(book_name, book_author, book_price)
values('인어가 잠든 집', '히가시노 게이고', 12500);
insert into BOOK(book_name, book_author, book_price)
values('마력의 태동', '히가시노 게이고', 13500);
insert into BOOK(book_name, book_author, book_price)
values('가면산장 살인사건', '히가시노 게이고', 13500);
insert into BOOK(book_name, book_author, book_price)
values('방과 후', '히가시노 게이고', 13500);
insert into BOOK(book_name, book_author, book_price)
values('오베라는 남자', '프레드릭 배크만', 12500);
insert into BOOK(book_name, book_author, book_price)
values('할머니가 미안하다고 전해달랬어요', '프레드릭 배크만', 12500);
insert into BOOK(book_name, book_author, book_price)
values('브릿마리 여기있다', '프레드릭 배크만', 12500);
insert into BOOK(book_name, book_author, book_price)
values('쇼코의 미소', '최은영', 12500);
insert into BOOK(book_name, book_author, book_price)
values('아가씨와 밤', '기욤 뮈소', 12500);
insert into BOOK(book_name, book_author, book_price)
values('곰탕', '김영탁', 12500);
insert into BOOK(book_name, book_author, book_price)
values('신참자', '히가시노 게이고', 12500);
insert into BOOK(book_name, book_author, book_price)
values("Until you're mine", '사만다 헤이즈', 13500);
insert into BOOK(book_name, book_author, book_price)
values("아름다운 흉기", '히가시노 게이고', 13000);
insert into BOOK(book_name, book_author, book_price)
values("미스터하이든", '사샤아랑고', 13000);
insert into BOOK(book_name, book_author, book_price)
values("어린왕자", '앙투안 드 생텍쥐페리', 10000);
insert into BOOK(book_name, book_author, book_price)
values("연금술사", '파울로 코엘료', 10000);
insert into BOOK(book_name, book_author, book_price)
values("하늘과 바람과 별과 시", '윤동주', 10000);
insert into BOOK(book_name, book_author, book_price)
values("데미안", '헤르만 헤세', 10000);
insert into BOOK(book_name, book_author, book_price)
values("위대한 개츠비", 'F. 스콧 피츠제럴드', 10000);
insert into BOOK(book_name, book_author, book_price)
values("비행운", '김애란', 10000);
insert into BOOK(book_name, book_author, book_price)
values("호밀밭의 파수꾼", '제롬 데이비드 샐린저', 10000);


--유저 데이터
insert into MEMBER(meb_id, meb_pw) values ('test', password('t'));
insert into MEMBER(meb_id, meb_pw) values ('bot1', password('1'));
insert into MEMBER(meb_id, meb_pw) values ('bot2', password('2'));


-- 읽은 책 데이터
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 2, "2019-3-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 3, "2019-4-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 4, "2019-5-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 5, "2019-6-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 6, "2019-1-6");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 8, "2018-3-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 10, "2018-4-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 12, "2018-1-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 11, "2016-7-16");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 13, "2017-7-3");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 14, "2017-7-2");
insert into MEB_RBOOK(meb_id, book_no, read_date) values ('test', 15, "2017-7-1");

insert into calendar(meb_id, id, title, start, end, content, color, textColor, allDay) values(
'test', 1, '회의', '2019-11-11T09:00:00', '2019-11-11T15:00:00', '내용', '#0099cc', '#ccffff', 0);
insert into calendar(meb_id, id, title, start, end, content, color, textColor, allDay) values(
'test', 2, '회의2', '2020-02-11T09:00:00', '2020-02-11T15:00:00', '내용222', '#0099cc', '#ccffff', 0);
insert into calendar(meb_id, id, title, start, end, content, color, textColor, allDay) values(
'test', 3, '회의3', '2020-02-12T09:00:00', '2020-02-12T15:00:00', '내용333', '#0099cc', '#ccffff', 0);
insert into calendar(meb_id, id, title, start, end, content, color, textColor, allDay) values(
'test', 4, '회의4', '2020-03-11T09:00:00', '2020-03-11T15:00:00', '내용444', '#0099cc', '#ccffff', 0);
    
    
    

