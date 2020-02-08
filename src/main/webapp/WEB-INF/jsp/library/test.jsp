<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Test_Area</title>
</head>
<body>
<pre> <!-- 이건 무슨태그? -->
<!-- now변수 value정의 -->
<c:set var ="now" value="<%=new java.util.Date() %>"> </c:set>

<!-- frm:formatDate - 날짜와 시간 표현하는 방식을 정의 -->
\${now} : $ {now}
      <fmt:formatDate value="${now}"></fmt:formatDate>
date :<fmt:formatDate value="${now}" type="date"></fmt:formatDate>
time :<fmt:formatDate value="${now}" type="time"></fmt:formatDate> 
both :<fmt:formatDate value="${now}" type="both"></fmt:formatDate>

pattern = "yyyy년 MM월 dd일 hh시 mm분 ss초":
  <fmt:formatDate value="${now}" 
    pattern="yyyy년 MM월 dd일 hh시 mm분  ss초">
  </fmt:formatDate>
</pre>
</body>
</html>