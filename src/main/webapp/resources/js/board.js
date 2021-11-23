/* 게시판 페이징 */
function PageMove(page){
    location.href = "boardList?page=" + page;
}

/* 게시글 등록 유효성 검사 */
function BoardWrite() {
	var Title = $("#title").val();
	var Content = $("#content").val();
	var UserID = $("#userId").val();
	
	if(!Title) {
		alert("제목을 입력해주세요.");
		return false;
	}
	else if(!Content) {
		alert("내용을 입력해주세요.");
		return false;
	}
	else if(!UserID) {
		alert("작성자를 입력해주세요.");
		return false;
	}
}

/* 게시글 수정 유효성 검사 */
function BoardModify() {
	var Title = $("#title").val();
	var Content = $("#content").val();
	var UserID = $("#userId").val();
	
	if(!Title) {
		alert("제목을 입력해주세요.");
		return false;
	}
	else if(!Content) {
		alert("내용을 입력해주세요.");
		return false;
	}
	else if(!UserID) {
		alert("작성자를 입력해주세요.");
		return false;
	}
}

/* 게시글 수정 confirm */
function boardModify() {
	if (confirm("게시글을 수정하시겠습니까?")) {
		var bno = getParameterByName('bno');
		location.href='boardModifyView?bno=' + bno;
	}
}

/* 게시글 삭제 confirm */
function boardDelete(userId) {
	if (confirm("게시글을 삭제하시겠습니까?")) {
	
		var bno = getParameterByName('bno');
		location.href='boardDelete?bno=' + bno + '&userId=' + userId;
	}
}

/* 게시글 등록 취소 previus */
function boardWritePrevius() {
	if (confirm("등록을 취소하시겠습니까?")) {
		location.href='boardList';
	}
}

/* 게시글 수정 취소 previus */
function boardModifyPrevius() {
	if (confirm("수정을 취소하시겠습니까?")) {
		window.history.back();
	}
}

/* View 화면 이미지 클릭 시 원본 크기로 팝업 */
function ImgOri(url, fv){
	var img = new Image();
	img.src = url;
	
	var wWidth = (document.body.offsetWidth / 2) - (img.width / 2);
	var wHeight = (window.screen.height / 2) - (img.height / 2);
	
	var OpenWindow = window.open('', '_blank', 'width=' + img.width + ', height=' + img.height + ', left=' + wWidth + ', top=' + wHeight + ', menubars=no, scrollbars=auto');
	OpenWindow.document.write("<title>" + fv + "</title><style>body{margin:0px;}</style><img src='" + url + "' width='" + (img.width + 25) + "' onClick='javascript:window.close()' title='클릭 시 팝업 닫기' style='cursor:pointer;'>");
}

//jquery 파라미터 값 받아오기
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}