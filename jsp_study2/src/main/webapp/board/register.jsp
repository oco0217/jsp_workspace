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
.boardBox{
width: 1000px;
height: 300px;
margin: 50px auto;
}



.boardBox .inputVal{
outline: none;
width: 90%;
height: 90%;
padding: 20px 0;
}

.boarderInfo{
margin: 50px 0 100px;

}

#writer{
outline: none;

}

.btnBox{
width: 200px;
height: 50px;
margin: 50px auto;
}
</style>

</head>

<body>


<div class="boardBox">
<h1 class="boarderInfo">!!Board Register Page!!</h1>
<!-- enctype="multipart.form-data"  : 이미지 파일을 가져갈 때 사용하는 타입  -->
<!-- 파일 : 종류/확장자 image/jpg  image/png -->
<form  method="post" action="/brd/insert" enctype="multipart/form-data">
<table  class="table table-info table-hover table-bordered">
<tr>
<td> <input type="text" class="inputVal" name="title" placeholder="제목을 입력" ></td>
</tr>
<tr>
<td> <textarea rows="10" cols="30" class="inputVal" name="content" placeholder="내용 입력"></textarea> </td>
</tr>
<tr>
<td>작성자 : <input type="text" id="writer" name="writer" value="${ses.id }" readonly="readonly" ></td>
</tr>
<tr>
<td>첨부파일 :  <input type="file" name="imageFile" accept="image/png, image/jpg, image/gif, image/jpeg"> </td>
</tr>
</table>
<div class="btnBox">
<button type="submit" class="btn btn-outline-success">글쓰기</button>
 <a href="../index.jsp"><button type="button" class="btn btn-outline-success">취소</button></a> 
</div>
</form>
</div>

<script type="text/javascript">



</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>