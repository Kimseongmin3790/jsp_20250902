<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	
	<%
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_USER";
		/* String query = "SELECT * FROM TBL_USER WHERE USERID = '" + id + "' " + "AND PASSWORD = '" + pwd + "'"; */
		rs = stmt.executeQuery(query);
		
		boolean flg = false;
		while(rs.next()){
			if (rs.getString("USERID").equals(id) && rs.getString("PASSWORD").equals(pwd)) {
				flg = true;
			}
		}
		
		if(!flg) {
			out.println("<h2 style='color:red;'>로그인 실패</h2>");
		} else {
			response.sendRedirect("Main.jsp");
		}
	%>
	
</body>
</html>