<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row" style="margin-top:72px">
    <div class=" nav-left col-md-2 no-padding" id="nav-list-left">
        <div class="user-panel">
            <img src="${pageContext.request.contextPath}/img/cheche.jpg" class="img-circle center-block" />
        </div>

        <div class="nav-list" >
            <ul>
                <li id="testli">
                    <a id="main_menu" href="${pageContext.request.contextPath}/pages/admin/main.jsp">首页</a>
                </li>
                <li class="nav-left-dropdown" id="book_menu">
                    <a href="#">图书管理</a>
                    <ul class="nav-left-dropdown-menu">
                        <li><a id="book_menu_find" href="${pageContext.request.contextPath}/book/find.do">查询和修改</a></li>
                        <li><a id="book_menu_save" href="${pageContext.request.contextPath}/pages/admin/book-save.jsp">新书入库</a></li>
                    </ul>
                </li>
                <li class="nav-left-dropdown" id="borrow_menu">
                    <a href="#">借阅管理</a>
                    <ul class="nav-left-dropdown-menu">
                        <li><a id="borrow_menu_find" href="${pageContext.request.contextPath}/borrow/find.do">查询和修改</a></li>
                        <li><a id="borrow_menu_main" href="${pageContext.request.contextPath}/borrow/main.do">新建借阅</a></li>
                    </ul>
                </li>
                <li class="nav-left-dropdown" id="user_menu">
                    <a href="#">用户管理</a>
                    <ul class="nav-left-dropdown-menu">
                        <li><a id="user_menu_find" href="${pageContext.request.contextPath}/user/find.do">查询和修改</a></li>
                        <li><a id="user_menu_save" href="${pageContext.request.contextPath}/pages/admin/user-save.jsp">新建用户</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
