<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center align-items-center">
	<div class="my-3">
		<div id="postAddBox" class="rounded border border-secondary border-2">
			<textarea cols="70" rows="5" placeholder="내용을 입력해주세요" class="border-0 m-2" id="content"></textarea>
			<div id="postAddBtnBox" class="d-flex justify-content-between">
				<div id="fileUpload" class="d-flex">
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .jpeg, .png">
					<a href="#" id="fileUploadBtn"><img src="/static/images/image_icon.png" class="ml-3 mb-2"></a>
					<div id="fileName" class="ml-2">
					</div>
				</div>
				<button type="button" class="btn btn-success mr-2 mb-2" id="uploadBtn"><small>업로드</small></button>
			</div>
		</div>
		<c:forEach items="${contentViewList}" var="contentView">
		<div class="post rounded border border-secondary">
			<div class="d-flex justify-content-between align-items-center">
				<div class="pl-3">
					<strong>${contentView.post.userNickname}</strong>
				</div>
				<div class="pr-2">
					<button type="button" class="btn btn-link p-0">
						<img src="/static/images/more-icon.png" width="40" alt="moreIcon">
					</button>
				</div>
			</div>
			<div class="post_image d-flex justify-content-center">
				<img src="${contentView.post.imagePath}" class="img-fluid" alt="postImage">
			</div>
			<div class="heart d-flex m-2 align-items-center">
				<div class="pr-2 pb-1">
					<button type="button" class="btn btn-link p-0">
						<img src="/static/images/empty-heart-icon.png" width="20" alt="heartIcon">
					</button>
				</div>
				좋아요 ${contentView.likeCnt}개
			</div>
			<div class="post_text m-2">
				<strong>${contentView.post.userNickname}</strong>
				${contentView.post.content}
			</div>
			<div class="comment border-bottom border-secondary pl-2">
				<strong>댓글</strong>
			</div>
			<div class="comment_list border-bottom border-secondary p-2">
				<c:forEach items="${contentView.commentList}" var="comment">
				<div class="text-lowercase">
					<strong>${comment.userNickname}</strong>
					${comment.content}
				</div>
				</c:forEach>
			</div>
			<div class="add_comment">
				<div class="input-group d-flex">
					<input type="text" class="form-control border-0" id="comment" placeholder="댓글 달기">
					<button type="button" class="btn border-0 btn-light">게시</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 파일 업로드 이미지 버튼 클릭 => 파일 선택 창이 뜸
		$('#fileUploadBtn').on('click', function(e) {
			e.preventDefault();	// 제일 위로 올라가는 동작 중지
			$('#file').click();	// 사용자가 input file을 클릭한 것과 같은 동작
		});
		
		// 사용자가 파일을 선택했을 때 => 파일명을 옆에 노출시킴
		$('#file').on('change', function(e) {
			let fileName = e.target.files[0].name;
			let fileNameArr = fileName.split('.');
			if (fileNameArr[fileNameArr.length - 1].toLowerCase() != 'png' && fileNameArr[fileNameArr.length - 1].toLowerCase() != 'gif'
					&& fileNameArr[fileNameArr.length - 1].toLowerCase() != 'jpg' && fileNameArr[fileNameArr.length - 1].toLowerCase() != 'jpeg') {
				alert('이미지 파일만 업로드 할 수 있습니다.');
				$(this).val(''); // 올라가 있는 잘못된 파일을 비워준다.
				$('#fileName').text('');	// 잘못된 파일명도 비워준다.
				return;
			}
			$('#fileName').text(fileName);
		});
		
		$('#uploadBtn').on('click', function() {
			let content = $('#content').val();
			if (content == '') {
				alert('내용을 입력하세요');
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
			formData.append('content', content);
			formData.append('file', $('#file')[0].files[0]);
			
			$.ajax({
				type : 'post'
				, url : '/post/create'
				, data : formData
				, enctype : 'multipart/form-data' // 파일 업로드 필수 설정
				, processData : false // 파일 업로드 필수 설정
				, contentType : false // 파일 업로드 필수 설정
				, success : function(data) {
					if (data.result == 'success') {
						alert('게시글을 업로드하였습니다.');
						location.href="/timeline/list_view";
					} else if (data.result == 'notLogin') {
						alert('게시글을 업로드하려면 로그인이 필요합니다.');
						location.href="/user/sign_in_view";
					} else {
						alert('게시글이 업로드되지 못했습니다.');
					}
				}
				, error : function(e) {
					alert("관리자에게 문의해주세요");
				}
				
			});
			
		});
	});
</script>