<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<%@ include file="../include/header.jsp" %>
    <section>
        <div class="container-fluid">
            <div class="row">
                <!--lg에서 9그리드, xs에서 전체그리드-->   
                <div class="col-lg-9 col-xs-12 board-table">
                    <div class="titlebox">
                        <p>자유게시판</p>
                    </div>
                    <hr>
                    
                    <!--form select를 가져온다 -->
                    <form action="<c:url value='/freeBoard/freeList'/>">
		    		<div class="search-wrap">
                       <button type="submit" class="btn btn-info search-btn">검색</button>
                       <input type="text" class="form-control search-input" name="keyword">
                       <select class="form-control search-select" name="condition" id="searchSelect">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="writer">작성자</option>
                            <option value="titleContent">제목+내용</option>
                       </select>
                    </div>
		    </form>
                   
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th class="board-title">제목</th>
                                <th>작성자</th>
                                <th>등록일</th>
                                <th>수정일</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        	<c:forEach var="article" items="${boardList}">
	                            <tr>
	                                <td>${article.bno}</td>
	                                <td>
	                                	<a href="<c:url value='/freeBoard/freeDetail'/>/${article.bno}">${article.title}</a>
	                                	<c:if test="${article.newFlag}">
	                                		<img alt="new" src="/resources/img/new.gif">
	                                	</c:if>
	                                </td>
	                                <td>${article.writer}</td>
	                                <td><fmt:formatDate value="${article.regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
	                                <td><fmt:formatDate value="${article.updatedate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                        
                    </table>

                    <!--페이지 네이션을 가져옴-->
		    <form action="<c:url value='/freeBoard/freeList'/>" id="pageForm">
				    <input type="hidden" name="keyword" value='${page.keyword}'>
				    <input type="hidden" name="condition" value='${page.condition}'>
		    		<input type="hidden" id="pageNum" name="pageNum">
		    		<input type="hidden" id="startPage" name="startPage">
		    		
                    <div class="text-center">
                    <hr>
                    <ul class="pagination pagination-sm">
                    	<c:if test='${pc.prevPage}'>
                        	<li><a href="#" data-start-page='${pc.startPage - pc.maximumPageNum}' data-page-num='${pc.startPage - 1}'>이전</a></li>
                        </c:if>
                        <c:forEach var="pageNum" begin='${pc.startPage}' end='${pc.endPage}'>
                        	<li  class="page-btn "><a href="#" data-start-page='${pc.startPage}' data-page-num='${pageNum}'>${pageNum}</a></li>
                        </c:forEach>
                        <c:if test='${pc.nextPage}'>
                        	<li><a href="#" data-start-page='${pc.startPage + pc.maximumPageNum}' data-page-num='${pc.endPage + 1}'>다음</a></li>
                        </c:if>
                    </ul>
                    <button type="button" class="btn btn-info" onclick="location.href='<c:url value='/freeBoard/freeRegist'/>'">글쓰기</button>
                    </div>
		    </form>

                </div>
            </div>
        </div>
	</section>

<%@ include file="../include/footer.jsp" %>

<script>
	let isDeleted = '${isDeleted}'
	if(isDeleted !== ''){
		alert("게시글이 정상 삭제되었습니다.");
	}
	
	$(function(){
		
		$('#pageForm a').on('click', function(e){

			e.preventDefault();
			$('#pageNum').val(e.target.dataset.pageNum);
			$('#startPage').val(e.target.dataset.startPage);
			
			$('#pageForm').submit();
		});
	});
	
	/*
	console.log($('#searchSelect').children('option'));
	
	for(let $selection of $('#searchSelect').children('option').find()){
		if($selectioin.value === ${page.condition}){
			alert($selectioin.value);
			$selection.prop('selected', true);
		}
	}
	*/
	//if($('.page-btn').children('a').val() === ${page.pageNum}){
	//	$('.page-btn').addClass('active');
	//}
</script>

