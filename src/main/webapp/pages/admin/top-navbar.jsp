<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-default row no-yj">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="margin-left: 25px">图书资料管理系统</a>
        </div>
        <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1" style="margin-right: 75px">
            <ul class="nav navbar-nav">
                <li><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="height: 50px">
                    <span class="pull-left nav-username" style="color: #808080 !important;">当前管理员为：${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</span></a>

                    <ul class="dropdown-menu dropdown-menu-right clearfix" style="padding-top: 0px; min-width: 100%">
                        <li>
                            <div style="padding-top: 5px">
                                <a href="${pageContext.request.contextPath}/logout.do" class="btn btn-flat no-yj" style="width: 100%; height: 100%">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
