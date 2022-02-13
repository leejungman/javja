<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="styLesheet" href="css/bootstrap.css">
<title>JSP 회원 가입 화면</title>
</head>
<style>
form {
  width: 600px;
  margin: 20px auto;
  background-color: #eee;
  padding: 10px;
}

div {
  font-size: 15px;
  margin: 5px;
}

input,
select {
  display: inline-block;
  margin-left: 5px;
  padding: 2px;
}

#yy,
#dd {
  width: 60px;
}

.join_btn {
  text-align: center;
}

.join_btn button {
  background-color: #cecece;
}

</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//joinform_check 함수로 유효성 검사
function joinform_check() {
  //변수에 담아주기
  var userID 			= document.getElementById("userID");
  var userPassword 		= document.getElementById("userPassword");
  var userPasswordCheck	= document.getElementById("userPasswordCheck");
  var userName 			= document.getElementById("userName");
  var userPhone 		= document.getElementById("userPhone");
  var userPhone1 		= document.getElementById("userPhone1");
  var userPhone2 		= document.getElementById("userPhone2");
  var userPhone3 		= document.getElementById("userPhone3");
  var userAddress 		= document.getElementById("userAddress");  
  var userEmail 		= document.getElementById("userEmail");
  var userEmail1 		= document.getElementById("userEmail1");
  var userEmail2		= document.getElementById("userEmail2");
  var agree 			= document.getElementById("agree");
  var userZipCode 		= document.getElementById("userZipCode");
  var userAddress 		= document.getElementById("userAddress");
  var userAddress1 		= document.getElementById("userAddress1");
  var userAddress2 		= document.getElementById("userAddress2");
  var isAdmin2			= document.getElementById("isAdmin2");
  var isAdmin1			= document.getElementById("isAdmin1");
  var isAdmin 			= document.getElementById("isAdmin");

  if (userID.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("아이디를 입력하세요.");
    userID.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };
  
 /*  var idCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,10}$/;

  if (!idCheck.test(userID.value)) {
    alert("아이디는 영문자+숫자+특수문자 조합으로 4~10자리 사용해야 합니다.");
    userID.focus();
    return false;
  }; */
	//비밀번호 공백
  if (userPassword.value == "") {
    alert("비밀번호를 입력하세요.");
    userPassword.focus();
    return false;
  };

  //비밀번호 영문자+숫자+특수조합(4~10자리 입력) 정규식
  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,10}$/;

  if (!pwdCheck.test(userPassword.value)) {
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 4~10자리 사용해야 합니다.");
    userPassword.focus();
    return false;
  };
  //비밀번호 일치 여부
  if(userPassword.value != userPasswordCheck.value){
  	  alert("패스워드가 일치 하지 않습니다.");
		userPasswordCheck.focus();
	    return false;
	  };
  
  
	//이름 공백
  if (userName.value == "") {
    alert("이름을 입력하세요.");
    userName.focus();
    return false;
  };

  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
  
  if(userPhone2.value === '' || userPhone3.value === '') {
 	alert("전화번호를 입력해주세요.");
	userPhone2.focus();
	return false;
  }
  
  // 전화번호 오류체크
  if (isNaN(userPhone2.value) || isNaN(userPhone3.value)) {
    alert("전화번호는 숫자만 입력할 수 있습니다.");
    userPhone2.focus();
    return false;
  }
  else {
	  userPhone.value = userPhone1.options[userPhone1.selectedIndex].text + '-' + userPhone2.value + '-' + userPhone3.value
  }
	//이메일주소 공백
  if (userEmail1.value == "" || userEmail2.value == "" ) {
    alert("이메일 주소를 입력하세요.");
    userEmail.focus();
    return false;
  }	
	
  // 우편번호
  if (userZipCode.value == "") {
	    alert("우편번호를 입력하세요.");
	    userZipCode.focus();
	    return false;	    
  }
  
  // 기본주소
  if (userAddress1.value == "") {
	    alert("기본주소를 입력하세요.");
	    userAddress1.focus();
	    return false;	    
  }
  
  // 상세주소
  if (userAddress2.value == "") {
	    alert("상세주소를 입력하세요.");
	    userAddress2.focus();
	    return false;	    
  }
  // 계정 선택
  if (isAdmin2.value == "" ) {
	    alert("계정 을 입력하세요.");
	    isAdmin2.focus();
	    return false;
	  }	else {
		  isAdmin2.value =  isAdmin1.options[isAdmin1.selectedIndex].text
	  } 

	isAdmin.value =  isAdmin1.options[isAdmin1.selectedIndex].text;
	
  //이메일 합친 값
  userEmail.value 	= userEmail1.value + "@" + userEmail2.value;
  //주소 합친 값
  userAddress.value = userAddress1.value + " " + userAddress2.value;
  
  //입력 값 전송
  document.loginfrom.submit(); //유효성 검사의 포인트   
}
// 아이디 체크창 ,jquery
function id_check(){
	$('#modal .modal-title').html('아이디 체크');
	$('#modal .modal-body').html('<form style="background-color:white;width:300px;" name ="checkform" action="idCheckAction.jsp"><input type ="text" name="userID" value= ""/><input type="submit" id="idCheck" value ="검색"/></form>');
	$('#modal').modal("show");
}
  // 비밀번호 도움말 ,jquery
