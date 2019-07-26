<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>

<header>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${contextRootPath}">도서관리시스템</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    </ul>
    
    <div id="bit-login-state">
      <c:if test="${empty loginUser}">
        <a class="btn btn-success btn-sm" href='${contextRootPath}/app/auth/form' >로그인</a> 
        <!-- data-toggle="modal" data-target="#exampleModal" -->
      </c:if>
      <!-- 로그인 버튼을 누르면 모달창이 안나옴...  -->
      
      <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" 
           aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalCenterTitle">로그인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
           </div>
           <div class="modal-body" style="cursor:pointer; overflow-y:scroll; height: 180px; width:500px; word-break:break-all;" >
             
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
                  <input type="checkbox" class="form-check-input" id="saveId" name="saveId">
                  <label class="form-check-label" for="saveEmail">아이디 저장</label>
                </div>
                <button class="btn btn-primary">로그인</button>
             </form>  
             
          </div>
                          
           <div class="modal-footer">
           <div class="modal-footer-inside-control">
              <div class="modal-footer-inside" ></div>
           </div>
           </div>
                </div>
                </div>
            </div>
      
      <c:if test="${not empty loginUser}">
        ${loginUser.id}
        <a class="btn btn-dark btn-sm" href='${contextRootPath}/app/auth/logout'>로그아웃</a> 
      </c:if>
    </div>
    
    <form class="form-inline my-2 my-lg-0">
    </form>
  </div>
</nav>

<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="${contextRootPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script>

</script>
</header>


