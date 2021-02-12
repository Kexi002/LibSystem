<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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

    <div class="row" style="margin-top:72px">
        <div class=" nav-left col-md-2 no-padding" id="nav-list-left">
            <div class="user-panel">
                <img src="${pageContext.request.contextPath}/img/cheche.jpg" class="img-circle center-block" />
            </div>

            <div class="nav-list" >
                <ul>
                    <li>
                        <a href="#">首页</a>
                    </li>
                    <li class="nav-left-dropdown">
                        <a href="#">图书管理</a>
                        <ul class="nav-left-dropdown-menu">
                            <li><a href="#">查询和修改</a></li>
                            <li><a href="#">新书入库</a></li>
                        </ul>
                    </li>
                    <li class="nav-left-dropdown">
                        <a href="#">借阅管理</a>
                        <ul class="nav-left-dropdown-menu">
                            <li><a href="#">查询和修改</a></li>
                            <li><a href="#">新建借阅</a></li>
                            <li><a href="#">选项3</a></li>
                        </ul>
                    </li>
                    <li class="nav-left-dropdown">
                        <a href="#">用户管理</a>
                        <ul class="nav-left-dropdown-menu">
                            <li><a href="#">查询和修改</a></li>
                            <li><a href="#">账号管理</a></li>
                            <li><a href="#">选项3</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">分类3</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="navbar-fixed-top">
        <nav class="navbar navbar-default row no-yj">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="margin-left: 25px">图书资料管理系统</a>
                </div>

                <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1" style="margin-right: 75px">
                    <ul class="nav navbar-nav">
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="height: 50px">
                            <span class="pull-left nav-username">当前管理员为：${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</span></a>

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

        <div class="col-md-10 col-md-offset-2">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
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

        <div class="main-right col-md-10 col-md-offset-2 navbar-fixed-top" style="margin-top: 150px;">
            <div class="col-md-11"
                 style="margin-top: 20px;margin-left: 20px;height: 50px;
         border-top: 2px solid #08A5E0;
            padding-top: 10px">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <td>序号</td>
                        <td>名称</td>
                        <td>年龄</td>
                        <td>性别</td>
                        <td>住址</td>
                        <td>QQ</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                </table>
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
                $(this).next("ul").slideUp(300, function () { $this.removeClass("nav-left-bottrom-border"); $this.removeClass("nav-left-dropdown-ul") });

                $(this).attr("d", "1");

            } else {
                $(this).addClass("nav-left-dropdown-a");
                $(this).addClass("nav-left-bottrom-border");
                $(this).next("ul").addClass("nav-left-dropdown-ul").slideDown(300);
                $(this).attr("d", "2");
            }
        })
    });
</script>

</body>
</html>
