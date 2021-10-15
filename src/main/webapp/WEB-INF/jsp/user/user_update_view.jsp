<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center"
	id="sectionWrap">
	<div class="container">
		<h2 class="text-center">정보 수정</h2>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="loginId">아이디</label> <input type="text"
				class="form-control col-8 ml-3" id="loginId" value="${user.loginId}" disabled readonly>
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="password">비밀번호</label> <input type="password"
				class="form-control col-8 ml-3" id="password" >
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="passwordConfirm">비밀번호 확인</label> <input type="password"
				class="form-control col-8 ml-3" id="passwordConfirm">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="name">이름</label> <input type="text"
				class="form-control col-8 ml-3" id="name" value="${user.name}">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="nickname">닉네임</label> <input type="text"
				class="form-control col-8 ml-3" id="nickname" value="${user.nickname}">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="email">이메일 주소</label> <input type="text"
				class="form-control col-8 ml-3" id="email" value="${user.email}">
		</div>
		<div class="d-flex justify-content-between align-items-center pt-3">
			<label for="profileImage">프로필 사진</label> 
			<input type="file" class="form-control col-8 ml-3" id="file" accept=".gif, .jpg, .jpeg, .png">
		</div>
		<button type="button" class="btn btn-success d-block w-100 mt-3" id="signUpBtn">정보 수정</button>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#searchFileBtn').on('click', function(){
			$('#file').click();
		});
		
		$('#file').on('change', function() {
			let file = $('#file').val();
			if (file != '') {
				let ext = file.split('.').pop().toLowerCase();
				if ($.inArray(ext, ['jpg', 'png', 'jpeg', 'gif']) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val('');
					$('#fileName').text('');
					return;
				}
			}
			$(this).removeClass('d-none');
		});
		
		$('#signUpBtn').on('click', function() {
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val().trim();
			let passwordConfirm = $('#passwordConfirm').val().trim();
			if (password == '' || passwordConfirm == '') {
				alert('비밀번호를 입력하세요');
				return;
			}
			if (password != passwordConfirm) {
				alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
				$('#password').val('');
				$('#passwordConfirm').val('');
				return;
			}
			let name = $('#name').val().trim();
			if (name == '') {
				alert('이름을 입력하세요');
				return;
			}
			let nickname = $('#nickname').val().trim();
			if (nickname == '') {
				alert('닉네임을 입력하세요');
				return;
			}
			let email = $('#email').val().trim();
			if (email == '') {
				alert('이메일을 입력하세요');
				return;
			}
			
			let file = $('#file').val();
			if (file != '') {
				let ext = file.split('.').pop().toLowerCase();
				if ($.inArray(ext, ['jpg', 'png', 'jpeg', 'gif']) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val('');
					$('#fileName').text('');
					return;
				}
			}
			
			let formData = new FormData();
			formData.append('loginId', loginId);
			formData.append('password', password);
			formData.append('name', name);
			formData.append('nickname', nickname);
			formData.append('email', email);
			formData.append('file', $('#file')[0].files[0]);
			
			$.ajax({
				type : 'post'
				, url : '/user/update'
				, data : formData
				, enctype : 'multipart/form-data' // 파일 업로드 필수 설정
				, processData : false // 파일 업로드 필수 설정
				, contentType : false // 파일 업로드 필수 설정
				, success : function(data) {
					if (data.result == 'success') {
						alert("회원정보가 수정되었습니다.");
						location.href= "/timeline/list_view";
					} else {
						alert("회원정보 수정에 실패하였습니다.");
					}
				}
				, error : function(e) {
					alert("회원정보가 수정되지 않습니다. 관리자에게 문의해주세요");
				}
			});
		});
	});
</script>