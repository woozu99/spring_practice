<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 write-wrap">
                        <div class="titlebox">
                            <p>상세보기</p>
                        </div>
                        
                        <form>
                            <div>
                                <label>DATE</label>
                                <p><fmt:formatDate value="${article.regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></p>
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name='bno' value="${article.bno}" readonly>
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" name='writer' value="${article.writer}" readonly>
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name='title' value="${article.title}" readonly>
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name='content' readonly style="resize:none;">${article.content}</textarea>
                            </div>

                            <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/freeBoard/freeModify/${article.bno}"/>'">변경</button>
                            <button type="button" class="btn btn-dark" onclick="location.href='<c:url value="/freeBoard/freeList"/>'">목록</button>
                    </form>
                </div>
            </div>
        </div>
        </section>
        
        <section style="margin-top: 80px;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-md-9 write-wrap">
                        <form class="reply-wrap">
                            <div class="reply-image">
                                <img src="/img/profile.png">
                            </div>
                            <!--form-control은 부트스트랩의 클래스입니다-->
	                    <div class="reply-content">
	                        <textarea class="form-control" rows="3" id="reply"></textarea>
	                        <div class="reply-group">
	                              <div class="reply-input">
	                              <input type="text" class="form-control" placeholder="이름" id="replyId">
	                              <input type="password" class="form-control" placeholder="비밀번호" id="replyPw">
	                              </div>
	                              
	                              <button type="button" class="right btn btn-info" id="replyRegist">등록하기</button>
	                        </div>
	
	                    </div>
                        </form>

                        <!--여기에접근 반복-->
                          
                        <div id="replyList">
                        <!--
                        <div class='reply-wrap'>
                            <div class='reply-image'>
                                <img src='/img/profile.png'>
                            </div>
                            <div class='reply-content'>
                                <div class='reply-group'>
                                    <strong class='left'>honggildong</strong> 
                                    <small class='left'>2019/12/10</small>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                                </div>
                                <p class='clearfix'>여기는 댓글영역</p>
                            </div> 
                                   
                        </div>
                        --> 
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
	<!-- 모달 -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					<h4 class="modal-title">댓글수정</h4>
				</div>
				<div class="modal-body">
					<!-- 수정폼 id값을 확인하세요-->
					<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
					<div class="reply-group">
						<div class="reply-input">
						    <input type="hidden" id="modalRno">
							<input type="password" class="form-control" placeholder="비밀번호" id="modalPw">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
					</div>
					</div>
					<!-- 수정폼끝 -->
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>

<script>
	$(function(){
		let isModified = '${isModified}';
		if(isModified !== ''){
			alert("게시글 수정이 정상 처리되었습니다");
		}
	});
	
	//화면이 다 로딩된 후 실행될 자바스크립트(==window.onload)
	$(document).ready(function(){
		
		//댓글 등록
		$('#replyRegist').click(function(){
			/*
			댓글을 등록하려면 게시글 번호도 보내주어야 한다.
			댓글 내용, 댓글 작성자, 댓글 비밀번호, 게시글 번호를 json형식으로 하나로 모아서 전달해주시면 됩니다.(비동기통신)
			console.log를 통해 '댓글 등록 완료!'를 확인하고 실제 DB에 댓글이 추가되는지 확인
			*/
			const bno = '${article.bno}';
			const reply = $('#reply').val();
			const replyId = $('#replyId').val();
			const replyPw = $('#replyPw').val();
			
			if(reply === '' || replyId === '' || replyPw === ''){
				alert('빈칸 없이 내용을 입력해주세요');
				return;
			}
			
			const replyData = {
				"bno" : bno,
				"reply" : reply,
				"replyId" : replyId,
				"replyPw" : replyPw
			};
			
			$.ajax({
				type: "POST",
				url: "<c:url value='/reply/replyRegist'/>",
				dataType: "text", //서버로 부터 어떤 형식으로 받을지(생략 가능)
				data: JSON.stringify(replyData),
				headers : {
					"Content-Type" : "application/json"
				},
				success: function(data){
					console.log(data);
					$('#reply').val('');
					$('#replyId').val('');
					$('#replyPw').val('');
					getList(); //등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.
				},
				error: function(){
					console.log("fail");
				}
			});
			
			//목록 요청
			let strAdd = '';//화면에 그려넣을 태그를 문자열의 형태로 추가할 변수
			
			function getList(){
				
				//gettJSON 함수를 통해 JSON형식의 파일을 읽어올 수 있다.
				//get방식의 요청을 통해 서버로부터 받은 JSON 데이터를 로드한다.
				//$.JSON(url, [DATA], [통신 성공 여부])
				$.getJSON(
					"<c:url value='/reply/getList/${article.bno}'/>",
					function(data){
						console.log(data);
						
						for(let i = 0; i < data.length ; i++){
							strAdd += "<div class='reply-wrap' style='display:none;'>";
                            strAdd += "<div class='reply-image'>";
                            strAdd += "<img src='../resources/img/profile.png'>";
                            strAdd += "</div>";
                            strAdd += "<div class='reply-content'>";
                            strAdd += "<div class='reply-group'>";
                            strAdd += "<strong class='left'>"+ data[i].replyId +"</strong>"; 
                     		strAdd += "<small class='left'>"+ data[i].replyDate +"</small>"
                            strAdd += "<a href='"+ data[i].rno +"' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
                            strAdd += "<a href='"+ data[i].rno +"' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
                            strAdd += "</div>";
                            strAdd += "<p class='clearfix'>"+ data[i].reply +"</p>";
                            strAdd += "</div>";
                           strAdd += "</div>";
						}
						
						$("#replyList").html(strAdd);//replayList영역에 추가
						$('.reply-wrap').fadeIn(500);
						
					}
				);
			}
		});
	}); //end jquery
</script>
