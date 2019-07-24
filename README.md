# 프로젝트 기획안
- 회사다니면서 진행하는 내가읽은책 관리하기위한 1인 프로젝트 기획입니다.


### 1인 웹 프로젝트 준비
프로젝트 이름 : 내가 읽은 책 도서관리
특징 : 페이지는 단 하나
- 진행순서
기본적인 도서 CRUD - 로그인 처리 - HTML에서 동적처리 - 로그인 API 적용(구글만 적용)


## 기본 웹 디자인
페이지 상단부분에 길쭉하게 도서정보 입력 할 수 있는 폼.

selectBox 책 선택해서
날짜 입력 후 등록버튼을 누르면 ajax로 요청해 유저가 읽은 책 리스트를 갱신

다음 폼
내가 읽은 책 리스트 출력.

도서이름/ 작가/ 읽은날짜/ 수정버튼/ 삭제버튼

수정 버튼을 누르면 읽은 날짜가 inputbox로 변환.
도서이름과 작가는 수정할 수 없게.

수정버튼을 누르면 바로 요청보내서 수정된 값 가져와서 출력.
삭제버튼도 동일하게(페이지 새로고침 없이)


## DB
도서정보테이블.
사용자테이블.
사용자_도서정보 테이블(읽은 날짜 정보 포함)

### ..
가능하다면 모든방법으로.
Spring WEB MVC버전으로,
HTTPServlet으로,
스크립트로만 작성
