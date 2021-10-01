<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<%-- ajax를 사용하려면 더 많은 함수가 있는 jquery js를 포함해야한다. --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/total_style.css" style="text/css">
</head>
<body>
	<div class="wrap">
		<header class="d-flex align-items-center">
			<h1 class="font-weight-bold pl-4">marondalgram</h1>
		</header>
		<section class="d-flex justify-content-center align-items-center">
			<div id="sectionWrap">
				<div class="input-group">
					<div class="input-group-text">
						<img src="/static/images/user.png" alt="user" width="30">
					</div>
					<input type="text" class="form-control">
				</div>
				<div class="input-group pt-2">
					<div class="input-group-text">
						<img src="/static/images/key.png" alt="key" width="30">
					</div>
					<input type="text" class="form-control">
				</div>
				<button type="button" class="btn btn-primary d-block w-100 mt-3">로그인</button>
				<%--<button type="button" class="btn btn-success d-block w-100 mt-2">회원가입</button> --%>
				<a href="#" class="d-block text-center pt-3">회원 가입</a>
			</div>
		</section>
		<footer class="d-flex justify-content-center align-items-center">
				<h3>copyright marondalgram</h3>
		</footer>
	</div>
</body>
</html>