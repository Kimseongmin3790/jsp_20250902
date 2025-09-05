<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td, th {
		border : 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<%@ include file="db.jsp"%>
	<%
	String empNo = request.getParameter("empNo");
	// 사번, 이름, 상사(MGR)의 이름, 급여, 소속부서의 평균 급여, 부서 이름
	String query = "SELECT E.EMPNO, E.ENAME, E2.ENAME AS MGR_NAME, E.SAL, ROUND(AVG_SAL, 2) AVG_SAL, D.DNAME "
			 + "FROM EMP E "
			 + "LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO "
			 + "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
			 + "INNER JOIN (SELECT DEPTNO, AVG(SAL) AVG_SAL FROM EMP GROUP BY DEPTNO) T "
			 + "ON E.DEPTNO = T.DEPTNO "
			 + "WHERE E.EMPNO = '" + empNo + "'";
	
	try{
		ResultSet rs = stmt.executeQuery(query);
		if(rs.next()) {
	%>
		<div>
			<form name="form" action="">
				<table>
					<tr>
						<th>사번</th>
						<td><%=rs.getString("EMPNO")%></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><%=rs.getString("ENAME")%></td>
					</tr>
					<tr>
						<th>상사 이름</th>
						<td><%=rs.getString("MGR_NAME")%></td>
					</tr>
					<tr>
						<th>급여</th>
						<td><%=rs.getString("SAL")%></td>
					</tr>
					<tr>
						<th>부서 평균 급여</th>
						<td><%=rs.getString("AVG_SAL")%></td>
					</tr>
					<tr>
						<th>부서 이름</th>
						<td><%=rs.getString("DNAME")%></td>
					</tr>
				</table>
			</form>
		</div>
	<%
		  } else {
			  out.println("데이터 조회에 실패했습니다");
		  }
		
	} catch (SQLException e) {
		out.println("오류가 발생했습니다!");
	}
	%>
</body>
</html>