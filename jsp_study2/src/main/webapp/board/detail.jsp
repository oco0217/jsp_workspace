<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>

	<h1>Boarder Detail Page</h1>

	<table class="table table-info  table-bordered">
		<tr>
			<td class="table-active">번호</td>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<td class="table-active">제목</td>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<td class="table-active">내용</td>
			<td>${bvo.content } <br>  <img alt="" src="/_fileUpload/${bvo.imageFile }"></td>
		</tr>
		<tr>
			<td class="table-active">작성자</td>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<td class="table-active">작성일</td>
			<td>${bvo.regdate }</td>
		</tr>
		<tr>
			<td class="table-active">수정일</td>
			<td>${bvo.moddate }</td>
		</tr>
		<tr>
		<td class="table-active">조회수</td>
		<td>${bvo.readCount }</td>
		</tr>
	</table>
	<a href="/brd/${address }">
		<button type="button" class="btn btn-outline-success">이전페이지로
			돌아가기</button>
	</a>
	<c:if test="${ses.id eq bvo.writer }">
		<a href="/brd/modify?bno=${bvo.bno }">
			<button type="button" class="btn btn-outline-success">수정</button>
		</a>
		<a href="/brd/delete?bno=${bvo.bno }" >
			<button type="button" class="btn btn-outline-success">삭제</button>
		</a>
	</c:if>


	<!-- Comment Line -->
	<hr>
	<div>
		comment line <br> <input type="text" id="cmtWriter"
			value="${ses.id }" readonly="readonly"> <input type="text"
			id="cmtText" placeholder="Add Comment..">
		<button type="button" id="cmtAddBtn">comment post</button>
	</div>
	<br>
	<hr>

	<!-- 댓글 출력 -->
	<div id="commentLine">
		<div>
			<div>cno, bno, writer, regdate</div>
			<div>
				<button>수정</button>
				<button>삭제</button>
				<br> <input type="text" value="content">
			</div>
		</div>
	</div>


<script type="text/javascript">
const bnoVal = `<c:out value="${bvo.bno}" />`;
const idVal = `<c:out value="${ses.id}" />`;
console.log(bnoVal);
console.log("id잘나오는지 : "+idVal);
</script>

<script type="text/javascript" src="/resources/board_detail.js"></script>

<script type="text/javascript">
printCommentList(bnoVal);
</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>
</html>