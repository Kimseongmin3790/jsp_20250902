<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
		width: 600px;
		margin: 20px auto;
	}
	table, tr, td, th {
		border : 1px solid black;
		/* text-align: center; */
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th {
		background-color: #ccc;
		width : 100px;
	}
	td {
		width : 500px;
	}
	.contents {
		height : 300px;
	}
	.input-txt {
		width: 95%;
		height: 25px;
	}
</style>
</head>
<body>
	<div id="container">
	<%
		String sessionId = (String) session.getAttribute("sessionId");
	%>
		<form name="board" action="Board-Add-Result.jsp">
			<table>
				<tr>
					<th>게시글종류</th>
					<td>
						<select name="kind">
							<option value="1">공지사항</option>
							<option value="2">자유게시판</option>
							<option value="3">문의게시판</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" class="input-txt"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<%= sessionId %> <input type="text" name="userId" class="input-txt" value="<%= sessionId %>" hidden>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="contents">
						<textarea rows="20" cols="60" name="contents"></textarea>
					</td>
				</tr>
			</table>
			<div>
				<input type="button" value="작성" onclick="fnAdd()">
			</div>
		</form>
	</div>
</body>
</html>
<script>
	function fnAdd() {
		let form = document.board;
		form.submit();
	}
</script>