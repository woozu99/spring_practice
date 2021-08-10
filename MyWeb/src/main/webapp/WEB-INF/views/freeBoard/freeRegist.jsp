<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<%@ include file="../include/header.jsp" %>
    <section>
       <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox">
                        <p>자유게시판</p>
                    </div>
                    
                    <form action="<c:url value="/freeBoard/freeRegist"/>" method="post" id="regist-form">
                    
	                    <table class="table">
	                        <tbody class="t-control">
	                            <tr>
	                                <td class="t-title">NAME</td>
	                                <td><input class="form-control input-sm" id="writer" name="writer"></td>
	                            </tr>
	                            <tr>
	                                <td class="t-title">TITLE</td>
	                                <td><input class="form-control input-sm" id="title" name="title"></td>
	                            </tr>
	                            <tr>
	                                <td class="t-title">CONTENT</td>
	                                <td>
	                                <textarea class="form-control" id="content" rows="7" name="content"></textarea>
	                                </td>                 
	                            </tr>
	                        </tbody>
	                    </table>
	                    
	                    <div class="titlefoot">
	                        <button class="btn btn-regist" type="button">등록</button>
	                        <button class="btn btn-list" type="button">목록</button>
	                    </div>
                    </form>
                </div>
            </div>    
       </div>
    </section>
    
<script>
	$(function(){
		$(".btn-regist").click(function(){
			if($("#title").val() === ''){
				alert("제목을 입력하세요.");
				$("#title").focus();
			}
			else if($("#content").val() === ''){
				alert("내용을 입력하세요.");
				$("#content").focus();
			}
			else{
				$("#regist-form").submit();
			}
		})
	});
</script>
 
<%@ include file="../include/footer.jsp" %>