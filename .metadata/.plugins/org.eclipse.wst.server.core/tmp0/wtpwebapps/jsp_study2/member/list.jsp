<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Member List Page</h1>

<table class="table table-info table-hover table-bordered">
<tr class="table-active">
<td>ID</td>
<td>PW</td>
<td>이메일</td>
<td>나이</td>
<td>regdate</td>
<td>LastLogin</td>
</tr>

<c:forEach items="${list }" var="li">
<tr>
<td>${li.id }</td>
<td>${li.pwd }</td>
<td>${li.email }</td>
<td>${li.age }세</td>
<td>${li.regdate }</td>
<td>${li.lastlogin }</td>
</tr>
</c:forEach>

</table>

<a href="../index.jsp"> <button type="button" class="btn btn-outline-success">index페이지로 돌아가기</button> </a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>