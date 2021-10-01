<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center">
	<div id="sectionWrap">
		<div class="input-group">
			<div class="input-group-text">
				<img src="/static/images/user.png" alt="user" width="30">
			</div>
			<input type="text" class="form-control" id="loginId">
		</div>
		<div class="input-group pt-2">
			<div class="input-group-text">
				<img src="/static/images/key.png" alt="key" width="30">
			</div>
			<input type="password" class="form-control" id="password">
		</div>
		<button type="button" class="btn btn-primary d-block w-100 mt-3" id="signInBtn">로그인</button>
		<a href="/user/sign_up_view" class="d-block text-center pt-3">회원 가입</a>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#signInBtn').on('click', function() {
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val().trim();
			if (loginId == '') {
				alert("아이디를 입력하세요");
				return;
			}
			if (password == '') {
				alert('비밀번호를 입력하세요');
				return;
			}
			
			$.ajax({
				type : 'post'
				, url : '/user/sign_in'
				, data : {
					'loginId' : loginId
					, 'password' : password
				}
				, success : function(data) {
					if (data.result == 'success') {
						location.href = '/timeline/list_view'
					} else {
						alert('아이디 또는 비밀번호가 일치하지 않습니다.');
					}
				}
				, error : function(e) {
					alert('관리자에게 문의해주세요');
				}
			});
		});
	});
</script> 