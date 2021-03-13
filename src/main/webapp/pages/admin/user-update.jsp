<%@ page import="com.kexi.util.defaultValue" %>
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
    <link href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
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
                        <li class="active">用户修改</li>
                    </c:if>
                    <c:if test="${!empty condition}">
                        <li><a href="${pageContext.request.contextPath}/user/find.do?page=1&size=7">查询全部</a></li>
                        <li><a href="javascript:history.go(-1)">按条件查询</a></li>
                        <li class="active">用户修改</li>
                    </c:if>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-10 col-md-offset-2" style="margin-top: 50px; height: 600px">
    <div class="panel panel-3" style="; margin-left: 15px; margin-right: 15px;margin-bottom: 0">
        <div class="panel-heading" style="padding-top: 0!important;">
            <h3 style="margin-top: 10px">用户修改</h3>
            <hr style="margin-top: 0; margin-bottom: 0">
        </div>
        <div class="panel-body" style="margin-top: -10px;height: 540px; padding-top: 5px; padding-bottom: 5px;overflow-y: auto">
            <form id="form_img" role="form">
                <div class="col-md-4" style="float: left;">
                </div>
            </form>
            <div class="col-md-7">
                <form id="form_main" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="realName">姓名</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="realName" id="realName" placeholder="请输入真实姓名" maxlength="15" value="${userInfo.realName}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="gender">性别</label>
                        <div  class="col-md-6">
                            <select id="gender" name="gender" class="selectpicker">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="phoneNum">电话号码</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="phoneNum" id="phoneNum" placeholder="请输入电话号码" maxlength="11" value="${userInfo.userDetail.phoneNum}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="email">电子邮箱</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="email" id="email" placeholder="请输入正确的电子邮箱" maxlength="32" value="${userInfo.userDetail.email}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div  class="col-md-8 col-md-offset-2" style="margin-top: 0">
                            <button type="button" class="btn btn-info" onclick="check()"
                                    style="padding-left: 20px; padding-right: 20px">保存修改</button>
                            <button type="button" class="btn btn-default" id="btn_reload"
                                    style="margin-left: 5px; padding-left: 20px;padding-right: 20px">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#btn_reload").click(function () {
            location.reload();
        })
    })

    /*选择框设初始值*/
    $(function () {
        $("#gender").selectpicker("val","${userInfo.userDetail.gender}");
        $("#gender").selectpicker({size: 2});
    })

    function check(){
        var checkFlag = true;
        var realName = $("#realName").val();
        if (realName === ""){
            toastr.error("请填写真实姓名");
            checkFlag = false;
        }
        var phoneNum = $("#phoneNum").val();
        if (phoneNum === ""){
            toastr.error("请填写电话号码");
            checkFlag = false;
        }else {
            var regex = /^[0-9]{8,11}$/;
            if (!regex.test(phoneNum)){
                toastr.error("电话号码格式错误！请填写8-11位的电话号码");
                checkFlag = false;
            }
        }
        var email = $("#email").val();
        if (email === ""){
            toastr.error("请填写电子邮箱");
            checkFlag = false;
        }else {
            var regex = /^\w+[@]\w+[.]\w+$/;
            if (!regex.test(email)){
                toastr.error("电子邮箱格式错误！请填写格式正确的电子邮箱地址");
                checkFlag = false;
            }
        }
        if (!checkFlag){
            return;
        }
        var gender = $("#gender").val();
        var json = {
            id:${userInfo.id},
            realName:realName,
            userDetail:{
                id: ${userInfo.userDetail.id},
                gender:gender,
                phoneNum:phoneNum,
                email:email
            }
        };
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/update.do",
            contentType: 'application/json',
            data:JSON.stringify(json),
            success: function() {
                toastr.success("用户信息修改成功","", {"onHidden":function () {
                        window.location.reload();
                }});
            }
        });
    }

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

</script>
</body>
</html>
