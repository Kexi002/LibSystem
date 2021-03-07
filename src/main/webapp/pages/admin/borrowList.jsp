<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>查询所有的借书</h3>

<c:forEach items="${borrowList}" var="borrow">

    id: ${borrow.id}
    借书时间：<fmt:formatDate value="${borrow.borrowDate}" pattern="yyyy-MM-dd"/>
    归还时间：<fmt:formatDate value="${borrow.returnDate}" pattern="yyyy-MM-dd"/>
    ${borrow.renewStr}
    <br>
</c:forEach>
</body>
</html>