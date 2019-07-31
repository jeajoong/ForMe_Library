-- 도서
DROP TABLE IF EXISTS BOOK RESTRICT;

-- 읽은도서
DROP TABLE IF EXISTS MEB_RBOOK RESTRICT;

-- 회원
DROP TABLE IF EXISTS MEMBER RESTRICT;

-- 도서
CREATE TABLE BOOK (
	book_no     INTEGER     NOT NULL COMMENT '도서번호', -- 도서번호
	book_name   VARCHAR(50) NOT NULL COMMENT '책이름', -- 책이름
	book_author VARCHAR(50) NOT NULL COMMENT '작가이름', -- 작가이름
	book_price  INTEGER     NOT NULL DEFAULT 0 COMMENT '가격' -- 가격
)
COMMENT '도서';

-- 도서
ALTER TABLE BOOK
	ADD CONSTRAINT PK_BOOK -- 도서 기본키
		PRIMARY KEY (
			book_no -- 도서번호
		);

ALTER TABLE BOOK
	MODIFY COLUMN book_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '도서번호';

ALTER TABLE BOOK
	AUTO_INCREMENT = 1;

-- 읽은도서
CREATE TABLE MEB_RBOOK (
	book_no   INTEGER     NOT NULL COMMENT '도서번호', -- 도서번호
	meb_id    VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
	read_date DATE        NOT NULL COMMENT '읽은날짜' -- 읽은날짜
)
COMMENT '읽은도서';

-- 읽은도서
ALTER TABLE MEB_RBOOK
	ADD CONSTRAINT PK_MEB_RBOOK -- 읽은도서 기본키
		PRIMARY KEY (
			book_no, -- 도서번호
			meb_id   -- 아이디
		);

-- 회원
CREATE TABLE MEMBER (
	meb_id VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
	meb_pw VARCHAR(60) NOT NULL COMMENT '비밀번호' -- 비밀번호
)
COMMENT '회원';

-- 회원
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