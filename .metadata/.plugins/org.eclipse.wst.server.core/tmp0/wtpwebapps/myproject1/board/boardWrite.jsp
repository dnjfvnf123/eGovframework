<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width:400px;
 	border-collapse:collapse; /* cell 사이 간격을 없앰 */
}
th, td {
    border: 1px solid #cccccc;
    padding: 10px; /* Adjust the padding according to your preference */
    text-align: center; /* Align text to the left for better readability */
}
</style>

<body>

<form name="frm" method = "post" action = "boardWriteSave.do">
<table>
	<tr>
		<th>게시글 번호</th>
		<td><input type ="text" name = "deptno"></td>		
	</tr>

	<tr>
		<th>제목</th>
		<td><input type ="text" name = "title"></td>		
	</tr>

	<tr>
		<th>내용</th>
		<td><input type ="text" name = "content"></td>		
	</tr>

	<tr>
		<th colspan = "2">
		<button type = "submit">저장</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>