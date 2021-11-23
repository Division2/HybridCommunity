/* 회원 로그인 */
$(document).ready(function() {
	/* 아이디 & 비밀번호 입력 창에서 엔터 시 로그인 func 호출 */
	$(".text-field").keypress(function (e) {
		if(e.keyCode == 13) {
			Login();
		}
	});
	
	/* 로그인 버튼 클릭 시 로그인 func 호출 */
	$('#btnLogin').click(function() {
		Login();
	});
	
	/* 아이디 찾기 버튼 클릭 시 아이디 찾기 func 호출 */
	$('#btnFindUserID').click(function() {
		findUserID();
	});
	
	/* 비밀번호 찾기 버튼 클릭 시 비밀번호 찾기 func 호출 */
	$('#btnFindPassword').click(function() {
		findPassword();
	});
	
	/* eye 클릭 시 입력한 비밀번호 확인 */
	$('.login-form #eyePass').on('click',function(){
		$('input').toggleClass('active');
		if($('input').hasClass('active')) {
			$(this).attr('class',"fa fa-eye-slash fa-lg").prev('input').attr('type',"text");
		}
		else {
			$(this).attr('class',"fa fa-eye fa-lg").prev('input').attr('type','password');
		}
	});
	
	/* 비밀번호 입력 값 감지해서 eyePass hide & show */
	$("#password").on("propertychange change keyup paste input", function() {
		if ($("#password").val() == "") {
			$("#eyePass").hide();
		}
		else {
			$("#eyePass").show();
		}
	});
});

/* 로그인 AJAX */
function Login() {
	var param = {'userId':$("#userId").val(), 'password': $("#password").val()};

	$.ajax({
		url: "/Login",
		type: "POST",
		data: param,
		success: function(data) {
			if (data.userId == $("#userId").val() && data.password == $("#password").val()) {
				alert("로그인 성공하였습니다.");
				location.href="boardList";
			}
			else {
				alert("아이디 또는 비밀번호가 틀렸습니다.");
			}
		},
		error: function(data) {
			alert("오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
		}
	});
}

/* 아이디 찾기 AJAX */
function findUserID() {
	var param = {'name':$("#ID_UserName").val(), 'phone': $("#ID_UserPhone").val()};

	$.ajax({
		url: "/findUserID",
		type: "POST",
		data: param,
		success: function(data) {
		
		console.log(data);
			if(data != null && data != "") {
				alert('회원 정보와 일치하는 아이디는 ' + data + '입니다.');
			}
			else {
				alert('입력한 정보와 일치하는 회원이 없습니다.');
			}
		},
		error: function(data) {
			alert("오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
		}
	});
}

/* 비밀번호 찾기 AJAX */
function findPassword() {
	var param = {'userId':$("#PW_UserID").val(), 'phone': $("#PW_UserPhone").val()};

	$.ajax({
		url: "/findPassword",
		type: "POST",
		data: param,
		success: function(data) {
			if(data != null && data != "") {
				alert('회원 정보와 일치하는 비밀번호는 ' + data + '입니다.');
			}
			else {
				alert('입력한 정보와 일치하는 회원이 없습니다.');
			}
		},
		error: function(data) {
			alert("오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
		}
	});
}