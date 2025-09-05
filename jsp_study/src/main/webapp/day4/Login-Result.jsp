<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="db.jsp" %>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String query = "SELECT * FROM TBL_USER WHERE USERID = '" + id + "' AND PASSWORD = '" + pwd + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		if (rs.next()) {
			String userId = rs.getString("USERID");
			String status = rs.getString("STATUS");
			
			session.setAttribute("sId", id); // 세션에 아이디를 넣는 코드
			session.setAttribute("status", status); // 세션에 권한을 넣는 코드
			
			// session.setMaxInactiveInterval(60 * 30); 30분동안 세션을 유지하는 코드
			
			response.sendRedirect("Emp-list.jsp"); // 자바에서 해당 링크로 이동할때 쓰는 코드
		} else {
			out.println("로그인 실패");
		}
	%>
</body>
</html>