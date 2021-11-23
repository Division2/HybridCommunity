<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-brand">Cordova Coummunity</div>
			<div class="collapse navbar-collapse" id="navbars">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="boardList">게시판</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${member eq null }">
							<li class="nav-item"><a class="nav-link" href="/">로그인</a></li>
						</c:when>
						<c:when test="${member ne null }">
							<li class="nav-item active"><a class="nav-link">${member.name }님</a></li>
							<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>