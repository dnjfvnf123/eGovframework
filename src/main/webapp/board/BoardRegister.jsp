<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 리스트</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".pagination a").click(function (e) {
                e.preventDefault();
                var url = $(this).attr("href");
                $.get(url, function (data) {
                    $("tbody").html(data);
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <h1>게시판 리스트</h1>

    <div class="row mb-3">
        <div class="col">
            <form class="form-inline">
                <div class="form-group mr-2">
                    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요">
                </div>
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
        <div class="col text-right">
            <a href="/write" class="btn btn-success">글쓰기</a>
        </div>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>게시 날짜</th>
            <th>게시글 번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>글쓴이</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${boardList}" var="board" varStatus="status">
            <tr>
                <td>${board.id}</td>
                <td>${board.createdDate}</td>
                <td>${board.title}</td>
                <td>${board.content}</td>
                <td>${board.writer}</td>
                <td>${board.view_cnt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="/board?page=1">이전</a></li>
        <li class="page-item"><a class="page-link" href="/board?page=1">1</a></li>
        <li class="page-item"><a class="page-link" href="/board?page=2">2</a></li>
        <li class="page-item"><a class="page-link" href="/board?page=3">3</a></li>
        <li class="page-item"><a class="page-link" href="/board?page=2">다음</a></li>
    </ul>
</div>
</body>
</html>
