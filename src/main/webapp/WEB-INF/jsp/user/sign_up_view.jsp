<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<%-- ajax를 사용하려면 더 많은 함수가 있는 jquery js를 포함해야한다. --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/sign_up_style.css" style="text/css">
</head>
<body>
	<div class="wrap">
		<header class="d-flex align-items-center">
			<h1 class="font-weight-bold pl-4">메모 게시판</h1>
		</header>
		<section class="d-flex justify-content-center align-items-center">
			<div class="container">
				<h2 class="text-center">회원가입</h2>
				<div class="d-flex justify-content-between align-items-center pt-3">
					<label for="userId">아이디</label>
					<input type="text" class="form-control col-8 ml-3" id="userId">
					<%-- <button type="button" class="btn btn-warning mr-0">중복확인</button>
					<div id="idStatusArea"></div> --%>
				</div>
				<div class="d-flex justify-content-between align-items-center pt-1">
					<div id="idStatusArea"></div>
					<button type="button" class="btn btn-warning mr-0"><small>중복확인</small></button>
				</div>
				<div class="d-flex justify-content-between align-items-center pt-3">
					<label for="password">비밀번호</label>
					<input type="password" class="form-control col-8 ml-3" id="password">
				</div>
				<div class="d-flex justify-content-between align-items-center pt-3">
					<label for="passwordConfirm">비밀번호 확인</label>
					<input type="password" class="form-control col-8 ml-3" id="passwordConfirm">
				</div>
				<div class="d-flex justify-content-between align-items-center pt-3">
					<label for="name">이름</label>
					<input type="text" class="form-control col-8 ml-3" id="name">
				</div>
				<div class="d-flex justify-content-between align-items-center pt-3">
					<label for="nickname">닉네임</label>
					<input type="text" class="form-control col-8 ml-3" id="nickname">
				</div>
				<div class="d-flex justify-content-between align-items-center pt-3">
					<label for="email">이메일 주소</label>
					<input type="text" class="form-control col-8 ml-3" id="email">
				</div>
				<div class="d-flex justify-content-between align-items-center pt-3">
					<label for="email">프로필 사진</label>
					<input type="text" class="form-control col-8 ml-3" id="email">
				</div>
				<div class="d-flex justify-content-end align-items-center pt-1">
					<button type="button" class="btn btn-primary d-block"><small>찾기</small></button>
				</div>
				<button type="button" class="btn btn-success d-block w-100 mt-3">회원가입</button>
			</div>
		</section>
		<footer class="d-flex justify-content-center align-items-center">
				<h3>copyright maronbiana</h3>
		</footer>
	</div>
</body>
</html>