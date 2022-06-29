<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="../css/member/join.css" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<title>회원가입</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
		
		$(document).ready(function(){

			/***************************************************************** 
			****************** 비밀번호 일치 확인 - keyup() *********************** 
			******************************************************************/
			$("#userPw").keyup(function(){
				$("#pwChkGuide").text("");
			});
			
			$("#userPwChk").keyup(function(){
				if($("#userPw").val() != $("#userPwChk").val()){
					$("#pwChkGuide").text("");
					$("#pwChkGuide").html("<span style='color:red; font-size:small;' id='pwChkGuide' name='pwChkGuide'>* 비밀번호가 일치하지 않습니다.</span>");
				}else{
					$("#pwChkGuide").text("");
					$("#pwChkGuide").html("<span style='color:green; font-size:small;' id='pwChkGuide' name='pwChkGuide'>* 비밀번호가 일치합니다.</span>");
				}//if
			});

			
			
			
			
			/***************************************************************** 
			******************** 핸드폰번호 자동 하이픈 설정 ************************ 
			******************************************************************/
			//참고 https://codepen.io/HAJAE/pen/jdmRLM
			function autoHypenMobile(str){
				str = str.replace(/[^0-9]/g, '');
				var tmp = '';
	            if( str.length < 4){
	                return str;
	            }else if(str.length < 7){
	                tmp += str.substr(0, 3);
	                tmp += '-';
	                tmp += str.substr(3);
	                return tmp;
	            }else if(str.length < 11){
	                tmp += str.substr(0, 3);
	                tmp += '-';
	                tmp += str.substr(3, 3);
	                tmp += '-';
	                tmp += str.substr(6);
	                return tmp;
	            }else{              
	                tmp += str.substr(0, 3);
	                tmp += '-';
	                tmp += str.substr(3, 4);
	                tmp += '-';
	                tmp += str.substr(7);
	                return tmp;
	            }
	            return str;
			}//autoHypenMobile()
			
			var userMobile = document.getElementById('userMobile');
			userMobile.onkeyup = function(event){
			        event = event || window.event;
			        var _val = this.value.trim();
			        this.value = autoHypenMobile(_val) ;
			}
			
			
			
			
			/***************************************************************** 
			**************************** 이메일 확인 **************************** 
			******************************************************************/
			$("#domainList").change(function(){
				$("#domainList option:selected").each(function(){
					if($(this).val() == 1){  //직접입력 선택 시
						$("#email2").val("");
						$("#email2").attr("disabled", false);
					}else {  //직접 입력 아닌 경우     
						$("#email2").val($(this).text());
						$("#email2").attr("disabled", true);
					}//if
				});
			});
			
			 
		});//jQuery
		
		


		
		//회원가입 Btn 클릭 시
		function joinChk(){
			
			/***************************************************************** 
			************************** 유효성 검사 시작 ************************** 
			******************************************************************/
			
			
			///////////////////////
			//        아이디
			///////////////////////
			var idDoubleChkYN = $("#idDoubleChkYN").val();
			if(idDoubleChkYN != 'Y'){
				alert("아이디 중복여부를 확인해 주시기 바랍니다.");
				$("#userId").focus();
				return false;
			}
			
			 
			/////////////////////////////////////////////
			//              아이디 중복체크
			//     중복확인Btn - onclick으로 별도 처리완료
			/////////////////////////////////////////////
			
			
			
			
			///////////////////////
			//        비밀번호
			///////////////////////
			var pwPtn = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~`!@#$%^&*()_\-+={}\[\]\\\|:;"\'<>,.?\/]).{5,10}$/;
			if(pwPtn.test($("#userPw").val()) != true){
				alert("비밀번호는 5~10자리의 영어+숫자+특수문자 조합으로 가능합니다.");
				$("#userPw").focus();
				$("#userPw").val("");
				$("#userPwChk").val("");
				return false;
			}
			
			
			
			////////////////////////////////
			//      비밀번호확인 - 공백체크
			////////////////////////////////
			if(!$("#userPwChk").val()){
				alert("비밀번호 확인을 입력해 주시기 바랍니다.");
				$("#userPwChk").focus();
				return false;
			}
			
			
			
			////////////////////////////////
			//      비밀번호 일치여부
			////////////////////////////////
			if($("#userPw").val() != $("#userPwChk").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPw").focus();
				$("#userPw").val("");
				$("#userPwChk").val("");
				return false;
			}
			
			
			
			///////////////////////
			//        이름
			///////////////////////
			var namePtn = /^[가-힣]{2,}$/;
			if(namePtn.test($("#userNm").val()) != true){
				alert("이름은 한글만 입력가능합니다.");
				$("#userNm").focus();
				$("#userNm").val("");
				return false;
			}
			
			
			
			///////////////////////
			//        휴대폰
			///////////////////////
			var mobilePtn = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if(mobilePtn.test($("#userMobile").val()) != true){
				alert("휴대폰 번호를 형식에 맞게 입력해 주시기 바랍니다.");
				$("#userMobile").focus();
				$("#userMobile").val("");
				return false;
			}
			
			
			
			///////////////////////
			//        이메일
			///////////////////////
			var userEmail = $("#email1").val()+"@"+$("#email2").val();
			$("#userEmail").val(userEmail);
			var emailPtn = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if(emailPtn.test($("#userEmail").val()) != true){
				alert("이메일 형식에 맞게 입력해 주시기 바랍니다.");
				$("#email1").focus();
				$("#userEmail").val("");
				$("#email2").val("");
				return false;
			}
			
			//document.joinForm.submit();
			
		}//joinChk()

		
		
		
		
		//아이디 중복체크
		function idDoubleChk(userId){
			
			$.post(
			"/join/doIdDoubleChk",
			{
				"userId":userId
			},
			function(data){
				$("#idDoubleChkResultFromDB").val(data);
				var idPtn = /^[a-zA-Z0-9]{3,15}$/;

				if(idPtn.test($("#userId").val()) == true){
					if(data == 0 && $("#userId").val() != ""){
						//사용가능한 아이디
						$("#joinTable label:eq(0)").after('<font size="2" color="green">사용가능한 아이디입니다.</font>');
						$("#idDoubleChkYN").val("Y");
					}else if(data != 0 && $("#userId").val() != ""){
						//이미 사용중인 아이디입니다.
						$("#joinTable label:eq(0)").after('<font size="2" color="red">이미 사용중인 아이디입니다.</font>');
						$("#idDoubleChkYN").val("N");
					}
				}else {
					$("#joinTable label:eq(0)").after('<font size="2" color="red">아이디는 영어+숫자 조합 3~15자리까지 가능합니다.</font>');
					$("#idDoubleChkYN").val("N");
				}
			},
			"json"
			);//ajax
			
		}//idDoubleChk()
		
		
		
		function removeIdDoubleChkGuide(){
			$("#joinTable font:eq(0)").remove();
		}
		
		
		
		</script>
	</head>
	<body>
	
		<!-- header 추가 -->
		<div>
			<%@ include file="../common/header.jsp"%>
		</div>
		
		
		<!-- Contents Area 시작 -->
		<div id="joinTitle">회원가입</div>
		<div id="contentsArea">
		
			<div id="joinHeader">
				<div id="tableHeader">회원가입</div>
				
				<div id="required">
					<img alt="필수" src="../img/check_icon.png">&nbsp;
					<label>필수입력</label>
				</div>
				
			</div>
		
			 <form action="/doJoin" method="post" name="joinForm">
				 <div id="joinTable">
				 	<input type="hidden" id="idDoubleChkResultFromDB" name="idDoubleChkResultFromDB">
				 	<input type="hidden" id="idDoubleChkYN" name="idDoubleChkYN">
				 	<input type="hidden" id="userEmail" name="userEmail">
				 	
				 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userId">아이디&nbsp;&nbsp;</label><br>
				 	<input type="text" id="userId" name="userId" placeholder="3~15자리 영어+숫자 조합" onfocusin="removeIdDoubleChkGuide()">
				 	<input type="button" value="중복확인" onclick="idDoubleChk(userId.value)"><br><br>
				 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userPw">비밀번호</label><br>
				 	<input type="password" id="userPw" name="userPw" placeholder="5~10자리 영어+숫자+특수문자 조합"><br><br>
				 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userPwChk">비밀번호확인</label><br>
				 	<input type="password" id="userPwChk">
				 	<span id="pwChkGuide" name="pwChkGuide"></span><br><br>
				 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userNm">이름</label><br>
				 	<input type="text" id="userNm" name="userNm"><br><br>
				 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userMobile">휴대폰</label><br>
				 	<input type="text" id="userMobile" name="userMobile" maxlength="13">&nbsp;<br><br>
				 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="email1">이메일</label><br>
				 	<input type="text" id="email1">&nbsp;@&nbsp;
				 	<input type="text" id="email2" disabled>
				 	<select id="domainList" name="domainList">
				 		<option value="" selected="selected">선택</option>
				 		<option value="naver.com">naver.com</option>
				 		<option value="kakao.com">kakao.com</option>
				 		<option value="daum.net">daum.net</option>
				 		<option value="hanmil.net">hanmil.net</option>
				 		<option value="gmail.com">gmail.com</option>
				 		<option value="1">직접입력</option>
				 	</select><br>
				 </div>
				 
				<div id="reCAPTCHA">
					Google reCAPTCHA
				</div>			 
				 
				 
			
				<div id="joinBtn">
					<input type="button" value="회원가입" onclick="joinChk()" id="submitBtn">
				</div>		
			 </form>
		


		
			<div id="joinFooter">
				<ul id="ulStyle">
					<li><a href="/idFind">아이디찾기</a></li>
					<li>|</li>
					<li>비밀번호찾기</li>
					<li>|</li>
					<li><a href="/login">로그인</a></li>
				</ul>
			</div>
		
		
		
		
		
		
		
		
		
		
		</div>
		
		
		<!-- footer 추가 -->
		<div>
			<%@ include file="../common/footer.jsp"%>
		</div>
		
		
		
	
	</body>
</html>