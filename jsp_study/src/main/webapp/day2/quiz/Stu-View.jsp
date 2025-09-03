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
</style>
</head>
<body>
	<%@ include file="../../db/db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		String query = "SELECT S.STU_NO, STU_NAME, STU_DEPT, NVL(AVG(ENR_GRADE), 0) AVG "
						+ "FROM STUDENT S LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO "
						+ "GROUP BY S.STU_NO, STU_NAME, STU_DEPT HAVING S.STU_NO = " + stuNo;
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()) {
	%>
		<div id="container">
			<form name="board" action="Stu-Remove.jsp">
				<input name="stuNo" value="<%= rs.getString("STU_NO") %>" hidden>
				<table>
					<tr>
						<th>학번</th>
						<td><%= rs.getString("STU_NO") %></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><%= rs.getString("STU_NAME") %></td>
					</tr>
					<tr>
						<th>학과</th>
						<td><%= rs.getString("STU_DEPT") %></td>
					</tr>
					<tr>
						<th>시험 평균점수</th>
						<td><%= rs.getString("AVG") %></td>
					</tr>
				</table>
				<div>
					<!-- <input type="submit" value="삭제"> -->
					<input type="button" value="삭제" onclick="fnRemove()">
				</div>
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
</script>