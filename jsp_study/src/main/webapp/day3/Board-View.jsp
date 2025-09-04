<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
		width: 500px;
		margin: 20px auto;
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th {
		background-color: #ccc;
		width : 100px;
	}
	td {
		background-color: beige;
		width : 500px;
	}
	.contents {
		height : 300px;
	}
</style>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	<%	
		String status = (String) session.getAttribute("sessionStatus");
		String id = (String) session.getAttribute("sessionId");
		String boardNo = request.getParameter("boardNo");
		String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') D FROM TBL_BOARD B WHERE BOARDNO = '" + boardNo + "'";
		ResultSet rs = stmt.executeQuery(query);
		if(rs.next()) {
	%>
		<div id="container">
			<form name="board" action="Board-Remove.jsp">
				<input name="boardNo" value="<%= rs.getString("BOARDNO") %>" hidden>
				<table>
					<tr>
						<th>제목</th>
						<td><%= rs.getString("TITLE") %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%= rs.getString("USERID") %></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%= rs.getString("D") %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="contents"><%= rs.getString("CONTENTS") %></td>
					</tr>
				</table>
	<%
				if(id.equals(rs.getString("USERID")) || status.equals("A")) {
	%>
				<div>
					<input type="button" value="수정" onclick="fnEdit()">
					<input type="button" value="삭제" onclick="fnRemove()">
				</div>
	<%
				}
	%>
			</form>
		</div>
	<%		
		} else {
			out.println("게시글 조회에 실패했습니다.");
		}
	%>
</body>
</html>
<script>
	function fnRemove() {
		let board = document.board;
		if (!confirm("정말 삭제하시겠습니까?")) {
			return;
		}
		
		board.submit();
	}
	
	function fnEdit() {
		let board = document.board;
		board.action = "Board-Edit.jsp";
		board.submit();
	}
</script>