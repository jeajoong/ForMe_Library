<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>

<body>
<header>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${contextRootPath}/app/library">도서관리시스템</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" 
  data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
  aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    </ul>
    
    
    <div id="bit-join-state">
      <c:if test="${empty loginUser}">
        <button type="button" class="btn btn-success btn-sm" 
        data-toggle="modal" data-target="#Modal_1">회원가입</button> 
      </c:if>
    </div>
    
    
    <div id="bit-login-state">
      <c:if test="${empty loginUser}">
        <button type="button" class="btn btn-success btn-sm" 
        data-toggle="modal" data-target="#Modal_2">로그인</button> 
      </c:if>
      

      <!-- 회원가입 Modal -->
<div class="modal fade" id="Modal_1" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLabel">
         간편 회원가입</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <!--  -->
            <div class="form-group">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="newId" name="newId"
                     aria-describedby="idHelp" placeholder="아이디를 입력하세요.">
            </div>
            <div class="form-group">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" id="newPw" name="newPw" placeholder="암호를 입력하세요.">
            </div>
              <div class="form-group">
              <label for="password">비밀번호 확인</label>
              <input type="password" class="form-control" placeholder="암호를 다시한번 입력하세요.">
            </div>
            
      <!--  -->
      
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="join">회원으로 등록하기</button>
      </div>
    </div>
  </div>
</div>
      
      
      
      <!-- 로그인 Modal -->
<div class="modal fade" id="Modal_2" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLabel">
         로그인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <!--  -->
            <div class="form-group">
              <label for="id">ID</label>
              <input type="text" class="form-control" id="id" name="id"
                     value='${cookie.id.value}'
                     aria-describedby="idHelp" placeholder="아이디를 입력하세요.">
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="pw" name="pw" placeholder="암호를 입력하세요.">
            </div>
            <div class="form-group form-check">
              <input type="checkbox" class="form-check-input" id="saveId" name="saveId">
              <label class="form-check-label" for="saveId">아이디 저장</label>
            </div>
            
      <!--  -->
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="login">로그인</button>
      </div>
    </div>
  </div>
</div>
      
      
      <c:if test="${not empty loginUser}">
        ${loginUser.id}
        <a class="btn btn-dark btn-sm" href='${contextRootPath}/app/auth/logout'>로그아웃</a> 
      </c:if>
    </div>
  </div>
</nav>

<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="${contextRootPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script>

    $('#join').on('click', function(){ // 회원가입 요청 버튼 누를 때.
        
        var inputId = $("#newId").val();
        var inputPw = $("#newPw").val();
        
        console.log(inputId);
        console.log(inputPw);
        
        if (inputId == "") {
       	 swalWithBootstrapButtons.fire({
    	            title: "아이디를 입력해주세요!",
    	            type: 'info'
    	        }).then((result) => {
    	            if (result.value) {
    	              return false;
    	            }
    	        })
       	    return false;
         }
        if (inputPw == "") {
          	 swalWithBootstrapButtons.fire({
    	            title: "비밀번호를 입력해주세요!",
    	            type: 'info'
    	        }).then((result) => {
    	            if (result.value) {
    	              return false;
    	            }
    	        })
          	    return false;
            }
        
             $.ajax({
                 type:"POST",
                 url:'auth/join/'+ inputId,
                 contentType: 'application/json',
                 dataType: "text",
                 data:JSON.stringify({
                	 pw: inputPw
                 }),
                 success : function(data) {
                   console.log(data)
                   if (data == 1) {
                 	  swalWithBootstrapButtons.fire({
                          title: "등록완료!",
                          type: 'success'
                      }).then((result) => {
                          if (result.value) {
                            location.href="library";
                            return false;
                          }
                      })
                  }
                   }
                 })
         
           });


    $('#login').on('click', function(){ // 로그인 버튼 누를 때.
        
        var inId = $("#id").val();
        var inPw = $("#pw").val();
        var saveinId= $("#saveId").val();
        
        console.log(inId);
        console.log(inPw);
        
        if (inId == "") {
       	 swalWithBootstrapButtons.fire({
    	            title: "아이디를 입력해주세요!",
    	            type: 'info'
    	        }).then((result) => {
    	            if (result.value) {
    	              return false;
    	            }
    	        })
       	    return false;
         }
        if (inPw == "") {
          	 swalWithBootstrapButtons.fire({
    	            title: "비밀번호를 입력해주세요!",
    	            type: 'info'
    	        }).then((result) => {
    	            if (result.value) {
    	              return false;
    	            }
    	        })
          	    return false;
            }
        
             $.ajax({
                 type:"POST",
                 url:'auth/login/'+ inId,
                 contentType: 'application/json',
                 dataType: "text",
                 data:JSON.stringify({
                	 pw: inPw,
                	 saveId: saveinId
                 }),
                 success : function(data) {
                   console.log(data)
                   if (data == 1) {
                 	  swalWithBootstrapButtons.fire({
                          title: "로그인 성공!",
                          type: 'success'
                      }).then((result) => {
                          if (result.value) {
                            location.href="library";
                            return false;
                          }
                      })
                  }
                   }
                 })
         
           });
    
    
    
    
</script>
</header>

</body>
