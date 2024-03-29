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
                    <c:if test="${empty condition}">
                        <li class="active">查询全部</li>
                    </c:if>
                    <c:if test="${!empty condition}">
                        <li><a href="${pageContext.request.contextPath}/user/find.do?page=1&size=${pageInfo.pageSize}">查询全部</a></li>
                        <li class="active">按条件查询</li>
                    </c:if>
                </ol>
            </div>

            <div class="col-md-6 col-md-offset-2">
                <div class="input-group">
                    <input type="text" class="form-control" id="condition"/>
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
                <th style="width: 7%">序号</th>
                <th>学号</th>
                <th>用户名</th>
                <th>姓名</th>
                <th style="width: 30%">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="userInfo" varStatus="s">
                <tr>
                    <td>${s.count + pageInfo.pageSize * (pageInfo.pageNum - 1)}</td>
                    <td>${userInfo.account.studentId}</td>
                    <td>${userInfo.account.username}</td>
                    <td>${userInfo.realName}</td>
                    <td>
                        <button class="btn-sm btn-info" onclick="window.location.href = '${pageContext.request.contextPath}/user/detail.do?id=${userInfo.id}&condition=${condition}'">详情</button>
                        <button class="btn-sm btn-warning" onclick="window.location.href = '${pageContext.request.contextPath}/user/goUpdate.do?id=${userInfo.id}&condition=${condition}'">修改用户信息</button>
                        <button class="btn-sm btn-warning" onclick="window.location.href = '${pageContext.request.contextPath}/account/goUpdate.do?id=${userInfo.account.id}&condition=${condition}'">修改账户</button>
                        <button class="btn-sm btn-danger btn_delete" onclick="confirmDelete(${userInfo.id})">删除</button>
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
        <%--<li><a href="${pageContext.request.contextPath}/user/find.do?page=1&size=${pageInfo.pageSize}&condition=${condition}">首页</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/user/find.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&condition=${condition}"  aria-label="Previous">&laquo;</a></li>
        <%--如果长度小于7，直接完整显示--%>
        <c:if test="${pageInfo.pages <= 7}">
            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageNum}</a></li>
            </c:forEach>
        </c:if>
        <%--如果长度大于7，则分三种情况：靠近首页、靠近尾页和在中间--%>
        <c:if test="${pageInfo.pages > 7}">
            <%--更靠近首页，且当前页离首页只有3格（4）--%>
            <c:if test="${((pageInfo.pageNum - 1) < 4) && ((pageInfo.pageNum - 1) <= (pageInfo.pages - pageInfo.pageNum))}">
                <%--如果离首页不到3格，则按照当前页为4显示--%>
                <c:if test="${pageInfo.pageNum < 4}">
                    <c:forEach begin="1" end="6" var="pageNum">
                        <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageNum}</a></li>
                    </c:forEach>
                </c:if>
                <%--当前页为4或以上--%>
                <c:if test="${pageInfo.pageNum >= 4}">
                    <c:forEach begin="1" end="${pageInfo.pageNum + 2}" var="pageNum">
                        <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageNum}</a></li>
                    </c:forEach>
                </c:if>
                <li><a href="#">...</a></li>
                <li id="page_${pageInfo.pages}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageInfo.pages}</a></li>
            </c:if>
            <%--更靠近尾页，且当前页离尾页只有不到3格--%>
            <c:if test="${((pageInfo.pages - pageInfo.pageNum) < 4) && ((pageInfo.pageNum - 1) > (pageInfo.pages - pageInfo.pageNum))}">
                <li id="page_1"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">1</a></li>
                <li><a href="#">...</a></li>
                <c:if test="${pageInfo.pageNum > (pageInfo.pages - 3)}">
                    <c:forEach begin="${pageInfo.pages - 5}" end="${pageInfo.pages}" var="pageNum">
                        <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageNum}</a></li>
                    </c:forEach>
                </c:if>
                <c:if test="${pageInfo.pageNum <= (pageInfo.pages - 3)}">
                    <c:forEach begin="${pageInfo.pageNum - 2}" end="${pageInfo.pages}" var="pageNum">
                        <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageNum}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <%--当前页在中间位置--%>
            <c:if test="${(pageInfo.pageNum - 1 >= 4) && ((pageInfo.pages - pageInfo.pageNum) >= 4)}">
                <li id="page_1"><a href="${pageContext.request.contextPath}/user/find.do?page=1&size=${pageInfo.pageSize}&condition=${condition}">1</a></li>
                <li><a href="#">...</a></li>
                <c:forEach begin="${pageInfo.pageNum - 2}" end="${pageInfo.pageNum + 2}" var="pageNum">
                    <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}">${pageNum}</a></li>
                </c:forEach>
                <li><a href="#">...</a></li>
                <li id="page_${pageInfo.pages}"><a href="${pageContext.request.contextPath}/user/find.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&condition=${condition}">${pageInfo.pages}</a></li>
            </c:if>
        </c:if>
        <li><a href="${pageContext.request.contextPath}/user/find.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&condition=${condition}" aria-label="Next">&raquo;</a></li>
        <%--<li><a href="${pageContext.request.contextPath}/user/find.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&condition=${condition}">尾页</a></li>--%>
    </ul>
</nav>

<%--隐藏的警告框--%>
<div class="modal fade" id="model_delete">
    <div class="modal-dialog" style="margin-top: 250px">
        <div class="modal-content message_align">
            <div class="modal-header" style="height: 50px">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >提示</h4>
            </div>
            <div class="modal-body" style="height: 100px">
                <div style="font-size: 16px; float: left;">您确认要删除该用户吗？<div style="float: right;color: red">该用户相关的账号以及借阅信息也会被一并删除！</div></div>
                <div style="margin-top: 10px;float: right">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="padding-left: 20px; padding-right: 20px"
                    >取消</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="btn_delete_confirm" style="margin-left: 5px;padding-left: 20px; padding-right: 20px"
                    >确认</button>
                </div>
            </div>
        </div>
    </div>
</div>

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
        location.href = "${pageContext.request.contextPath}/user/find.do?page=1&size="
            + pageSize + "&condition=${condition}";
    }

    /*搜索框*/
    $(function (){
        if (${!empty condition}){
            $("#condition").val("${condition}");
        } else {
            $("#condition").attr("placeholder","按学号或用户名查询")
        }
    });

    function findByCondition(){
        if($("#condition").val() == ""){
            location.href = "${pageContext.request.contextPath}/user/find.do?page=1&size=${pageInfo.pageSize}"
        } else{
            var condition = $("#condition").val();
            location.href = "${pageContext.request.contextPath}/user/find.do?page=1&size="+
                ${pageInfo.pageSize} +"&condition="
                + condition;
        }
    }

    /*删除警告*/
    function confirmDelete(id){
        $("#btn_delete_confirm").click(function (){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/user/delete.do",
                data:{id:id},
                success:function () {
                    toastr.success("删除成功", "", {"timeOut":"1000","onHidden":function () {
                            window.location.reload();
                        }});
                }
            })
        })
        $("#model_delete").modal();
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

        if (${empty pageInfo.list}){
            toastr.error("没有找到对应的查询结果");
        }
    });

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
