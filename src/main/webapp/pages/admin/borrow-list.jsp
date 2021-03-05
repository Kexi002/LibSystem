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
<div class="container-fluid">
    <jsp:include page="side-navbar.jsp"/> <%--侧边栏文件--%>

    <div class="navbar-fixed-top">
        <jsp:include page="top-navbar.jsp"/> <%--顶部栏文件--%>

        <div class="col-md-10 col-md-offset-2">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="javascript:history.go(-1)">继续添加借书</a></li>
                    <li class="active">借书单</li>
                </ol>
            </div>

            <div class="col-md-12">
                <div class="btn-group" style="float: left; margin-left: 15px">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        当前操作用户为：${nowBorrowUserName}<span class="caret" style="margin-left: 10px"></span>
                    </button>
                    <ul class="dropdown-menu" style="width: 100%">
                        <li><a href="${pageContext.request.contextPath}/borrow/deleteNowBorrowUser.do">更换当前操作用户</a></li>
                    </ul>
                </div>

                <div class="btn-group" style="float: left; margin-left: 15px">
                    <button type="button" class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath}/borrow/findBook.do'">继续添加借书</button>
                </div>

                <div class="btn-group" style="float: right; margin-right: 140px;">
                    <button type="button" class="btn btn-success" onclick="borrow()" style=" padding-left: 20px; padding-right: 20px">确认借书</button>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="col-md-10 col-md-offset-2" style="margin-top: 110px;">
    <div class="col-md-11"
         style="margin-left: 20px;border-top: 2px solid #08A5E0; border-bottom: 2px solid #08A5E0;height: 500px;overflow-y: auto;">
        <table class="table table-hover table-inner-border" style="table-layout: fixed;width: 100%;">
            <thead>
            <tr>
                <th style="width: 7%; text-align: center;">序号</th>
                <th style="width: 20%; text-align: center;">图片预览</th>
                <th>书名</th>
                <th>分类</th>
                <th>作者</th>
                <th>出版社</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody style="">
            <c:forEach items="${bookInfoList}" var="bookInfo" varStatus="s">
                <tr>
                    <td style="text-align: center;vertical-align: middle !important;">${s.count}</td>
                    <td style="text-align: center;vertical-align: middle !important;"><img src="${pageContext.request.contextPath}/img/bookImage/${bookInfo.bookDetail.image}" style="width: 60%"></td>
                    <td style="vertical-align: middle !important;">${bookInfo.bookName}</td>
                    <td style="vertical-align: middle !important;">${bookInfo.category} ${bookInfo.categoryStr}</td>
                    <td style="vertical-align: middle !important;">${bookInfo.author}</td>
                    <td style="vertical-align: middle !important;">${bookInfo.publisher}</td>
                    <td style="vertical-align: middle !important;">
                        <button class="btn-sm btn-info" onclick="window.location.href = '${pageContext.request.contextPath}/borrow/listDetail.do?id=${bookInfo.id}'">详情</button>
                        <button class="btn-sm btn-danger btn_delete" onclick="removeBorrowList(${bookInfo.id})">移除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">

    function removeBorrowList(id){
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/borrow/removeBorrowList.do",
            data:{id:id},
            success: function() {
                toastr.success("移除借书单成功","", {"timeOut" : "1000", "onHidden":function () {
                        window.location.reload();
                }});
            },
        });
    }

    function borrow(){
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/borrow/borrow.do",
            success: function() {
                toastr.success("借书成功","", {"timeOut" : "1000", "onHidden":function () {
                        window.location.href = "${pageContext.request.contextPath}/borrow/find.do?page=1&size=7";
                }});
            },
        });

    }

    /*toastr配置*/
    $(function() {
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

        if (${empty bookInfoList}){
            toastr.warning("借书单里面还没有书");
        }
    });

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
