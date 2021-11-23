<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href='<c:url value="resources/css/layout.css"/>' rel="stylesheet"/>
<script src='<c:url value="resources/js/member.js"/>'></script>
<title>Main</title>
</head>
<body>
	<!-- 상단 바 -->
	<jsp:include page="layout/header.jsp"/>
	<!-- 본문 -->
	<c:choose>
		<c:when test="${member eq null }">
			<div class="container">
				<div class="login-form">
					<h1 style="margin-bottom: 15px;">Login<i class="fa fa-paper-plane" aria-hidden="true" style="color: #007BFF"></i></h1>
					<input type="text" class="text-field" id="userId" name="userId" placeholder="&#xf007; 아이디를 입력하세요">
					<input type="password" class="text-field" id="password" name="password" placeholder="&#xf023; 비밀번호를 입력하세요">
					<i id="eyePass" class="fa fa-eye fa-lg" style="display:none;"></i>
					<button id="btnLogin" class="submit-btn">로그인</button>
					<div class="mt-2">
						<a class="find" data-toggle="modal" data-target="#findUserID">아이디 찾기</a> | 
						<a class="find" data-toggle="modal" data-target="#findPassword">비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<script>location.href="boardList";</script>
		</c:otherwise>
	</c:choose>
	
	<!-- Modal -->
	<div class="modal fade" id="findUserID" tabindex="-1" role="dialog" aria-labelledby="findUserID" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">아이디 찾기</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-5 mt-2">
					<div class="md-form">
						<input type="text" id="ID_UserName" name="name" class="form-control" placeholder="이름을 입력하세요">
						<input type="text" id="ID_UserPhone" name="phone" class="form-control mt-2" placeholder="휴대폰 번호 - 없이 입력">
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button id="btnFindUserID" class="btn btn-primary">아이디 찾기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="findPassword" tabindex="-1" role="dialog" aria-labelledby="findPassword" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">비밀번호 찾기</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-5 mt-2">
					<div class="md-form">
						<input type="text" id="PW_UserID" class="form-control" placeholder="아이디를 입력하세요">
						<input type="text" id="PW_UserPhone" class="form-control mt-2" placeholder="휴대폰 번호 - 없이 입력">
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button id="btnFindPassword" class="btn btn-primary">비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
</body>
</html>