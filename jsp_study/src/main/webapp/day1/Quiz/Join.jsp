<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="join" action="Join_Result.jsp">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input type="password" name="checkPwd"></label>
		</div>
		<div>
			<label>이름 : <input name="userName"></label>
		</div>
		<div>
			핸드폰 : 
			<select name="phone"><option>010</option> </select>
		</div>
		<div>
			성별 : <input type="radio" name="gender">남 <input type="radio" name="gender">여
		</div>
		<div>
			취미 :
			<label><input type="checkbox" name="hobby" value="운동">운동</label>
			<label><input type="checkbox" name="hobby" value="게임">게임</label>
			<label><input type="checkbox" name="hobby" value="코딩">코딩</label>
			<label><input type="checkbox" name="hobby" value="독서">독서</label>
			<label><input type="checkbox" name="hobby" value="영화감상">영화감상</label>
		</div>
		<div>
			<input type="button" value="가입" onclick="fnCheck()">
		</div>
	</form>
</body>
</html>
<script>
	function fnCheck() {
		let join = document.join;
		const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		
		if(join.userId.value.length == 0) {
			alert("아이디를 입력해주세요.");
			join.userId.focus();
			return;
		} else if (join.userId.value.length <= 5) {
			alert("아이디는 최소 6글자 이상 입력해주세요");
			join.userId.focus();
			return;
		}
		
		if(join.pwd.value.length == 0) {
			alert("비밀번호를 확인해주세요.");
			join.pwd.focus();
			return;
		} else if(join.pwd.value.length <= 7) {
			alert("비밀번호는 8글자 이상 입력해주세요");
			join.pwd.focus();
			return;
		} else if (!regExp.test(join.pwd.value)) {
			alert("비밀번호는 특수문자가 들어가야합니다")
			return;
		}
		
		if(join.checkPwd.value.equals(join.pwd.value)) {
			
		} else {
			alert("비밀번호가 다릅니다");
			join.checkPwd.focus();
			return;
		}
		 
		if(join.userName.value.length == 0) {
			alert("이름을 입력해주세요.");
			join.userName.focus();
			return;
		}
		login.submit();
	}
	
</script>