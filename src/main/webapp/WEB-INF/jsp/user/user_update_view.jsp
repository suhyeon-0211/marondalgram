<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center"
	id="sectionWrap">
	<div class="container">
		<h2 class="text-center">회원가입</h2>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="loginId">아이디</label> <input type="text"
				class="form-control col-8 ml-3" id="loginId">
		</div>
		<div class="d-flex justify-content-end align-items-center pt-1">
			<div id="idStatusArea" class="mr-4"></div>
			<button type="button" class="btn btn-warning mr-0" id="isDuplicatedBtn">
				<small>중복확인</small>
			</button>
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="password">비밀번호</label> <input type="password"
				class="form-control col-8 ml-3" id="password">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="passwordConfirm">비밀번호 확인</label> <input type="password"
				class="form-control col-8 ml-3" id="passwordConfirm">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="name">이름</label> <input type="text"
				class="form-control col-8 ml-3" id="name">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="nickname">닉네임</label> <input type="text"
				class="form-control col-8 ml-3" id="nickname">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="email">이메일 주소</label> <input type="text"
				class="form-control col-8 ml-3" id="email">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="profileImage">프로필 사진</label> 
			<input type="file" class="form-control col-8 ml-3" id="file" accept=".gif, .jpg, .jpeg, .png">
		</div>
		<button type="button" class="btn btn-success d-block w-100 mt-3" id="signUpBtn">회원가입</button>
	</div>
</div>