<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>읽은책 관리</title>

<link href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${contextRootPath}/css/library_interior.css?ver=1" rel="stylesheet"/>
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
<link href="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.css" rel="stylesheet"/> 
</head>

<body>

<jsp:include page="../header.jsp"/>

  <div id="roof">
  
  </div>

  <div class="container">

<c:if test="${!empty sessionScope.loginUser}">
<table class="table" id="newBookTable"> <!-- 숨겨져있다가 책추가하기 버튼누르면 스르륵 나타나게 하기 -->
        <thead>
          <tr onclick="javascript:doDisplay();" style="background-color: #F3F3F3;">
            <th class="th-sm" colspan="4">새로운 책 등록 </th>
          </tr>
        </thead>
        <tbody>
        <tr id="addLine" style="display:none;">
        <td>
         <div style="inline;">책 제목 : <input autocomplete=off type="text" id="bookTitle" class="form-control" name="bookTitle"></div>
        </td>
        <td>
               작가 : <input autocomplete=off type="text" id="bookAuthor" class="form-control" name="bookAuthor">
        </td>
        <td>
               가격 : <input autocomplete=off type="number" id="bookPrice" class="form-control" name="bookPrice" 
        value=0 maxlength="7" oninput="numberMaxLength(this);">
        </td>
        <td id="RegiBtnArea">
        <button type="Button" class="btn btn-primary" id="BookRegi">등록하기</button>
        </td>
        </tr>
        </tbody>
</table>
</c:if>


<c:if test="${!empty sessionScope.loginUser}">
<table class="table" id="readAddTable">
        <thead>
          <tr onclick="javascript:doDisplay2();" style="background-color: #F3F3F3;">
            <th class="th-sm" colspan="3">읽은 책 목록에 추가하기</th>
          </tr>
        </thead>
        <tbody>
        <tr id="addLine2" style="display:none;">
        <!-- 검색창으로 바꾸고 추천검색어 뜨게 하기 -->
        <td scope="row" id="selectBookArea">
        <select name='bookCho' class="form-control" id="selectBox">
                 <option value="" disabled selected hidden>책 선택</option>
                  <c:forEach items="${list}" var="all">
                    <option value='${all.bookNo}'>${all.bookName} / ${all.bookAuthor} / ${all.bookPrice} </option>
                  </c:forEach>
        </select>
        </td>
        
        <td scope="row" id="datepick" style="width:420px">
          <div class="md-form">
                       날짜 : <input autocomplete=off class="form-control-sm" type="text" id="datepicker" readonly>
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
</c:if>

<table class="table" id="readListTable"> 
        <thead>
            <tr>
            <th class="th-sm" colspan="5" id="readList">읽은 책 목록</th>   
          </tr>
          <tr>
            <th class="th-sm" id="bookNoTitle" style="width:110px;">책의 번호</th>   
            <th class="th-sm" style="width:330px;">제목</th>
            <th class="th-sm" style="width:215px;">글쓴이</th>
            <th class="th-sm" style="width:220px;">읽은 날짜</th>
            <!-- <th class="th-sm">읽은 날짜</th> -->
            <th class="th-sm" id="manageTitle" style="text-align: left; padding-left: 55px;">관리</th>
          </tr>
        </thead>
        <tbody>
           <c:forEach items="${readBook}" var="readBooks">
            <tr>
              <td scope="row" id="bookNum">${readBooks.bookNo}</td>
              <td scope="row">${readBooks.book.bookName}</td>
              <td scope="row">${readBooks.book.bookAuthor}</td>
              <td scope="row">
              <div id="${readBooks.bookNo}Origin" style="visibility:visible;">${readBooks.readDate}</div>
               
              <div id="${readBooks.bookNo}ModifyDate" style="display:none; width:190px; height:38px; padding:0px;">
                <form action='modify' method='post' style="display:;">
                  <div class="form-group" style="width:120px; height:0px; position:relative; bottom:32px;">
                    <label for="modifyDate"></label>
                    <input type="text" class="form-control" id="${readBooks.bookNo}" name="${readBooks.bookNo}"
                           value='${readBooks.readDate}' style="margin-top:9px;">
                  </div>
                  <div style="position:absolute; margin-left:205px;">
                   <button class="btn btn-warning" style="position:absolute; margin-left: -10px; width: 101px; bottom: -24px;">수정하기</button>
                   <a class="btn btn-secondary" style="position:absolute; margin-left: 95px; width: 70px; bottom: -24px;" onclick="cancel('${readBooks.bookNo}');">취소</a>
                  </div>
                </form>
                </div>
              </td>
              
              <!-- !!! 확인사항. originDate, modifyDate, managebuttons row로 처리하려면
                                               각자의 id값이 중복되면 안됨. 처리할것. -->
              <td scope="row">
                <div id="${readBooks.bookNo}Managebuttons" style="visibility:visible;">
                <!-- 수정 버튼을 누르면 수정,삭제 사라져야 함. -->
                <button type="Button" class="btn btn-primary" id="rev" onclick="revise('${readBooks.bookNo}');">수정</button>
                <button type="Button" class="btn btn-primary" id="del">삭제</button>
                </div>
              </td>
            </tr>
           </c:forEach>
            <c:if test="${empty sessionScope.loginUser}">
            <tr>
              <td scope="row">로그인을 해주세요.</td>
            </tr>
            </c:if>
        </tbody>
