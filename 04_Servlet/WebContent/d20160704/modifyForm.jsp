
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, td {
	border: 1px solid black;
}

img {
	width: 40px;
	height: 40px;
	cursor: pointer;
}

table {
	width: 800px;
	text-align: center;
}
</style>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$("img[src='../images/cry.png']").on("click", function(){
			// form 내에서 name 속성을 갖는 모든 값을 action에 정의된 위치로 제출한다.
			$("form").submit();
		});
	});
</script>

</head>
<body>
	<form action="modifyOk.jsp">
		<table>
			<%
				int bno = Integer.parseInt(request.getParameter("bno"));
				BoardDAO dao = new BoardDAO();
				BoardVO vo = dao.selectOne(bno);
			%>

			<tr>
				<td>작성자</td>
				<td colspan=4>
				<input type="text" name="writer" id="" value="<%=vo.getWriter() %>"/>
				<input type="hidden" name="bno" value="<%=vo.getBno()%>"/>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan=4><input type="text" name="title" id="" value="<%=vo.getTitle() %>"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<!-- smart editor의 ir1을 사용하여 UI 생성 -->
				<td colspan=4><textarea name="ir1" id="ir1" cols="100" rows="20" style="width: 766px; height: 410px; display: none;"><%=vo.getContents()%>
				</textarea></td>
			</tr>
			<tr>
				<td colspan=4>
					<!-- smart editor의 submitContent Method를 사용하여 데이터 전달 -->
					<input type="button" value="글쓰기" onclick="submitContents(this)"/>
					<!-- 돌아가기 버튼을 누르면 boardList.jsp로 이동 -->
					<a href="boardList.jsp"><input type="button" value="돌아가기" /></a></td>
				</td>
			</tr>
		</table>
	</form>
	<!-- smart editor 사용을 위한 javascript --> 
	<script type="text/javascript">
		var oEditors = [];

		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "../se2/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});

		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
		}

		function showHTML() {
			var sHTML = oEditors.getById["ir1"].getIR();
			alert(sHTML);
		}

		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}

		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</body>
</html>