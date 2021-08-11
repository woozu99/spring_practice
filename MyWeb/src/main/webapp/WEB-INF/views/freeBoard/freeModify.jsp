<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<%@ include file="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 write-wrap">
                        <div class="titlebox">
                            <p>수정하기</p>
                        </div>
                        
                        <form action="<c:url value='/freeBoard/freeModify'/>" method="post" id="modify-form">
                            <div>
                                <label>DATE</label>
                                <p>${article.regdate}</p>
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" id='bno' name='bno' readonly value="${article.bno}">
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" id='writer' name='writer' readonly value="${article.writer}">
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" id='title' name='title' value="${article.title}">
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" id='content' rows="10" name='content' style='resize: none;'>${article.content}</textarea>
                            </div>

                            <button type="button" class="btn btn-dark" onclick="location.href='<c:url value="/freeBoard/freeList"/>'">목록</button>    
                            <button type="button" class="btn btn-primary" id="modify-btn">변경</button>
                            <button type="button" class="btn btn-info" id="delete-btn">삭제</button>
                            
                    </form>
                                    
                </div>
            </div>
        </div>
        </section>
      
<%@ include file="../include/footer.jsp" %>

<script>

	//수정버튼 이벤트 처리
	
	//1. 폼 데이터가 공백인지 확인 처리
	//2. 공백이 없으면 컨트롤러에 modify요청으로 데이터를 전송
	//3. 처리 후 "게시글 수정이 정상 처리되었습니다라는 알림창이 글 ㅅ상세보기 페이지에서 처리될 수 있도록 하기
	
	$(function(){
		$("#modify-btn").click(function(){
			if($("#title").val() === ''){
				alert("제목을 입력하세요.");
				$("#title").focus();
			}
			else if($("#content").val() === ''){
				alert("내용을 입력하세요.");
				$("#content").focus();
			}
			else{
				$("#modify-form").submit();
			}
		});
		
		$("#delete-btn").click(function(){
			let deleteFlag = confirm("정말 삭제하시겠습니까?");
			if(deleteFlag){
				$("#modify-form").attr("action", "<c:url value='/freeBoard/freeDelete'/>");
				$("#modify-form").submit();
			}
		});
	});
	
	
	
</script>