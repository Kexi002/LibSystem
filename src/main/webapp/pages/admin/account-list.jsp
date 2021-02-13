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
                    <input type="text" class="form-control" id="condition" placeholder="按学号或用户名查询"/>
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-blue" id="findByCondition" onclick="findByCondition()"
                            style="padding-left: 50px;padding-right: 50px;">查询</button>
                </span>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="col-md-10 col-md-offset-2" style="margin-top: 120px;">
    <div class="col-md-11"
         style="margin-left: 20px;border-top: 2px solid #08A5E0; border-bottom: 2px solid #08A5E0;height: 405px;overflow-y: auto;">
        <table class="table table-hover table-inner-border" style="table-layout: fixed;width: 100%;">
            <thead>
            <tr>
                <th>序号</th>
                <th>学号</th>
                <th>用户名</th>
                <th>权限</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="account" varStatus="s">
                <tr>
                    <td>${s.count + pageInfo.pageSize * (pageInfo.pageNum - 1)}</td>
                    <td>${account.studentId}</td>
                    <td>${account.username}</td>
                    <td>${account.authorityStr}</td>
                    <td>
                        <button class="btn-sm btn-warning" href="#">修改</button>
                        <button class="btn-sm btn-danger" href="#">删除</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <div style="float: left; margin-top: 10px; margin-left: -20px">
        <div class="form-group form-inline"  style="margin-left: 50px;">
            共<b>${pageInfo.pages}</b>页，共<b>${pageInfo.total}</b>条数据。每页
            <select class="form-control" id="changePageSize" onchange="changePageSize()">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>10</option>
                <option>20</option>
            </select>
            条
        </div>
    </div>
</div>



<nav class="navbar-fixed-bottom" style="text-align:center;margin-bottom: 15px" >
    <ul class="pagination">
        <li>
            <a href="${pageContext.request.contextPath}/account/find.do?page=1&size=${pageInfo.pageSize}&condition=${condition}">首页</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/account/find.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&condition=${condition}"  aria-label="Previous">&laquo;</a></li>
        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
            <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/account/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageNum}</a></li>
        </c:forEach>
        <li><a href="${pageContext.request.contextPath}/account/find.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&condition=${condition}" aria-label="Next">&raquo;</a></li>
        <li>
            <a href="${pageContext.request.contextPath}/account/find.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&condition=${condition}">尾页</a>
        </li>
    </ul>
</nav>

<script type="text/javascript">

    /*设置页数相关*/
    $(function (){
        //设置当前页的class为active
        $("#page_${pageInfo.pageNum}").addClass("active");
        //设置当前页的显示条数
        if ("${pageInfo.pageSize}" > 7 && "${pageInfo.pageSize}" < 10){
            $("#changePageSize").val(10);
        } else if("${pageInfo.pageSize}" > 10 && "${pageInfo.pageSize}" < 20){
            $("#changePageSize").val(20);
        } else{
            $("#changePageSize").val("${pageInfo.pageSize}");
        }
    });

    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();
        //向服务器发送请求，改变每页显示条数
        location.href = "${pageContext.request.contextPath}/account/find.do?page=1&size="
            + pageSize + "&condition=${condition}";
    }

    /*搜索框*/
    $(function (){
       $("#condition").val("${condition}");
    });

    function findByCondition(){
        if($("#condition").val() == ""){
            location.href = "${pageContext.request.contextPath}/account/find.do?page=1&size=${pageInfo.pageSize}"
        } else{
            var condition = $("#condition").val();
            location.href = "${pageContext.request.contextPath}/account/find.do?page=1&size="+
                ${pageInfo.pageSize} +"&condition="
                + condition;
        }
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
