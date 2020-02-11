<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,java.net.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextRootPath}/lib/jquery-ui.css" rel="stylesheet">
<link href="${contextRootPath}/lib/bootstrap.min.css" rel="stylesheet">

<link href='${contextRootPath}/lib/fullcalendar_4.3.1/core/main.css'     rel='stylesheet' />
<link href='${contextRootPath}/lib/fullcalendar_4.3.1/daygrid/main.css'  rel='stylesheet' />
<link href='${contextRootPath}/lib/fullcalendar_4.3.1/timegrid/main.css' rel='stylesheet' />

<style type="text/css">
  body {
    margin: 0px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  input-group-text{width:35%;} 
  input-group-prepend{width:100%;}
  
</style>
<script src="${contextRootPath}/lib/jquery.min.js"></script>
<script src="${contextRootPath}/lib/popper.min.js"></script>
<script src="${contextRootPath}/lib/bootstrap.min.js"></script>
<script src="${contextRootPath}/lib/jquery-ui.js"></script>

<script src='${contextRootPath}/lib/fullcalendar_4.3.1/core/main.js'></script>
<script src='${contextRootPath}/lib/fullcalendar_4.3.1/interaction/main.js'></script>
<script src='${contextRootPath}/lib/fullcalendar_4.3.1/daygrid/main.js'></script>
<script src='${contextRootPath}/lib/fullcalendar_4.3.1/timegrid/main.js'></script>

<script type="text/javascript">
	var calendar ={};
	$(document).ready(function(){
	    var calendarEl = document.getElementById('calendar');
	    calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      defaultDate: new Date().toISOString(),
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      select: function(arg) {
	    	  $("#dialog [name=start]").val(arg.start.toISOString());
	    	  // 하루일 경우에 마지막 날짜 정보가 들어 가지 않기 때문에 시작 정보를 넣는다.
	    	  var end = arg.end!=null?arg.end.toISOString():arg.start.toISOString();
	    	  $("#dialog [name=end]").val(end);	
	    	  $("#dialog [name=allDay]").val(arg.allDay?"true":"false");	
	    	  $("#dialog").dialog("open");
	          calendar.unselect()
	      },
	      // 있는 일정을 클릭시
	      eventClick:function(info){
	    	  //alert("클릭시:"+info.event.title);
	    	  detail(info.event);	 	
	      },
	      // 드래그해서 드락되었을 때..
	      eventDrop:function(info){
	    	  //alert("드랍시:"+info.event.title);
	    	  detail2(info.event);	
	      },
	      // 시간을 resize로 변경했을 때,
	      eventResize:function(info){
	    	  //alert("일정resize:"+info.event.title);
	    	  detail2(info.event);	
	      },
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: function(info, successCallback, failureCallback){
	    	  // ajax를 통해서, 데이터 로딩 처리..
	    	$.ajax({
				type:"post",
				url:"${path}/library?method=list",
				dataType:"json",
				success:function(data){
					// data.모델명
					// alert(data.list.length+":"+data.list[0].title);
					successCallback(data.list);
				},
				error:function(err){
					console.log("##에러 발생##");
					console.log(err);
				}
	    	});
	      }
	    });

	    calendar.render();

	    $("#dialog").dialog({
	    	autoOpen:false,
	    	width: "25%",
	    	buttons:{
	    		"등록":function(){
	    			 
	    			if($("[name=title]").val()){
	    				ajaxFun("insertAjax");
	    			}
	    			// 1. 화면에서 등록된 처리..
	    	        $("#dialog").dialog("close");
	    	        /*
	    	        $("#inputFrm").serialize() 
	    	        id값이 inputFrm이라는 form 하위에 있는  name과 value값이
	    	        key=value 형식의 query string으로 서버의 요청값으로 전달되기
	    	              위해서 자동으로 만들어 준다.
	    	        */
	    			//alert( $("#inputFrm").serialize() );
	    	        // 2. DB 등록 처리(ajax)
	    			// 3. 초기화 처리

	    		},    
	    		"수정":function(){
	    			if(confirm("수정하시겠습니까?")){
	    				ajaxFun("updateAjax");	
	    			}
	    			
	    		},
	    		"삭제":function(){
	    			if(confirm("삭제하시겠습니까?")){
	    				ajaxFun("deleteAjax");	
	    				$("#dialog").dialog("close");
	    			}
	    		}
	    		
	    	},
	    	modal:true,
	    	close:function(){
	    		// 모든 창을 닫을 때, 초기화 처리..
    			$("[name=title]").val("");
    			$("[name=content]").val("");
    			$("[name=color]").val("#0099cc");
    			$("[name=textColor]").val("#ccffff");	    		
	    	}
	    });		
		
		
	});
	function detail(event){
		formLoad(event);
		$("#dialog").dialog("open");
	}
	function detail2(event){
		formLoad(event);
		ajaxFun("updateAjax");
	}	
	function formLoad(event){
		$("[name=id]").val(event.id);
		$("[name=title]").val(event.title);
		$("[name=start]").val(event.start.toISOString());
		// 데이터값 없는 경우가 시작일로 설정되어 있는 경우일다.
	    // 이때는 시작일로 설정해준다.
		var end = event.end!=null?event.end.toISOString():event.start.toISOString();
		$("[name=end]").val(end);
		var exEvent = event.extendedProps;
		$("[name=content]").val(exEvent.content);
		// 배경색상은 내부적으로 속성값을 backgroundColor로 가지고 있다.
		$("[name=color]").val(event.backgroundColor);
		$("[name=textColor]").val(event.textColor);
		// event.allDay은 boolean 인데, 데이터는 문자열로 설정되어 있어서,
		//  형변환을 해준다.
		$("[name=allDay]").val(""+event.allDay);
		
	}
	function ajaxFun(proc){
		// insertAjax  updateAjax deleteAjax
		var msg="일정 변경 성공";
		if(proc=="insertAjax") msg="등록 성공";
		if(proc=="deleteAjax") msg="삭제 성공";
    	$.ajax({
			type:"post",
			url:"${path}/library?method="+proc,
			dataType:"json",
			data:$("#inputFrm").serialize(),
			success:function(data){
				alert(msg);
				calendar.refetchEvents();
			},
			error:function(err){
				console.log("##에러 발생##");
				console.log(err);
			}
    	});		
	}
</script>
</head>
<body>
<div id="calendar"></div> 
<div id="dialog" title="일정">
	<div  class="input-group mb-3">
	<form id="inputFrm">
		<input name="id" type="hidden" value="0"/> <!-- calendar의 key -->
		<input name="title"   class="form-control"  placeholder="제목을 입력" />
		<textarea name="content" rows="5" cols="20"  class="form-control"
			placeholder="내용 입력"></textarea>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
			<span class="input-group-text">시작일</span></div>
		     <input name="start"   class="form-control"  readonly /></div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
			<span class="input-group-text">마지막일</span></div>
		     <input name="end"   class="form-control"  readonly /></div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
			<span class="input-group-text">글자색상</span></div>
		     <input name="textColor" type="color" value="#ccffff"  class="form-control"  /></div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
			<span class="input-group-text">배경색상</span></div>
		     <input name="color" type="color" value="#0099cc"  class="form-control"  /></div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
			<span class="input-group-text">종일여부</span></div>
			 <select name="allDay" class="form-control"  >
			 	<option value="true"> 종 일 </option>
			 	<option value="false"> 시 간 </option>
			 </select></div>
		</form>		 
	</div>
</div>	

</body>
</html>