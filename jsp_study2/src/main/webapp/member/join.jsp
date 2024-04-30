<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
button {
	padding: 20px;
}
</style>
</head>
<body>

<h1>Member Join Page</h1>


<form  method="post" action="/memb/insert"  name="frm" onsubmit="return checkform()">
<table class="table table-info table-hover table-bordered">
<tr>
<th class="table-active">ID :</th>
<th><input type="text" name="id"></th>
</tr>
<tr>
<th class="table-active">PW :</th>
<th><input type="text" name="pwd"></th>
</tr>
<tr>
<th class="table-active">E-mail :</th>
<th><input type="text" name="email"></th>
</tr>
<tr>
<th class="table-active">나이 :</th>
<th><input type="text" name="age"></th>
</tr>
<tr>
<th class="table-active">핸드폰 :</th>
<th><input type="number" name="phone" placeholder="'-' 포함" maxlength="11"></th>
</tr>
<tr>
<th> <a href="../index.jsp"> <button type="button" class="btn btn-outline-success">취소</button> </a> </th>
<th> <button type="submit" class="btn btn-outline-success">회원가입</button> </th>
</tr>
</table>
</form>

<script type="text/javascript">

function checkform() {
	

//id validation

if(frm.id.value ==""){
	frm.id.focus();
	alert("ID를 입력해주세요.");
	return false;
}else if(frm.id.value.length<=3){
	frm.id.focus();
	alert("ID는 4글자 이상로 입력해주세요.");
	return false;
}

//PassWord Validation

if(frm.pwd.value==""){
	frm.pwd.focus();
	alert("비밀번호를 입력해주세요.");
	return false;
}else if(frm.pwd.value.length<=4){
	frm.pwd.focus();
	alert("비밀번호는 5글자 이상으로 입력해주세요.");
	return false;
}

//Phone Validation

if(frm.phone.value.length != 11 || frm.phone.value.length != 0)){
	frm.phone.focus();
	alert("전화번호 형식에 맞게 입력해주세요");
	return false;
}

}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>