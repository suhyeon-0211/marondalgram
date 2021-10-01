<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center">
	<div class="my-3">
		<div id="postAddBox" class="rounded border border-secondary border-2">
			<textarea cols="70" rows="5" placeholder="내용을 입력해주세요" class="border-0 m-2"></textarea>
			<div id="postAddBtnBox" class="d-flex justify-content-between">
				<img src="/static/images/image_icon.png" class="ml-3 mb-2">
				<button type="button" class="btn btn-success mr-2 mb-2"><small>업로드</small></button>
			</div>
		</div>
		<div class="post rounded border border-secondary">
			<div class="d-flex justify-content-between align-items-center">
				<div class="pl-3">
					<strong>${userNickname}</strong>
				</div>
				<div class="pr-2">
					<button type="button" class="btn btn-link p-0">
						<img src="/static/images/more-icon.png" width="40" alt="moreIcon">
					</button>
				</div>
			</div>
			<div class="post_image d-flex justify-content-center">
				<img src="https://cdn.pixabay.com/photo/2017/03/28/22/55/night-photograph-2183637__340.jpg" class="w-100" alt="postImage">
			</div>
			<div class="heart d-flex m-2 align-items-center">
				<div class="pr-2 pb-1">
					<button type="button" class="btn btn-link p-0">
						<img src="/static/images/empty-heart-icon.png" width="20" alt="heartIcon">
					</button>
				</div>
				좋아요 17개
			</div>
			<div class="post_text m-2">
				<strong>${userNickname}</strong>
				오늘은 무슨일이 있었다.
			</div>
			<div class="comment border-bottom border-secondary pl-2">
				<strong>댓글</strong>
			</div>
			<div class="comment_list border-bottom border-secondary p-2">
				<div class="text-lowercase">
					<strong>${userNickname}</strong>
					.....
				</div>
				<div class="text-lowercase">
					<strong>${userNickname}</strong>
					.....
				</div>
				<div class="text-lowercase">
					<strong>${userNickname}</strong>
					.....
				</div>
			</div>
			<div class="add_comment">
				<div class="input-group d-flex">
					<input type="text" class="form-control border-0" id="comment" placeholder="댓글 달기">
					<button type="button" class="btn border-0 btn-light">게시</button>
				</div>
			</div>
		</div>
	</div>
</div>