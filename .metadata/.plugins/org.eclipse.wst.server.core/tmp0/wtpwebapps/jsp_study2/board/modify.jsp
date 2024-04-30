<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<h1>Boarder Modify Page</h1>


<form method="post" action="/brd/update" enctype="multipart/form-data">
<table class="table table-info table-hover table-bordered">
<tr class="table-active">
<td>번호</td>
<td><input type="text" name="bno" value="${bvo.bno }" readonly="readonly"></td>
</tr>
<tr>
<td class="table-active">제목</td>
<td><input type="text" name="title" value="${bvo.title }"></td>
</tr>
<tr>
<td class="table-active">내용</td>
<td> <textarea rows="10" cols="30" name="content">${bvo.content }</textarea> <img alt="" src="/_fileUpload/${bvo.imageFile }"> </td>
</tr>
<tr>
<td>imageFile</td>
<td> 
<input type="hidden" name="imageFile" value="${bvo.imageFile }">
<input type="file" name="newFile"> 
</td>
</tr>
<tr>
<td class="table-active">작성자</td>
<td><input type="text" name="writer" value="${bvo.writer }" readonly="readonly"></td>
</tr>
</table>
<button type="submit" class="btn btn-outline-success">수정하기</button>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>