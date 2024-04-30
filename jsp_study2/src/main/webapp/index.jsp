<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style type="text/css">
.hello{
margin: 70px 0 100px;
text-align: center;
}

.loginTable{
margin: 0 auto;
}

.loginBox{
width :100px;
height :100px;
margin: 10px auto;
display: flex;
flex-direction : column;
justify-content: space-around;
align-items: center;
}

.memberInfo{
display: flex;
justify-content: flex-end;
}

.memberInfo>ul{
list-style: none;
display: flex;
margin-right: 150px;
}

.memberInfo>ul>li{
padding-right: 10px; 
}
.welcomeInfo{
font-size: 20px;
}

.nav{
width: 300px;
height: 300px;
margin: 50px auto;
display: flex;
flex-direction: column;
}

.nav>ul{
list-style: none;
padding: 0;
}

.nav>ul>li{
padding: 20px 0;
font-weight: 700;
text-align: center;
}



</style>
</head>
<body>
<h1 class="hello">페이지에 오신것을 환영합니다.</h1>

<c:if test="${ses.id eq null }">
<form method="post" action="/memb/login">
<table border="1" class=".table-striped-columns loginTable">
<tr>
<td>ID &nbsp; : </td>
<td><input type="text" name="id"></td>
</tr>
<tr>
<td>PW&nbsp; : </td>
<td><input type="password" name="pwd"></td>
</tr>
</table>
<div class="loginBox">
<button type="submit" class="btn btn-outline-success">로그인</button>
<a href="/memb/join"> <button  type="button" class="btn btn-outline-success">회원가입</button> </a> 
</div>
</form>
</c:if>

<c:if test="${ses.id ne null }">
<div class="memberInfo">
<h2 class="welcomeInfo">${ses.id }님 환영합니다.</h2>
<ul>
<li>
<a href="/memb/list"> <button type="button" class="btn btn-outline-success">회원정보리스트</button> </a> 
</li>
<li>
<a href="/memb/modify"> <button type="button" class="btn btn-outline-success">회원정보수정</button> </a> 
</li>
<li>
<a href="/memb/logout"> <button type="button" class="btn btn-outline-success">로그아웃</button> </a>
</li>
</ul>
</div>
</c:if>



<div class="nav">
<ul>
<c:if test="${ses.id ne null }">
<li>
<a href="/brd/register"><button type="button" class="btn btn-primary">글쓰러가기</button></a> <br>
</li>
<li>
<a href="/brd/myList"><button type="button" class="btn btn-primary">내가 적은 글 보러가기</button></a> <br>
</li>
</c:if>
<li>
<a href="/brd/list"><button type="button" class="btn btn-primary">리스트 보러가기</button> </a>
</li>
</ul>
</div>


<script type="text/javascript">
const joinMsg = `<c:out value="${joinMsg}"/>`;
const userId = `<c:out value="${ses.id}"/>`;
const loginMsg = `<c:out value="${loginMsg}"/>`;
const logoutMsg = `<c:out value="${logoutMsg}"/>`;
const modifyMsg = `<c:out value="${modifyMsg}"/>`;
const deleteMsg = `<c:out value="${deleteMsg}"/>`;


if(joinMsg == "ok"){
	alert("회원가입이 완료되었습니다.");
}

if(loginMsg == "false"){
	alert("아이디나 비밀번호가 정확하지 않습니다. 다시입력해주세요.");
}

if(loginMsg == "true"){
	alert(userId+"님환영합니다.");
}

if(logoutMsg == "ok"){
	alert("로그아웃이 완료되었습니다.");
}


if(modifyMsg == "ok"){
	alert("회원정보 수정이 완료되었습니다. 다시 로그인해주세요.");
}

if(deleteMsg == "ok"){
	alert("회원탈퇴가 정상적으로 완료되었습니다.");
}


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>