<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta name="mobile-web-app-capable" content="yes" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='<c:url value="resources/css/board-layout.css"/>' rel="stylesheet">
<script src='<c:url value="resources/js/board.js"/>'></script>
<script src='<c:url value="resources/js/auth.js"/>'></script>
<title>Board</title>
</head>
<body>
	<!-- authCheck -->
	<c:if test="${sessionScope.member eq null || sessionScope.member.userId ne BoardModifyView.userId}">
		<script>authCheck();</script>
	</c:if>
	<!-- 상단 Header Bar 영역 -->
	<jsp:include page="../layout/header.jsp"/>
	<!-- 사이트 전체 Container 영역 -->
	<div class="container">
		<!-- 카테고리 -->
		<h3 class="mt-5 pb-2 text-center">게시글 수정</h3>
		<!-- 게시글 수정 부분 -->
		<form action="boardModify" method="POST" onsubmit="return BoardModify()" enctype="multipart/form-data">
			<div style="border: 1px solid #DEE2E6; border-top-style: none;" class="mb-2">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input class="form-control" type="text" id="title" name="title" value='<c:out escapeXml="false" value="${BoardModifyView.title }"/>'></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" id="content" name="content" rows="10"><c:out escapeXml="false" value="${fn:replace(BoardModifyView.content, '<br>', crlf)}"/></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<c:choose>
								<%-- PC인지 Mobile인지 --%>
								<c:when test="${Mobile ne null}">
									<div class="row">
										<i id="MobileCamera" class="fa fa-camera fa-3x ml-3" aria-hidden="true"></i>
										<i id="MobileGallery" class="fa fa-picture-o fa-3x ml-2" aria-hidden="true"></i>
										<input type="hidden" id="file" name="file" value="">
										<input type="hidden" id="imgFile" name="imgFile" value="${BoardModifyView.fileName}">
									</div>
								</c:when>
								<c:otherwise>
									<div class="custom-file mb-2">
										<label class="custom-file-label" for="imgFile">${BoardModifyView.fileName}</label>
										<input type="file" id="imgFile" name="file" class="custom-file-input"/>
									</div>
									<input type="hidden" name="imgFile" value="${BoardModifyView.fileName}" />
								</c:otherwise>
							</c:choose>
							<div class="select_img"><img src='<c:url value="/resources/images/board/${BoardModifyView.fileName}"/>' alt="" class="img-fluid" width="500" height="500" style="display:none;"></div>
						</td>
					</tr>
				</table>
			</div>
			<input type="hidden" id="bno" name="bno"  class="btn btn-primary" value="${BoardModifyView.bno }">
			<input type="hidden" id="userId" name="userId" value="${BoardModifyView.userId }">
			<!-- 버튼 -->
			<div class="d-flex">
				<div class="ml-auto mb-3">
					<input type="submit" class="btn btn-primary" value="수정">
					<button type="button" onClick="boardModifyPrevius()" class="btn btn-primary">취소</button>
				</div>
			</div>
		</form>
	</div>
	
	<!-- img면 show, 다른 파일이거나 없으면 그대로 hide -->
	<c:if test="${BoardModifyView.fileName ne null && fn:contains(BoardModifyView.fileName, 'JPG') || fn:contains(BoardModifyView.fileName, 'PNG') || fn:contains(BoardModifyView.fileName, 'GIF') || fn:contains(BoardModifyView.fileName, 'jpg') || fn:contains(BoardModifyView.fileName, 'png') || fn:contains(BoardModifyView.fileName, 'gif')}">
		<script>$(".select_img img").show();</script>
	</c:if>
	
	<script>
		//Mobile UserAgent Check
		var ua = window.navigator.userAgent.toLowerCase();
		if (ua.indexOf('cordova') > 0) {
			
			var s = document.createElement("script");
			s.type = "text/javascript";
			s.src = "<c:url value='resources/js/mobile/cordova/cordova.js'/>";
			$("head").append(s);
		}
	</script>
	<script src='<c:url value="resources/js/cordova_call_plugin.js"/>'></script>
</body>
</html>