</table>


</div>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.min.js"></script>
<script src="${contextRootPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script>
              $(function(){
                  $("dt").click(function(){
                    $(this).toggleClass("open");
                    if($(this).hasClass("open"))
                      $("dt").not(this).removeClass("open");
                  })
                })

              
              function doDisplay(){
                  var con = document.getElementById("addLine");
                  if(con.style.display=='none'){
                      con.style.display = 'block';
                  }else{
                      con.style.display = 'none';
                  }
              }
              
              
              function doDisplay2(){
                var con2 = document.getElementById("addLine2");
                if(con2.style.display=='none'){
                    con2.style.display = 'block';
                }else{
                    con2.style.display = 'none';
                }
            }
              
              function revise(number){
                var action1 = number+'Origin';
                var action2 = number+'Managebuttons';
                var action3 = number+'ModifyDate';
                
                console.log(action1);
                console.log(action2);
                console.log(action3);
               if(document.getElementById(action1).style.visibility =='visible'){
                   document.getElementById(action1).style.display    = 'none';
                   document.getElementById(action2).style.display    = 'none';
                   document.getElementById(action3).style.display    = '';
                }
            }
              
              function cancel(number){
                var action1_1 = number+'Origin';
                var action2_2 = number+'Managebuttons';
                var action3_3 = number+'ModifyDate';
                
               if(document.getElementById(action1_1).style.display   == 'none'){
                  document.getElementById(action1_1).style.display    = '';
                  document.getElementById(action2_2).style.display    = '';
                  document.getElementById(action3_3).style.display    = 'none';
               }
                
              }
                
                
             function numberMaxLength(e){
                  if(e.value.length > e.maxLength){
                      e.value = e.value.slice(0, e.maxLength);
                 }
             }

             
             
             $('#BookRegi').on('click', function() {
                 
                 var NBkTitle = $("#bookTitle").val();
                 var NBkAuthor = $("#bookAuthor").val();
                 var NBkPrice = $("#bookPrice").val();
                 
                 if (NBkTitle == "") {
                   	 swalWithBootstrapButtons.fire({
             	            title: "책 제목을 입력해주세요!",
             	            type: 'info'
             	        }).then((result) => {
             	            if (result.value) {
             	              return false;
             	            }
             	        })
                   	    return false;
                     }
                 if (NBkAuthor == "") {
                     swalWithBootstrapButtons.fire({
                           title: "작가를 입력해주세요!",
                           type: 'info'
                       }).then((result) => {
                           if (result.value) {
                              return false;
                          }
                      })
                        return false;
                     }
                 
                 console.log(NBkTitle);
                 console.log(NBkAuthor);
                 console.log(NBkPrice);
                      $.ajax({
                          type:"POST",
                          url:'library/add',
                          contentType: 'application/json',
                          dataType: "text",
                          data:JSON.stringify({
                           bookName: NBkTitle,
                           bookAuthor: NBkAuthor,
                           bookPrice: NBkPrice
                          }),
                          success : function(data) {
                            console.log(data)
                            if (data == 1) {
                          	  swalWithBootstrapButtons.fire({
                                   title: "책이 추가되었습니다.",
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
                       }
                     })
             
               });
             
             
</script>
</body>
</html>