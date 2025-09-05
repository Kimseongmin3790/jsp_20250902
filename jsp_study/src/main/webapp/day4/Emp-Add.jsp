<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input[readOnly] {
		background-color: #eee;
		border : 2px solid #eee;
	}
</style>
</head>
<body>
	<form name="form" action="Emp-Add-Result.jsp">
		<div>
			<label>사번 : <input name="empNo"></label>
			<input type="button" value="중복체크" onclick="fnCheck(); return false">
		</div>
		<div>
			<label>이름 : <input name="empName"></label>
		</div>
		<div>
			<label>급여 : <input name="sal"></label>
		</div>
		<div>
			<label><input name="deptNo" type="radio" value="10" checked> ACCOUNTING</label>
			<label><input name="deptNo" type="radio" value="20"> RESEARCH</label>
			<label><input name="deptNo" type="radio" value="30"> SALES</label>
			<label><input name="deptNo" type="radio" value="40"> OPERATIONS</label>
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	let addFlg = false;
	
	function fnAdd() {
		let form = document.form;
		if(addFlg) {
			form.submit();
		} else {
			alert("중복체크 후 추가해주세요.");	
		}
	}
	function fnCheck() {
		let form = document.form;
		let empNo = form.empNo.value;
		window.open(`No-Check.jsp?empNo=\${empNo}`, "check", "width=300, height=300");
	}
	function fnReturn(flg) {
		let form = document.form;
		if (flg == "N") {
			let empNo = form.empNo;
			empNo.readOnly = true;
			addFlg = true;
		}
	}
</script>