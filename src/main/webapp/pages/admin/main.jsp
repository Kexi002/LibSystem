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
                    <li><a href="#">一级目录</a></li>
                    <li><a href="#">二级目录</a></li>
                    <li class="active">当前页面</li>
                </ol>
            </div>

            <div class="col-md-6 col-md-offset-2">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="按XXXXX查询"/>
                    <span class="input-group-btn">
                    <button class="btn btn-blue" type="button" style="padding-left: 50px;padding-right: 50px;">查询</button>
                </span>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="col-md-10 col-md-offset-2" style="margin-top: 120px;">
    <div class="col-md-11"
         style="margin-left: 20px;border-top: 2px solid #08A5E0; height: 440px;overflow-y: auto">
        <table class="table table-hover table-inner-border" style="table-layout: fixed;width: 100%;">
            <thead>
            <tr>
                <th>序号</th>
                <th>名称</th>
                <th>年龄</th>
                <th>性别</th>
                <th>住址</th>
                <th>QQ</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>小易</td>
                <td>21</td>
                <td>男</td>
                <td>china</td>
                <td>123456</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<nav class="navbar-fixed-bottom" style="margin-left: 650px">
    <ul class="pagination">
        <li>
            <a href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>
            <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>

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
