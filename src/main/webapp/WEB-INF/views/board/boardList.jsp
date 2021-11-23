<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<%
	//현재시간 구해서 String으로 formating
	LocalDateTime nowTime = LocalDateTime.now();
	
	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	String now = nowTime.format(dateTimeFormatter);
	String searchDate = request.getParameter("searchDate");
%>
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
	<!-- LoginCheck -->
	<c:if test="${sessionScope.member eq null }">
		<script>LoginCheck();</script>
	</c:if>
	<!-- 상단 Header Bar 영역 -->
	<jsp:include page="../layout/header.jsp"/>
	<!-- 사이트 전체 Container 영역 -->
	<div class="container">
		<!-- 카테고리 -->
		<h3 class="mt-5 pb-2 text-center">게시글 목록</h3>
		<!-- 게시글 검색 -->
		<div class="row">
			<div class="ml-auto">
				<form action="boardSearchList" method="GET" class="form-inline">
					<div class="col-xs-4">
						<input type="text" class="form-control mb-2" id="keyword" name="keyword" value="${param.keyword }" placeholder="&#xF002; 검색어를 입력하세요">
					</div>
					<div class="col-xs-4">
						<input type="date" class="form-control mb-2 mr-1 ml-1" value='<c:choose><c:when test="${param.searchDate eq null }"><%=now %></c:when><c:otherwise><%=searchDate %></c:otherwise></c:choose>' id="searchDate" name="searchDate" max="<%=now %>">
					</div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary mb-2 mr-3">검색</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 게시글 출력 mouse hover table-hover 사용 가능-->
		<div style="border: 1px solid #DEE2E6; border-top: 0.5px solid #585858;" class="mb-2">
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="20%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${BoardList }" var="Board" varStatus="status">
						<fmt:formatDate value="${Board.regDate}" var="regDate" pattern="yyyy-MM-dd"/>
						<tr id="trh" class="text-center" onClick="location.href='boardView?bno=${Board.bno }'" style="cursor:pointer;">
							<td>${(Paging.totalCount - status.index) - ((Paging.pageNo - 1 ) * 10)}</td>
							<td style="text-align:left;">${Board.title }</td>
							<td>${Board.userId }</td>
							<td>${regDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 버튼 -->
		<div class="d-flex">
			<div class="ml-auto">
				<c:if test="${sessionScope.member ne null }">
					<button type="button" onClick="location.href='boardWriteView'" class="btn btn-primary">등록</button>
				</c:if>
			</div>
		</div>
		<!-- 게시글 페이징 처리(기준 10개) -->
		<nav aria-label="Page navigation">
			<c:choose>
				<c:when test="${BoardSearchList.keyword ne null || BoardSearchList.searchDate ne null}">
					<ul class="pagination justify-content-center">
						<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
						<c:choose>
							<c:when test="${Paging.pageNo eq Paging.firstPageNo || Paging.prevPageNo eq 0}">
								<li class="page-item disabled">
									<a class="page-link" href="boardSearchList?keyword=${param.keyword }&searchDate=${param.searchDate }&page=${Paging.prevPageNo}"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="boardSearchList?keyword=${param.keyword }&searchDate=${param.searchDate }&page=${Paging.prevPageNo}"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- 페이지 갯수만큼 버튼 생성 -->
						<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
							<c:choose>
								<c:when test="${i eq Paging.pageNo || i eq 0}">
									<li class="page-item disabled">
										<a class="page-link" href="boardSearchList?keyword=${param.keyword }&searchDate=${param.searchDate }&page=${i}"><c:out value="${i }"/></a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="boardSearchList?keyword=${param.keyword }&searchDate=${param.searchDate }&page=${i}"><c:out value="${i }"/></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
						<c:choose>
							<c:when test="${Paging.pageNo eq Paging.finalPageNo || Paging.nextPageNo eq 0}">
								<li class="page-item disabled">
									<a class="page-link" href="boardSearchList?keyword=${param.keyword }&searchDate=${param.searchDate }&page=${Paging.nextPageNo}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="boardSearchList?keyword=${param.keyword }&searchDate=${param.searchDate }&page=${Paging.nextPageNo}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="pagination justify-content-center">
						<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
						<c:choose>
							<c:when test="${Paging.pageNo eq Paging.firstPageNo || Paging.prevPageNo eq 0}">
								<li class="page-item disabled">
									<a class="page-link" href="javascript:PageMove(${Paging.prevPageNo})"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="javascript:PageMove(${Paging.prevPageNo})"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- 페이지 갯수만큼 버튼 생성 -->
						<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
							<c:choose>
								<c:when test="${i eq Paging.pageNo || i eq 0}">
									<li class="page-item disabled">
										<a class="page-link" href="javascript:PageMove(${i})"><c:out value="${i }"/></a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="javascript:PageMove(${i})"><c:out value="${i }"/></a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
						<c:choose>
							<c:when test="${Paging.pageNo eq Paging.finalPageNo || Paging.nextPageNo eq 0}">
								<li class="page-item disabled">
									<a class="page-link" href="javascript:PageMove(${Paging.nextPageNo})"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="javascript:PageMove(${Paging.nextPageNo})"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
	<script>
		//Mobile UserAgent Check
		var ua = window.navigator.userAgent.toLowerCase();
		if (ua.indexOf('cordova') > 0) {
			$('head').append( $('<link rel="stylesheet" type="text/css" />').attr('href', '<c:url value="resources/css/MobileDatePicker.css"/>') );
		}
	</script>
</body>
</html>