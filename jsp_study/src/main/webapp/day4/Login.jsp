<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form" action="Login-Result.jsp">
		<div>
			아이디 : <input type="text" name="id">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<input type="submit" value="submit로그인">
		<input type="button" value="btn로그인" onclick="fnLogin()">
	</form>
</body>
</html>
<script>
	function fnLogin() {
		let form = document.form;
		let id = form.id.value;
		let pwd = form.pwd.value;
		
		if(id.length == 0 || pwd.length == 0) {
			alert("아이디나 비밀번호가 입력되지 않았습니다.");
			return;
		}
		form.submit();
	}
</script>