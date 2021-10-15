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
			<%-- 글의 헤더 --%>
			<div class="d-flex justify-content-between align-items-center">
				<div class="pl-3">
					<strong>${contentView.post.userNickname}</strong>
					<button type="button" class="btn btn-dark ml-3 follow" data-post-user-id="${contentView.post.userId}">팔로우</button>
				</div>
				<div class="pr-2">
					<button type="button" class="btn btn-link p-0 more-btn" data-target="#moreModal" data-post-id="${contentView.post.id}" data-login-user-id="${userId}" data-post-user-id="${contentView.post.userId}">
						<img src="/static/images/more-icon.png" width="40" alt="moreIcon">
					</button>
				</div>
			</div>
			<%-- 이미지 부분 --%>
			<div class="post_image d-flex justify-content-center">
				<c:if test="${not empty contentView.post.imagePath}">
					<img src="${contentView.post.imagePath}" class="img-fluid" alt="postImage">
				</c:if>
			</div>
			<%-- 좋아요 --%>
			<div class="heart d-flex m-2 align-items-center">
				<div class="pr-2 pb-1">
					<button type="button" class="btn btn-link p-0 likeToggleBtn" data-post-id="${contentView.post.id}">
						<c:if test="${contentView.like eq false}">
						<img src="/static/images/empty-heart-icon.png" width="20" alt="heartIcon">
						</c:if>
						<c:if test="${contentView.like eq true}">
						<img src="/static/images/filled-heart-icon.png" width="20" alt="heartIcon">
						</c:if>
					</button>
				</div>
				좋아요 ${contentView.likeCnt}개
			</div>
			<%-- 글의 내용 --%>
			<div class="post_text m-2">
				<strong>${contentView.post.userNickname}</strong>
				${contentView.post.content}
			</div>
			<div class="comment border-bottom border-secondary pl-2">
				<strong>댓글</strong>
			</div>
			<%-- 댓글 --%>
			<div class="comment_list border-bottom border-secondary p-2">
				<c:forEach items="${contentView.commentList}" var="comment">
				<div class="d-flex align-items-center justify-content-between">
					<div class="text-lowercase">
						<strong>${comment.userNickname}</strong>
						${comment.content}
					</div>
					<div>
						<a href="#" class="comment-del-btn" data-post-id="${contentView.post.id}" data-comment-user-id="${comment.userId}" data-comment-id="${comment.id}">
							<img src="/static/images/x-icon.png" width="20">
						</a>
					</div>
				</div>
				</c:forEach>
			</div>
			<%-- 댓글 추가 --%>
			<div class="add_comment">
				<div class="input-group d-flex">
					<input type="text" class="form-control border-0" id="comment" placeholder="댓글 달기">
					<button type="button" class="btn border-0 btn-light commentAddBtn" data-post-id="${contentView.post.id}">게시</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="moreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    	<a href="#" class="btn btn-dark del-post">삭제하기</a>
    </div>
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
		
		// 파일 추가
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
		
		// 댓글 추가
		$('.commentAddBtn').on('click', function() {
			let comment = $(this).siblings('input').val();
			console.log(comment);
			if (comment == '') {
				alert('댓글을 입력하세요');
				return;
			}
			let postId = $(this).data('post-id');
			
			$.ajax({
				type : 'post'
				, url : '/comment/create'
				, data : {'content': comment, 'postId' : postId}
				, success : function(data) {
					if (data.result == "success") {
						location.reload(true);
					} else if (data.result == "notLogin") {
						alert("로그인하고 댓글을 추가해주세요");
					} else {
						alert('댓글을 추가할 수 없습니다.');
					}
				}
				, error : function(e) {
					alert('댓글을 추가할 수 없습니다. 관리자에게 문의해주세요');
				}
			});
		});
		
		// ... 버튼 클릭 (삭제를 하기 위해)
		$('.more-btn').on('click', function() {
			let loginUserId = $(this).data('login-user-id');
			let postUserId = $(this).data('post-user-id');
			if (loginUserId != postUserId) {
				alert('자신의 게시물만 삭제할 수 있습니다.');
				return;
			}
			// postId를 가져온다 => 지금 클릭된 태그의 postId
			let postId = $(this).data('post-id');
			// modal에 포스트 아이디를 넣어준다.
			$('#moreModal').data('post-id', postId);
			$('#moreModal').modal('toggle');
		});
		
		// 모달안에 있는 삭제하기 클릭
		$('#moreModal .del-post').on('click', function(e) {
			e.preventDefault();
			let postId = $('#moreModal').data('post-id');
			
			$.ajax({
				type : 'delete'
				, url : '/post/delete'
				, data : {'postId' : postId}
				, success : function(data) {
					if (data.result == 'success') {
						location.reload(true);
					} else {
						alert('글이 삭제되지 않았습니다.');
					}
				}
				, error : function(e) {
					alert('글이 삭제되지 않았습니다. 관리자에게 문의해주세요');
				}
			});
		});
		
		// 좋아요 클릭
		$('.likeToggleBtn').on('click', function() {
			let postId = $(this).data('post-id');
			
			$.ajax({
				type : 'post'
				, url : '/like/' + postId
				, success : function(data) {
					if (data.result == 'success') {
						location.reload(true);
					} else if (data.result == "notLogin") {
						alert("로그인하고 댓글을 추가해주세요");
					} else {
						alert('다시 시도해주세요');
					}
				}
				, error : function(e) {
					alert('좋아요가 적용되지 않습니다. 관리자에게 문의해주세요');
				}
			});
		});
		
		// 댓글 삭제
		$('.comment-del-btn').on('click', function(e) {
			e.preventDefault();
			let postId = $(this).data('post-id');
			let userId = $(this).data('comment-user-id');
			let commentId = $(this).data('comment-id');
			
			$.ajax({
				type: 'delete'
				, url : '/comment/delete'
				, data : {'postId' : postId, 'userId' : userId, 'commentId' : commentId}
				, success : function(data) {
					if (data.result == 'success') {
						location.reload(true);
					} else {
						alert("본인의 댓글만 삭제할 수 있습니다.");
					}
				}
				, error : function(e) {
				 	alert('삭제할 수 없습니다. 관리자에게 문의해주세요');
				}
			});
		});
		
		// 팔로우
		$('.follow').on('click', function(e) {
			let targetId = $(this).data('post-user-id');
			
			$.ajax({
				type: 'post'
				, url : '/follow/' + targetId
				, success : function(data) {
					if (data.result == 'success') {
						location.reload(true);
					} else if (data.result == "notLogin") {
						alert("로그인하고 댓글을 추가해주세요");
					} else {
						alert('다시 시도해주세요');
					}
				}
				, error : function(e) {
					alert('팔로우가 되지 않습니다. 관리자에게 문의해주세요');
				}
			});
		});
	});
</script>