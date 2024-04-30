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

	<h1>Board ${address } Page</h1>


	<!-- Serch Line -->
	<div>
		<form action="/brd/list" method="get">
			<div>
				<select name="type">
					<option ${ph.pgvo.type eq null ? 'selected':'' }>Choose...</option>
					<option value="t" ${ph.pgvo.type eq 't' ? 'selected':'' }>Title</option>
					<option value="w" ${ph.pgvo.type eq 'w' ? 'selected':'' }>Writer</option>
					<option value="c" ${ph.pgvo.type eq 'c' ? 'selected':'' }>Content</option>
				</select>
				
				<input type="text" name="keyword" placeholder="search" value="${ph.pgvo.keyword }">
				<input type="hidden" name="pageNo" value="1">
				<input type="hidden" name="qty" value="${ph.pgvo.qty }">
				<button type="submit">Search</button>
				<span>${ph.totalCount }개 검색결과가 있음</span>
			</div>
		</form>
	</div>

	<table class="table table-info table-hover table-bordered">
		<tr class="table-active">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<c:forEach items="${list }" var="li">
			<tr>
				<td>${li.bno }</td>
				<td><a href="/brd/detail?bno=${li.bno }"> ${li.title } 
				<c:if test="${li.imageFile ne null }">
				<img alt="" src="/_fileUpload/_th_${li.imageFile }"> 
				</c:if>
				</a></td>
				<td>${li.writer }</td>
				<td>${li.regdate }</td>
				<td>${li.readCount }</td>
			</tr>
		</c:forEach>

	</table>

	<a href="../index.jsp">
		<button type="button" class="btn btn-outline-success">index페이지로
			이동</button>
	</a>

	<!-- Paging Line => ph -->

	<div>
		<!-- prev -->

		<c:if test="${ph.prev}">
			<a
				href="/brd/${address }?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">
				≪ </a>
		</c:if>

		<!-- paging -->
		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
			<a href="/brd/${address }?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ${i }
			</a>
		</c:forEach>

		<!-- next -->
		<c:if test="${ph.next}">
			<a href="/brd/${address }?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">
				≫ </a>
		</c:if>
	</div>

	<script type="text/javascript">
		const insertMsg = `<c:out value="${insertMsg}"/>`;

		if (insertMsg == "ok") {
			alert("글이 정상적으로 등록 완료.");
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>