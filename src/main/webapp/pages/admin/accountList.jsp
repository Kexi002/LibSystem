<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>查询所有的账户</h3>

<c:forEach items="${accountList}" var="account">
    ${account.toString()}
    <br>
</c:forEach>
</body>
</html>