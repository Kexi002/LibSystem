<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../resource.jsp"%>
<html>
<head>
    <title>在线图书资料管理系统</title>
</head>
<body style="min-height:800px; height: auto">

    <h3>这是管理员主页</h3>

    <a href="${pageContext.request.contextPath}/account/findAll.do">查询所有账户</a>

    <a href="${pageContext.request.contextPath}/borrow/findAll.do">查询所有借阅</a>

    <%--<img src="${pageContext.request.contextPath}/images/bookImage/20210208.jpg">--%>
</body>
</html>
