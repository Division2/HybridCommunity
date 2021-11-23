/* Auth Check */
function authCheck() {
	alert("접근 가능한 권한이 아닙니다.");
	location.href="boardList";
}

/* Login Check */
function LoginCheck() {
	alert("로그인 되어있지 않습니다.");
	location.href="/";
}