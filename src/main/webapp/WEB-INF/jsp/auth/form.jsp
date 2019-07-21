<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
</head>
<body>

<div class="container">
<h1>로그인</h1>
<form action='login' method='post'>
  <div class="form-group">
    <label for="id">ID</label>
    <input type="text" class="form-control" id="id" name="id"
           value='${cookie.id.value}'
           aria-describedby="emailHelp" placeholder="아이디를 입력하세요.">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="암호를 입력하세요.">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="saveEmail" name="saveEmail">
    <label class="form-check-label" for="saveEmail">아이디 저장</label>
  </div>
  <button class="btn btn-primary">로그인</button>
</form>
</div>

</body>
</html>
