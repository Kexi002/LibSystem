<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>图书资料管理系统</title>
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
                    <li><a href="javascript:history.go(-1)">返回借书单</a></li>
                    <li class="active">图书详情</li>
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
            <img class="col-md-4" src="${pageContext.request.contextPath}/img/bookImage/${bookInfo.bookDetail.image}" style="float: left;width: 390px; height: auto">
            <div class="col-md-6" style="margin-left: 30px">
                <h2 style="margin-bottom: 0"><strong>${bookInfo.bookName}</strong></h2>
                <hr style="margin-top: 15px; margin-bottom: 15px;  width:600px">
                <div style="float: left">
                    <p style="font-size: 17px; margin-bottom: 10px">作者：</p>
                    <p style="font-size: 17px; margin-bottom: 10px">出版社：</p>
                    <p style="font-size: 17px; margin-bottom: 10px">分类：</p>
                    <p style="font-size: 17px; margin-bottom: 10px">ISBN：</p>
                    <p style="font-size: 17px; margin-bottom: 10px">出版日期：</p>
                </div>
                <div style="float: left; margin-left: 20px" >
                    <p style="font-size: 17px; margin-bottom: 10px">${bookInfo.author}</p>
                    <p style="font-size: 17px; margin-bottom: 10px">${bookInfo.publisher}</p>
                    <p style="font-size: 17px; margin-bottom: 10px">${bookInfo.category} ${bookInfo.categoryStr}</p>
                    <p style="font-size: 17px; margin-bottom: 10px">${bookInfo.bookDetail.isbn}</p>
                    <p style="font-size: 17px; margin-bottom: 10px">${bookInfo.bookDetail.publicationDate}</p>
                </div>
                <div style="clear:both"></div>
                <hr style="margin-top: 5px; margin-bottom: 15px" width="600px">
                <div style="float: left">
                    <p style="font-size: 17px; margin-bottom: 10px">馆藏地址：</p>
                    <p style="font-size: 17px; margin-bottom: 10px">可借余量：</p>
                </div>
                <div style="float: left; margin-left: 20px">
                    <p style="font-size: 17px; margin-bottom: 10px">${bookInfo.bookDetail.location}</p>
                    <c:if test="${bookInfo.bookDetail.number == 0}">
                        <p class="text-danger" style="font-size: 17px; margin-bottom: 10px">该书无可借余量</p>
                    </c:if>
                    <c:if test="${bookInfo.bookDetail.number != 0}">
                        <p style="font-size: 17px; margin-bottom: 10px">${bookInfo.bookDetail.number}</p>
                    </c:if>
                </div>
                <div style="clear:both"></div>
                <hr style="margin-top: 5px; margin-bottom: 15px" width="600px">
                <div style="float: left">
                    <p style="font-size: 17px; margin-bottom: 5px">简介：</p>
                    <p style="font-size: 17px;">${bookInfo.bookDetail.intro}</p>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
    /*下拉框动画*/
    $(function () {
        $("#borrow_menu > a").addClass("nav-left-dropdown-a");
        $("#borrow_menu > a").addClass("nav-left-bottom-border");
        $("#borrow_menu > a").next("ul").addClass("nav-left-dropdown-ul").slideDown(0);
        $("#borrow_menu > a").attr("d", "2");
        $("#borrow_menu > a").attr("style", "color:#08A5E0 !important");
        $("#borrow_menu_main").attr("style", "color:#08A5E0 !important");

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
