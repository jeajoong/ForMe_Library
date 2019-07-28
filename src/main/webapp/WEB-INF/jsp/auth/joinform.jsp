<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title> 
</head>
<body>
<!-- 모달창 안나와서 임시 회원가입 페이지 -->
<div class="container">
<h1>회원가입</h1>
<form action='join' method='post'> <!-- 무조건 로그인 및 정보관련데이터는 post -->
  <div class="form-group">
    <label for="id">아이디</label>
    <input type="text" class="form-control" id="id" name="id"
           aria-describedby="idHelp" placeholder="아이디를 입력하세요.">
  </div>
  <div class="form-group">
    <label for="password">비밀번호</label>
    <input type="password" class="form-control" id="pw" name="pw" placeholder="암호를 입력하세요.">
  </div>
    <div class="form-group">
    <label for="password">비밀번호 확인</label>
    <input type="password" class="form-control" placeholder="암호를 다시한번 입력하세요.">
  </div>
  <button class="btn btn-primary">회원으로 등록하기</button>
</form>
</div><!-- 회원가입 될 수 있게 컨트롤러단에서 처리하기. -->

</body>
</html>
