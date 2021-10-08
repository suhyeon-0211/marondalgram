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
			<input type="file" class="form-control col-8 ml-3 d-none" id="file" accept=".gif, .jpg, .jpeg, .png">
		</div>
		<div class="d-flex justify-content-end align-items-center pt-1">
			<button type="button" class="btn btn-primary d-block" id="searchFileBtn">
				<small>찾기</small>
			</button>
		</div>
		<button type="button" class="btn btn-success d-block w-100 mt-3" id="signUpBtn">회원가입</button>
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
		
		$('#isDuplicatedBtn').on('click', function() {
			$('#idStatusArea').empty();
			let loginId = $('#loginId').val().trim();
			if (loginId == '') {
				$('#idStatusArea').append("<small class='text-danger'>아이디를 입력해주세요</small>");
				return;
			}
			if (loginId.length < 4) {
				$('#idStatusArea').append("<small class='text-danger'>아이디를 4자 이상 입력해주세요</small>");
				return;
			}
			$.ajax({
				type : 'get'
				, url : '/user/is_duplicated_id'
				, data : {"loginId" : loginId}
				, success : function(data) {
					if(data.result) {
						$('#idStatusArea').append("<small class='text-danger'>중복된 아이디입니다.</small>");
					} else {
						$('#idStatusArea').append("<small class='text-success'>사용가능한 아이디입니다.</small>");
					}
				}
				, error : function(e) {
					alert("중복확인이 안됩니다. 관리자에게 문의해주세요");
				}
			});
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
			// let profileImage = $('#profileImage').val().trim();
			if ($('#idStatusArea').children('.text-success').text() == '') {
				alert('아이디 중복확인을 확인해주세요');
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
				, url : '/user/sign_up'
				, data : formData
				, enctype : 'multipart/form-data' // 파일 업로드 필수 설정
				, processData : false // 파일 업로드 필수 설정
				, contentType : false // 파일 업로드 필수 설정
				, success : function(data) {
					if (data.result == 'success') {
						alert("가입을 환영합니다!!! 로그인 해주세요");
						location.href= "/user/sign_in_view";
					} else {
						alert("가입에 실패했습니다.");
					}
				}
				, error : function(e) {
					alert(e);
					alert("회원가입이 정상적으로 이루어지지 않았습니다.");
				}
			});
		});
	})
</script> 