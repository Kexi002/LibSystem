<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>在线图书资料管理系统</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script><!-- jquery文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/toastr.min.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/toastr.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="side-navbar.jsp"/> <%--侧边栏文件--%>

    <div class="navbar-fixed-top">
        <jsp:include page="top-navbar.jsp"/> <%--顶部栏文件--%>

        <div class="col-md-10 col-md-offset-2">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <c:if test="${empty condition}">
                        <li><a href="javascript:history.go(-1)">查询全部</a></li>
                        <li class="active">图书详情</li>
                    </c:if>
                    <c:if test="${!empty condition}">
                        <li><a href="${pageContext.request.contextPath}/book/find.do?page=1&size=7">查询全部</a></li>
                        <li><a href="javascript:history.go(-1)">按条件查询</a></li>
                        <li class="active">图书详情</li>
                    </c:if>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-10 col-md-offset-2" style="margin-top: 50px;">
    <div class="panel panel-3" style="margin-left: 15px; margin-right: 15px">
        <div class="panel-heading" style="padding-top: 0;">
            <h3>图书详情</h3>
            <hr style="margin-top: 0; margin-bottom: 0">
        </div>
        <div class="panel-body" style="height: 508px; overflow-y: scroll">
            <img src="${pageContext.request.contextPath}/img/bookImage/${bookInfo.bookDetail.image}">
        </div>
    </div>
</div>
</body>
</html>
