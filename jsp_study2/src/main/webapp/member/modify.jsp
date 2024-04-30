<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1>Member Modify Page</h1>

<form method="post" action="/memb/update">
<table class="table table-info table-hover table-bordered">
<tr>
<td class="table-active">ID</td>
<td><input type="text" name="id" value="${ses.id }" readonly="readonly"></td>
</tr>
<tr>
<td class="table-active">PW</td>
<td><input type="text" name="pwd" value="${ses.pwd }"></td>
</tr>
<tr>
<td class="table-active">E-mail</td>
<td><input type="text" name="email" value="${ses.email }"></td>
</tr>
<tr>
<td class="table-active">나이</td>
<td><input type="number" name="age" value="${ses.age }"></td>
</tr>
<tr>
<td class="table-active">Phone</td>
<td><input type="text" name="phone" value="${ses.phone }"></td>
</tr>
</table>
<button type="submit" class="btn btn-outline-success" onclick="clickPopUp(`수정`)">수정</button>
<a href="/memb/delete"><button type="button" class="btn btn-outline-success" onclick="clickPopUp(`탈퇴`)">회원탈퇴</button></a>
<a href="../index.jsp"><button type="button" class="btn btn-outline-success">index페이지로 돌아가기</button></a>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


<script type="text/javascript">
function clickPopUp(msg) {
	if(!confirm("정말로 "+msg+"하시겠습니까?")){
		event.preventDefault();
	}
}
</script>

</body>
</html>