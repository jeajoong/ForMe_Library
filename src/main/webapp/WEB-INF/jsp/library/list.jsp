<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>읽은책 관리</title>

<link href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${contextRootPath}/css/library_interior.css" rel="stylesheet"/>

<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
<link href="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.css" rel="stylesheet"/> 
</head>

<body>

<jsp:include page="../header.jsp"/>

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
        
        <td scope="row" id="datepick">
          <div class="md-form">
            <input autocomplete=off class="form-control-sm" type="text" id="datepicker" readonly>
              <button type="button" class="btn btn-dark" id="name-clear-btn3">초기화</button>
          </div>
          
          <div style="display: none;">
           <input data-jplist-control="textbox-filter" data-group="group1"
              data-name="my-filter-1" data-path=".Date"
              id="textbox-filter" name="readDate" type="text" value=""
              data-clear-btn-id="name-clear-btn3"/>
          </div>
        
        </td>
        <td>
        <button type="Button" class="btn btn-primary" id="regi">등록하기</button>
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
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.min.js"></script>
<script src="${contextRootPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script>
             $("#datepicker").on("keyup", function() {
                var value = $(this).val().toLowerCase(); 
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
              });
             
             var swalWithBootstrapButtons = Swal.mixin({
                 customClass: {
                   confirmButton: 'btn btn-success btn-sss',
                   cancelButton: 'btn btn-danger btn-fff'
                 },
                 buttonsStyling: false,
               })

               
             $(function() {
             $( "#datepicker" ).datepicker({
                 
                 onSelect: function(value, props) {
                        var tb = document.getElementById('textbox-filter');
                        tb.value = value;
                        let keyupEvent = new Event('keyup');
                        tb.dispatchEvent(keyupEvent);
                      },
                      defaultDate: -1,
                      dateFormat: 'yy-mm-dd',
                      buttonText: "선택",
                      showMonthAfterYear:true,
                      yearSuffix: "년",
                      buttonImageOnly: true,
                      dayNamesMin: ['일','월','화','수','목','금','토'],
                      monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                      buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
              });
             
             $('#name-clear-btn3').click(function() {
                 $('#datepicker').val('');
               });
             
             });
             
             
             $('#regi').on('click', function(){ // 읽은 책 목록으로 요청할때.
            
            var choiceBook = $("#selectBox option:selected").val();
            var inputDate = $("#datepicker").val();
            
            if (choiceBook == "") {
           	 swalWithBootstrapButtons.fire({
     	            title: "책을 선택해주세요!",
     	            type: 'info'
     	        }).then((result) => {
     	            if (result.value) {
     	              return false;
     	            }
     	        })
           	    return false;
             }
            if (inputDate == "") {
              	 swalWithBootstrapButtons.fire({
        	            title: "날짜를 선택해 주세요!",
        	            type: 'info'
        	        }).then((result) => {
        	            if (result.value) {
        	              return false;
        	            }
        	        })
              	    return false;
                }
            
            console.log(choiceBook);
            console.log(inputDate);
            inputDate;
                 $.ajax({
                     type:"POST",
                     url:'library/insert/' + choiceBook,
                     contentType: 'application/json',
                     dataType: "text",
                     data:JSON.stringify({
                    	 readDate: inputDate
                     }),
                     success : function(data) {
                       console.log(data)
                       if (data == 1) {
                     	  swalWithBootstrapButtons.fire({
                              title: "추가완료!",
                              type: 'success'
                          }).then((result) => {
                              if (result.value) {
                                location.href="library";
                                return false;
                              }
                          })
                      }
                       },
                     error : function(data) {
                     	swalWithBootstrapButtons.fire({
                          title: "이미 추가한 책 입니다.",
                          type: 'error'
                      }).then((result) => {
                          if (result.value) {
                            return false;
                          }
                      })
                       }
                     })
             
               });
             
             
</script>
</body>
</html>