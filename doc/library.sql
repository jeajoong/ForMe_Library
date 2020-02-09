/* 으앗 다 까먹었다... cmd로 mysql 접속해서 DB 작업필요할 때.
 db 접속 mysql -u root -p
 비밀번호 입력 후
 사용할 DB 선택.
 * */




-- 도서
DROP TABLE IF EXISTS BOOK RESTRICT;

-- 읽은도서
DROP TABLE IF EXISTS MEB_RBOOK RESTRICT;

-- 회원
DROP TABLE IF EXISTS MEMBER RESTRICT;

-- FullCalendar
DROP TABLE IF EXISTS CAALENDAR RESTRICT;


-- 도서 테이블 생성
CREATE TABLE BOOK (
	book_no     INTEGER     NOT NULL COMMENT '도서번호', -- 도서번호
	book_name   VARCHAR(50) NOT NULL COMMENT '책이름', -- 책이름
	book_author VARCHAR(50) NOT NULL COMMENT '작가이름', -- 작가이름
	book_price  INTEGER     NOT NULL DEFAULT 0 COMMENT '가격' -- 가격
)
COMMENT '도서';

-- 도서 기본키 변경
ALTER TABLE BOOK ADD CONSTRAINT PK_BOOK -- 도서 기본키
		PRIMARY KEY (
		book_no -- 도서번호
		);

-- 책번호 자동증가 설정
ALTER TABLE BOOK
	MODIFY COLUMN book_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '도서번호';

ALTER TABLE BOOK
	AUTO_INCREMENT = 1;

	
	
-- 읽은도서 테이블 생성
CREATE TABLE MEB_RBOOK (
	book_no   INTEGER     NOT NULL COMMENT '도서번호', -- 도서번호
	meb_id    VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
	read_date DATE        NOT NULL COMMENT '읽은날짜' -- 읽은날짜
)
COMMENT '읽은도서';

-- 읽은도서 기본키 지정
ALTER TABLE MEB_RBOOK ADD CONSTRAINT PK_MEB_RBOOK -- 읽은도서 기본키
		PRIMARY KEY (
			book_no, -- 도서번호
			meb_id   -- 아이디
		);

		
		
-- 회원 테이블 생성
CREATE TABLE MEMBER (
	meb_id VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
	meb_pw VARCHAR(60) NOT NULL COMMENT '비밀번호' -- 비밀번호
)
COMMENT '회원';

-- 회원 기본키 지정
ALTER TABLE MEMBER
	ADD CONSTRAINT PK_MEMBER -- 회원 기본키
		PRIMARY KEY (
			meb_id -- 아이디
		);

-- 읽은도서
ALTER TABLE MEB_RBOOK
	ADD CONSTRAINT FK_BOOK_TO_MEB_RBOOK -- 도서 -> 읽은도서
		FOREIGN KEY (
			book_no -- 도서번호
		)
		REFERENCES BOOK ( -- 도서
			book_no -- 도서번호
		);

-- 읽은도서
ALTER TABLE MEB_RBOOK
	ADD CONSTRAINT FK_MEMBER_TO_MEB_RBOOK -- 회원 -> 읽은도서
		FOREIGN KEY (
			meb_id -- 아이디
		)
		REFERENCES MEMBER ( -- 회원
			meb_id -- 아이디
		);
		
		
-- 달력
CREATE TABLE CAALENDAR(
  meb_id  VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
  id         number NOT NULL primary key COMMENT '일정_번호', -- 일정 관련 번호
  title      varchar2(100)  COMMENT '일정_제목',
  start     varchar2(50)    COMMENT '일정_시작일',
  end varchar2(50)         COMMENT '일정_종료일',
  content varchar2(1000) COMMENT '일정_내용',
  color varchar2(10)        COMMENT '일정_색상지정_바탕색상',
  textColor varchar2(10)   COMMENT '일정_색상지정_텍스트색상',
  allDay number              COMMENT '일정_하루종일_판단'
) COMMENT '달력';

-- 달력 키 지정
ALTER TABLE CAALENDAR ADD CONSTRAINT PK_CAALENDAR -- 읽은도서 기본키
    PRIMARY KEY (
      meb_id,   -- 아이디
      id   -- 일정_번호
    );
    
-- 이거 먹힐지 의문
CREATE SEQUENCE cal_seq
    MINVALUE 1
    MAXVALUE 99999
    INCREMENT BY 1
    START WITH 1
    cache 20;
    
-- 달력 외래키
ALTER TABLE CAALENDAR
  ADD CONSTRAINT FK_MEMBER_TO_CAALENDAR -- 회원 -> 달력
    FOREIGN KEY (
      meb_id -- 아이디
    )
    REFERENCES MEMBER ( -- 회원
      meb_id -- 아이디
    );