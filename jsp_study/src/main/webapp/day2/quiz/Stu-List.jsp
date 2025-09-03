<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
		width: 700px;
		margin: 50px auto;
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th {
		background-color: beige;
	}
	tr:nth-child(even) {
		background-color: antiquewhite;
	}
	tr:nth-child(odd) {
		background-color: #fafafb;
	}
	#search {
		margin-bottom: 20px;
	}
	a {
		text-decoration: none;
		color: black;
	}
	a:hover {
		text-decoration: underline;
		font-weight: bold;
	}
</style>
</head>
<body>
<%@ include file="../../db/db.jsp" %>
	<div id="container">
		<div id="search">
			검색어 : <input type="text" id="keyword">
			<button onclick="fnSearch()">검색</button>
		</div>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>키</th>
			</tr>
		
		<%
			ResultSet rs = null;
			String keyword = request.getParameter("keyword");
			
			String keywordQuery = "";
			if(keyword != null) {
				keywordQuery = "WHERE STU_NAME LIKE '%" + keyword + "%'";
			}
			
			String query = "SELECT * FROM STUDENT " + keywordQuery;
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
		%>
				<tr>
					<td><%= rs.getString("STU_NO") %></td>
					<td>
						<a href="javascript:;" onclick="fnBoard(<%= rs.getString("STU_NO") %>)"><%= rs.getString("STU_NAME") %></a>
					</td>
					<td><%= rs.getString("STU_DEPT") %></td>
					<td><%= rs.getString("STU_HEIGHT") %></td>
				</tr>
		<%
			}
		%>
		</table>
	</div>
</body>
</html>
<script>
	function fnBoard(stuNo) {
		location.href = "Stu-View.jsp?stuNo=" + stuNo;
	}
	function fnSearch() {
		let keyword = document.querySelector("#keyword").value;
		location.href = "Stu-List.jsp?keyword=" + keyword;
	}
</script>