<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$('.modifyBtn').on('click', function() {
 	        $('.commentForm').hide();
			var $li = $(this).parents('li');
			$li.find('.comment').hide();
			$li.find('.commentForm').toggle();
		});
	});
</script> -->
<script type="text/javascript">
$(document).ready(function(){
    // 수정
    $('.modifyBtn').on('click', function(){
       var $li = $(this).parents('li');
       $('.commentForm').hide();
       $('.comment').show();
       $li.find('.comment').hide();
       $li.find('.commentForm').toggle();
    });
    // 수정취소
    $('.cancelBtn').on('click', function(){
       $('.commentForm').hide();
       $('.comment').show();
    });
    
    // 삭제
    $('.deleteBtn').on('click', function(){
       var $li = $(this).parents('li');
       $('.delete_inPw').hide();
       $li.find('.delete_inPw').show();
    });
    $('.deleteCancelBtn').on('click', function(){
       $('.delete_inPw').hide();
    });
 });
 </script>
<style type="text/css">
   *{margin: 0; padding: 0; box-sizing: border-box; text-decoration: none; color: #a1a2a3;}
   legend{display: none;}
   fieldset{border: none;}
   strong{font-size: 14px; color: #a1a2a3;}
   input{width: 140px; padding: 4px 5px; margin-right: 15px; border: 1px solid #d9d9d9;}
   .commentBox{border: 1px solid #ccc; border-top: none; margin: 10%;}
   .commentBox textarea, .commenteWriteForm textarea{resize: none; width: 90%; height: 60px; padding: 5px; border: 1px solid #d9d9d9;}
   .commentBox ul{}
   .commentBox ul li{width: 100%; border-top: 1px solid #ccc;}
   .commentBox ul li .commentTop{overflow: hidden; padding: 10px 20px;}
   .commentBox ul li .commentTop .no{font-size: 10px; margin-right: 15px;}
   .commentBox ul li .commentTop .name{font-size: 14px;}
   .commentBox ul li .commentTop .date{font-size: 12px; margin-left: 10px;}
   .commentBox ul li .commentForm{display: none; padding: 10px 20px 20px; border: 1px solid #e9e9e9; border-bottom: none; background: #fbfafa;}
   .commentBox ul li .commentForm .commentFormTop{padding: 10px 0;}
   .commentBox ul li .commentForm input{width: 140px; padding: 4px 5px; margin-right: 15px; border: 1px solid #d9d9d9;}
   .commentBox ul li .commentForm .view{}
   .commentBox ul li .commentForm .view textarea{width: 80%; float: left;}
   .commentBox ul li .commentForm .view .submit{width: 20%; float: left; text-align: right;}
   .commentBox ul li .commentForm .view .submit button{width: 45%; height: 60px; color: #fff; border: none; cursor: pointer;}
   .commentBox ul li .commentForm .view .submit button.modifyOkBtn{background: #fa8072;}
   .commentBox ul li .commentForm .view .submit button.modifyOkBtn:hover{background: #ff5050;}
   .commentBox ul li .commentForm .view .submit button.cancelBtn{background: #a9a9a9;}
   .commentBox ul li .commentForm .view .submit button.cancelBtn:hover{background: #6f6f6f;}
   .commentBox ul li .comment{padding: 20px 20px 60px; line-height: 1.5; border-top: 1px solid #ccc; font-size: 14px;}
   .commentBox ul li .delete_inPw{display: none; padding: 10px 20px 20px; background: #fbfafa; border-top: 1px solid #e9e9e9;}
   
   /* commentWrite */
   .commenteWriteForm{padding: 5px 20px 20px; border: 1px solid #e9e9e9; background-color: #fbfafa; color: #353535;}
   .commenteWriteForm .commentWriteTop1{width: 100%; padding: 10px 0;}
   .commenteWriteForm .commentWriteTop2{width: 100%; padding: 10px 0;}
   .commenteWriteForm .commentWriteTop2 input{width: 140px; padding: 4px 5px; margin-right: 15px; border: 1px solid #d9d9d9;}
   
   .commenteWriteForm .writeBtn{display: inline-block; width: 9%; height: 60px; float: right; border: none; background: #fa8072; color: #fff; cursor: pointer;}
   .commenteWriteForm .writeBtn:hover{background: #ff5050;}

   .button{display: inline-block; float: right;}
   .button .btn_blue{display: inline-block; float: left; line-height: 1; padding: 5px 5px; font-size: 12px; color: #1689e2; background: #fff; border: 1px solid #ccc;}
   .button .btn_blue:hover{color: #fff; background: #1689e2; border: 1px solid #1689e2;}
   .button .btn_red{display: inline-block; float: left; line-height: 1; padding: 5px 5px; font-size: 12px; color: #e61717; background: #fff; border: 1px solid #ccc;}
   .button .btn_red:hover{color: #fff; background: #e61717; border: 1px solid #e61717;}
   #numbering{
       border: 1px solid #ccc;
       text-align: center;
   }
</style>
</head>
<body>
<div class="commentBox">
   <ul>
   		<c:forEach var="vo" items="${list }">
            <li>
         <div class="commentTop">            
            <strong class="no">${vo.no }</strong>
            <strong class="name">${vo.writer }</strong>
            <span class="date">${vo.wdate }</span>
            <div class="button">
               <button class="modifyBtn btn_blue">수정</button>
               <button class="deleteBtn btn_red">삭제</button>
            </div>
         </div>
         
         <!-- 게시물 수정 폼 -->
         <form id="commentForm" class="commentForm" name="" action="memo.do" method="get">
            <input type="hidden" name="no" value="${vo.no }"/>
            <input type="hidden" name="cmd" value="modifyOk"/>
            <div id=${vo.no }>
               <fieldset>
                  <legend>댓글 수정</legend>
                  <div class="commentFormTop">
                     <strong>비밀번호 :</strong>
                     <input id="comment_password" name="pw" value="" type="password">
                  </div>
                  <div class="view">
                     <textarea id="comment_modify" name="contents">${vo.contents }</textarea>
                     <div class="submit">
                        <button type="submit" class="modifyOkBtn btn_blue">수정</button>
                        <button type="button" class="cancelBtn btn_red">취소</button>
                     </div>
                  </div>               
               </fieldset>
            </div>
         </form>
         <!-- // 게시물 수정 폼 -->
         
         <!-- 게시물 내용 -->
         <div class="comment">
            ${vo.contents }
         </div>
         
         <!-- 삭제 버튼 클릭 시 노출되는 비밀번호 확인 폼 -->
         <div class="delete_inPw">
         	<form action="memo.do">
            	<strong>비밀번호 :</strong>
            	<input id="delete_pw" name="pw" value="" type="password" />
            	<input type="hidden" name="cmd" value="deleteOk" />
            	<input type="hidden" name="no" value="${vo.no }" />
            	<div class="button">
               		<input type="submit" class="deleteOkBtn btn_red" value="삭제 확인" />
               		<button type="button" class="deleteCancelBtn btn_blue">삭제 취소</button>
            	</div>
         </form>
         </div>
      </li>
      </c:forEach>
   </ul>
   <!-- // 게시물 리스트 -->
   
		<div class="commentTop" id="numbering">
					<c:if test="${pageVO.pre }">
						<a href="memo.do?currentPage=${pageVO.currentPage-5}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}"	end="${pageVO.endPage}">
     					 <a href="memo.do?currentPage=${i}">${i} &nbsp;&nbsp;&nbsp;</a>
   					</c:forEach>
   					<c:if test="${pageVO.next }">
						<a href="memo.do?currentPage=${pageVO.currentPage+5}">[다음]</a>
					</c:if>
		</div>


		<form id="commentWriteForm" class="commenteWriteForm" name="" action="" method="post">
      <!-- 댓글권한 있음 -->
      <div class="">
         <fieldset>
            <legend>댓글 입력</legend>
            <div>
               <div class="commentWriteTop1">
                  <strong>댓글달기</strong>
               </div>
               <div class="commentWriteTop2">
               	  <input type="hidden" name="cmd" value="writeOk"/>
                  <strong>이름 :</strong>
                  <input id="comment_name" name="writer" class="inputTypeText" value="" type="text" />
                  <strong>비밀번호 :</strong>
                  <input id="comment_password" name="pw" value="" type="password" />
               </div>
            </div>
            <div class="view">
               <textarea id="comment" name="contents"></textarea>
               <input type="submit" class="writeBtn" value="글쓰기" />
            </div>
         </fieldset>
      </div>
   </form>
</div>
</body>
</html>