function pw_help() {
	$('#modal .modal-title').html('비밀번호 도움말');
	$('#modal .modal-body').html('<h3>"비밀번호는 영문자+숫자+특수문자 조합으로 4~10자리 사용해야 합니다."</h3>');
	$('#modal').modal("show");
}
// 이메일 셀렉트박스 이벤트
function emailChange() {
	var userEmail2 		= document.getElementById("userEmail2");
	var userEmail3 		= document.getElementById("userEmail3");
	userEmail2.value 	= userEmail3.options[userEmail3.selectedIndex].value;
}
// 계정 셀렉트 박스 이벤트
function adminChoice(){
	var isAdmin1 	= document.getElementById("isAdmin1");
	var isAdmin2	= document.getElementById("isAdmin2");
	isAdmin2.value 	= isAdmin1.options[isAdmin1.selectedIndex].value;
	
}
// 계정 셀렉트 박스 값 가져오기











// 주소찾기 버튼 api 불러오기
function findAddress() {
	new daum.Postcode({
	    oncomplete: function(data) {
	    	var userZipCode 	= document.getElementById("userZipCode");
	    	var userAddress1 	= document.getElementById("userAddress1");
	    	userZipCode.value 	= data.zonecode;
	    	userAddress1.value 	= data.address;	        
	    }
	}).open();
}


</script>
</head>
<body>
	<nav class="navbar navbar-defult">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"> 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="login.jsp">로그인</a></li>
				<li class="active"><a href="join.jsp">회원 가입</a></li>
				
			</ul>
			<!-- <ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원 가입</a></li>
					</ul></li>
					
					
			</ul> -->
		</div>
	</nav>
	
<form name="loginfrom" action="joinAction.jsp" method="post">
  	<div>
 			<h3 style="text-align: center;">"회원가입"</h3>
					<div class="form-group">
					<h5>아이디</h5>
						<input type="text" class="" placeholder="아이디"
							name="userID" maxlength="20" id="userID" value="a">
							<button type="button" onclick="id_check();">중복확인</button>
					</div>
					<div class="form-group">
					<h5>비밀번호</h5>
						<input type="password" class="" placeholder="비밀번호"
							name="userPassword" maxlength="20" id="userPassword" value="dpdltm118!">
							<button type="button" onclick="pw_help();">비밀번호도움말</button>
					</div>
					<h5>비밀번호 재입력</h5>
					<div class="form-group">
						<input type="password" class="" placeholder="비밀번호체크"
							name="userPasswordCheck" maxlength="20" id="userPasswordCheck" value="dpdltm118!">
					</div>
					<div class="form-group">
					<h5>이름</h5>
						<input type="text" class="" placeholder="이름"
							name="userName" maxlength="20" id="userName" value="aa">
					</div>
					
					<div class="form-group">
					<h5>이메일</h5>
						<input type="text" class="" placeholder="이메일"
							 maxlength="20" id="userEmail1" value="aa"> @
						<input type="text" id="userEmail2"value="aa">
						<select id = "userEmail3" onchange="emailChange()">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>	
						<input type="hidden" name="userEmail" id="userEmail">
					</div>
					<div class="form-group">
					<h5>전화번호</h5>
						<select id="userPhone1">
							<option value="022">022</option>
							<option value="010">010</option>
							<option value="02">02</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>&nbsp;&nbsp;&nbsp;-&nbsp;
						<input type="text" class="" placeholder="전화앞자리"
							maxlength="4" id="userPhone2"value="1111">&nbsp;&nbsp;&nbsp;-&nbsp;
						<input type="text" class="" placeholder="전화뒷자리"
							maxlength="4" id="userPhone3" value="1111">
						<input type="hidden" name="userPhone" id="userPhone">
							
					</div>
					<div class="form-group">
					<h5>주소</h5>
					<button type="button" onclick="findAddress()">주소찾기</button>
						<input type="text" class="" placeholder="우편번호"
							name="userZipCode" size="5" maxlength="6" id="userZipCode">
						<input type="text" class="" placeholder="기본주소"
							maxlength="100" id="userAddress1">
						<input type="text" class="" placeholder="상세주소"
							maxlength="100" id="userAddress2">
						<input type="hidden" name="userAddress" id="userAddress">
					</div>
					<div class="form-group">
					<h5>계정 선택</h5>
						<select id="isAdmin1" name="isAdmin1" onchange="adminChoice()">
							<option value="">선택해주세요</option>
							<option value="관리자">0</option>
							<option value="사용자">1</option>
						</select>
					<input type="text" class="" placeholder=""
					 id="isAdmin2" name="isAdmin2" value=""> "0번은 관리자, 1번은 사용자 "
					 <input type="hidden" name="isAdmin" id="isAdmin">
					</div>				
					
		</div>
  <div class="join_btn">
    <input type="button" value="취소" onClick="self.location='login.jsp';"class="btn btn-primary pull-right">
    <!-- (window삭제).history.back 뒤로가기/history.forward 앞으로가기-->
    <button type="button" onclick="joinform_check();" class="btn btn-primary pull-right">가입하기</button>
    <!-- 입력된 경우에 따라서 다르게 액션되면 button으로, 입력 값 상관 없이 무조건 보내기면 submit -->
    <!-- type을 submit으로 하여 전송하기를 하지말고, script가서 함수를 만들고 전송하기를 함 button onclick으로 함수를 불러옴 함수안에 문제가 있는 경우 return false;-->
  </div>
</form>

<!-- 모달창 -->
<div class="modal fade" id="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script src="js/bootstrap.js"></script>
		<footer>
	<div class="footer_container">
		<div class="footA"></div>
		<div class="footB">Copyright © jm's All Rights Reserved.</div>
	</div>
	</footer>
</body>
</html>