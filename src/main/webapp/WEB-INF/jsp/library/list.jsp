<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>읽은책 관리</title>

<link href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${contextRootPath}/css/library_interior.css" rel="stylesheet"/>
</head>
<body>

  <div id="roof">
    <h1 style="text-align:center">도서관리 시스템</h1>
  </div>

  <div class="container">

<table class="table">
        <thead>
          <tr>
            <th class="th-sm">책</th>
            <th class="th-sm">읽은 날짜</th>
            <th class="th-sm">관리</th>
          </tr>
        </thead>
        <tbody>
        <tr>
        
        <td scope="row" id="selectBookArea">
        <select name='bookCho' class="form-control" id="selectBox">
                 <option value="" selected>책 선택</option>
                  <c:forEach items="${list}" var="all">
                    <option value='${all.bookNo}'>${all.bookName} / ${all.bookAuthor} / ${all.bookPrice} </option>
                  </c:forEach>
        </select>
        </td>
        
        </tr>
        </tbody>
</table>

      <table class="table"> <!-- 이 테이블은 로그인 한 유저의 읽은 책 목록을 불러올 것임 임시로 책 목록 출력. -->
        <thead>
          <tr>
            <th class="th-sm">번호</th>   
            <th class="th-sm">제목</th>
            <th class="th-sm">글쓴이</th>
            <th class="th-sm">책 가격</th>
            <!-- <th class="th-sm">읽은 날짜</th> -->
            <th class="th-sm">관리</th>
          </tr>
        </thead>
        <tbody>
           <c:forEach items="${list}" var="all">
            <tr>
              <td scope="row">${all.bookNo}</td>
              <td scope="row">${all.bookName}</td>
              <td scope="row">${all.bookAuthor}</td>
              <td scope="row">${all.bookPrice}</td>
            </tr>
           </c:forEach>
        </tbody>
      </table>


</div>
</body>
</html>