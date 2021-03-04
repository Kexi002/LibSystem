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
                        <li class="active">用户详情</li>
                    </c:if>
                    <c:if test="${!empty condition}">
                        <li><a href="${pageContext.request.contextPath}/user/find.do?page=1&size=7">查询全部</a></li>
                        <li><a href="javascript:history.go(-1)">按条件查询</a></li>
                        <li class="active">用户详情</li>
                    </c:if>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-10 col-md-offset-2" style="margin-top: 50px;">
    <div class="panel panel-3" style="margin-left: 15px; margin-right: 15px">
        <div class="panel-heading" style="padding-top: 0;">
            <h3>用户详情</h3>
            <hr style="margin-top: 0; margin-bottom: 0">
        </div>
        <div class="panel-body" style="height: 508px; overflow-y: auto">

            <div class="col-md-5" style="margin-left: 30px; float: left">
                <h3 style="margin-bottom: 0">用户信息</h3>
                <hr style="margin-top: 15px; margin-bottom: 15px;  width:auto">
                <div style="float: left">
                    <p style="font-size: 17px; margin-bottom: 20px">姓名：</p>
                    <p style="font-size: 17px; margin-bottom: 20px">性别：</p>
                    <p style="font-size: 17px; margin-bottom: 20px">电话号码：</p>
                    <p style="font-size: 17px; margin-bottom: 20px">邮箱：</p>
                </div>
                <div style="float: left; margin-left: 20px" >
                    <p style="font-size: 17px; margin-bottom: 20px">${userInfo.realName}</p>
                    <p style="font-size: 17px; margin-bottom: 20px">${userInfo.userDetail.gender}</p>
                    <p style="font-size: 17px; margin-bottom: 20px">${userInfo.userDetail.phoneNum}</p>
                    <p style="font-size: 17px; margin-bottom: 20px">${userInfo.userDetail.email}</p>
                </div>
            </div>
            <div class="col-md-5" style="float: left">
                <h3 style="margin-bottom: 0">账户信息</h3>
                <hr style="margin-top: 15px; margin-bottom: 15px;  width:auto">
                <div style="float: left">
                    <p style="font-size: 17px; margin-bottom: 20px">学号：</p>
                    <p style="font-size: 17px; margin-bottom: 20px">用户名：</p>
                    <p style="font-size: 17px; margin-bottom: 20px">权限：</p>
                </div>
                <div style="float: left; margin-left: 20px" >
                    <p style="font-size: 17px; margin-bottom: 20px">${userInfo.account.studentId}</p>
                    <p style="font-size: 17px; margin-bottom: 20px">${userInfo.account.username}</p>
                    <p style="font-size: 17px; margin-bottom: 20px">${userInfo.account.authorityName}</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    /*下拉框动画*/
    $(function () {
        $("#user_menu > a").addClass("nav-left-dropdown-a");
        $("#user_menu > a").addClass("nav-left-bottom-border");
        $("#user_menu > a").next("ul").addClass("nav-left-dropdown-ul").slideDown(0);
        $("#user_menu > a").attr("d", "2");
        $("#user_menu > a").attr("style", "color:#08A5E0 !important");
        $("#user_menu_find").attr("style", "color:#08A5E0 !important");

        $(".dropdownMenu").dropdown();
        $(".nav-left-dropdown>a").click(function () {


            if ($(this).attr("d") != 1 && $(this).attr("d") != undefined) {
                $(this).removeClass("nav-left-dropdown-a");
                $this = $(this);
                $(this).next("ul").slideUp(300, function () { $this.removeClass("nav-left-bottom-border"); $this.removeClass("nav-left-dropdown-ul") });
                $(this).attr("d", "1");
                $(this).attr("style", "color:#777777 !important");
            } else {
                $(this).addClass("nav-left-dropdown-a");
                $(this).addClass("nav-left-bottom-border");
                $(this).next("ul").addClass("nav-left-dropdown-ul").slideDown(300);
                $(this).attr("d", "2");
                $(this).attr("style", "color:#08A5E0 !important");
            }
        })
    });
</script>
</body>
</html>