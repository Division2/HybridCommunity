<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href='<c:url value="resources/css/board-layout.css"/>' rel="stylesheet">
<script src='<c:url value="resources/js/board.js"/>'></script>
<script src='<c:url value="resources/js/auth.js"/>'></script>
<title>Board</title>
</head>
<body>
	<!-- authCheck -->
	<c:if test="${sessionScope.member eq null }">
		<script>authCheck();</script>
	</c:if>
	<!-- 상단 Header Bar 영역 -->
	<jsp:include page="../layout/header.jsp"/>
	<!-- 사이트 전체 Container 영역 -->
	<div class="container">
		<!-- 카테고리 -->
		<h3 class="mt-5 pb-2 text-center">게시글 조회</h3>
		<fmt:formatDate value="${BoardView.regDate}" var="regDate" pattern="yyyy-MM-dd HH:mm"/>
		<!-- 게시글 조회 출력 -->
		<div style="border: 1px solid #DEE2E6; border-top-style: none;" class="mb-2">
			<table class="table">
				<tr>
					<th>제목</th>
					<td colspan="3"><c:out escapeXml="false" value="${BoardView.title }"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${BoardView.userId }</td>
					<th>작성일자</th>
					<td>${regDate }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><c:out escapeXml="false" value="${fn:replace(BoardView.content, crlf, '<br>')}"/></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<c:if test="${BoardView.fileName ne null}">
							<c:choose>
								<c:when test = "${fn:contains(BoardView.fileName, 'JPG') || fn:contains(BoardView.fileName, 'PNG') || fn:contains(BoardView.fileName, 'GIF')
												|| fn:contains(BoardView.fileName, 'jpg') || fn:contains(BoardView.fileName, 'png') || fn:contains(BoardView.fileName, 'gif')}">
									<img src='<c:url value="/resources/images/board/${BoardView.fileName}"/>' alt="" class="img-fluid" width="500" height="500" onClick="ImgOri(this.src, '${BoardView.fileName}')" title="클릭 시 원본 크기" style="cursor: pointer;">
								</c:when>
								<c:otherwise>
									<a href='<c:url value="/resources/images/board/${BoardView.fileName}"/>'>${BoardView.fileName}</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<!-- 버튼 -->
		<div class="d-flex">
			<div class="ml-auto mb-3">
				<c:if test="${sessionScope.member.userId eq BoardView.userId}">
					<button type="button" onClick="boardModify()" class="btn btn-primary">수정</button>
					<button type="button" onClick="boardDelete(${BoardView.userId})" class="btn btn-primary">삭제</button>
				</c:if>
				<button type="button" onClick="location.href='boardList'" class="btn btn-primary">목록</button>
			</div>
		</div>
	</div>
</body>
</html>