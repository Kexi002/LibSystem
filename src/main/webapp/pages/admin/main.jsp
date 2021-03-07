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
                    <li class="active">首页</li>
                </ol>
            </div>

            <div class="col-md-6 col-md-offset-3">
                <h3>欢迎使用图书管理系统！您需要做什么？</h3>
            </div>
        </div>
    </div>
</div>


<div class="col-md-10 col-md-offset-2" style="margin-top: 120px;">
    <div class="col-md-11"
         style="margin-left: 20px;border-top: 2px solid #08A5E0; height: auto">
        <div class=" col-md-offset-2" style="padding-top: 10px; padding-left: 85px; float: left">
            <button class="btn btn-info" style="float: left; width: 230px; height: 230px;border-Radius:10px"
                    onclick="window.location.href='${pageContext.request.contextPath}/book/find.do'">
                <span class="glyphicon glyphicon-book" style="font-size: 70px; color: white !important;"></span>
                <h1 style="margin-top: 30px">管理图书</h1>
            </button>
            <button class="btn btn-info" style="float: left; width: 230px; height: 230px;border-Radius:10px; margin-left: 10px"
                    onclick="window.location.href='${pageContext.request.contextPath}/borrow/find.do'">
                <span class="glyphicon glyphicon-bookmark" style="font-size: 70px; color: white !important;"></span>
                <h1 style="margin-top: 30px">管理借阅</h1>
            </button>
        </div>
        <div class=" col-md-offset-2" style="padding-top: 10px; padding-left: 85px; float: left">
            <button class="btn btn-info" style="float: left; width: 230px; height: 230px;border-Radius:10px"
                    onclick="window.location.href='${pageContext.request.contextPath}/borrow/main.do'">
                <span class="glyphicon glyphicon-shopping-cart" style="font-size: 70px; color: white !important;"></span>
                <h1 style="margin-top: 30px">新建借阅</h1>
            </button>
            <button class="btn btn-info" style="float: left; width: 230px; height: 230px;border-Radius:10px; margin-left: 10px"
                    onclick="window.location.href='${pageContext.request.contextPath}/user/find.do'">
                <span class="glyphicon glyphicon-user" style="font-size: 70px; color: white !important;"></span>
                <h1 style="margin-top: 30px">管理用户</h1>
            </button>
        </div>


    </div>
</div>

<script type="text/javascript">
    $(function() {
        //设置显示配置
        toastr.options = {
            "closeButton" : true,//是否显示关闭按钮
            "debug" : false,//是否使用debug模式
            "positionClass" : "toast-center-center",//弹出窗的位置
            "onclick" : null,
            "showDuration" : "300",//显示的动画时间
            "hideDuration" : "1000",//消失的动画时间
            "timeOut" : "2000",//展现时间
            "extendedTimeOut" : "1000",//加长展示时间
            "showEasing" : "swing",//显示时的动画缓冲方式
            "hideEasing" : "linear",//消失时的动画缓冲方式
            "showMethod" : "fadeIn",//显示时的动画方式
            "hideMethod" : "fadeOut" //消失时的动画方式
        };
    });

    /*下拉框动画*/
    $(document).ready(function () {
        $("#main_menu").attr("style", "color: #08A5E0 !important;"+
            "    background-color: #fff;" +
            "    border-left: 3px solid #08A5E0;");

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
