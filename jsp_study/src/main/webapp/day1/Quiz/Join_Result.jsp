<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
		
		out.println("<div>아이디 : " + userId + "</div>");
		out.println("<div>비밀번호 : " + pwd + "</div>");
		out.println("<div>이름 : " + userName + "</div>");
		out.println("<div>핸드폰 : " + phone + "</div>");
		if(gender.equals("M")) {
			out.println("<div>성별 : 남자 </div>");
		} else {
			out.println("<div>성별 : 여자 </div>");
		}		
	%>
	<!-- <div>성별 : <%=   /*gender.equals("M") ? "남자" : "여자"*/ %></div> -->
	<div>취미 : <%= Arrays.toString(hobby).equals("null") ? "없음" : Arrays.toString(hobby) %></div>
</body>
</html>