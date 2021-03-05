<%@ page import="com.kexi.util.defaultValue" %>
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
                    <li class="active">新建用户</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-10 col-md-offset-2" style="margin-top: 50px; height: 600px">
    <div class="panel panel-3" style="; margin-left: 15px; margin-right: 15px;margin-bottom: 0">
        <div class="panel-heading" style="padding-top: 0!important;">
            <h3 style="margin-top: 10px">新建用户</h3>
            <hr style="margin-top: 0; margin-bottom: 0">
        </div>
        <div class="panel-body" style="margin-top: -10px;height: 540px; padding-top: 5px; padding-bottom: 5px;overflow-y: auto">
            <div class="col-md-6" style="float: left">
                <form id="form_main" class="form-horizontal" role="form" onkeyup="onEnter()">
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="studentId">学号</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="studentId" id="studentId" placeholder="请输入15位的学号" maxlength="15" onclick="clickEnter()"/>
                        </div>
                        <div id="studentId_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="username">用户名</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="username" id="username" placeholder="请输入4-10位的用户名" maxlength="10" onclick="clickEnter()"/>
                        </div>
                        <div id="username_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="password">密码</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" name="password" id="password" placeholder="请输入6-20位的密码" maxlength="20" onclick="clickEnter()"/>
                        </div>
                        <div id="password_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="passwordConfirm">确认密码</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="请再次输入密码" maxlength="20" onclick="clickEnter()"/>
                        </div>
                        <div id="passwordConfirm_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="authority">权限</label>
                        <div  class="col-md-6">
                            <select id="authority" name="authority" class="selectpicker">
                                <option value="0">用户</option>
                                <option value="1">管理员</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="realName">姓名</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="realName" id="realName" placeholder="请输入真实姓名" maxlength="15" onclick="clickEnter()"/>
                        </div>
                        <div id="realName_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="gender">性别</label>
                        <div  class="col-md-6">
                            <select id="gender" name="gender" class="selectpicker">
                                <option value="">请选择性别</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <div id="gender_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="phoneNum">电话号码</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="phoneNum" id="phoneNum" placeholder="请输入电话号码" maxlength="11" onclick="clickEnter()"/>
                        </div>
                        <div id="phoneNum_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="email">电子邮箱</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="email" id="email" placeholder="请输入正确的电子邮箱" maxlength="32" onclick="clickEnter()"/>
                        </div>
                        <div id="email_msg" style="margin-top: 7px"></div>
                    </div>

                    <div class="form-group">
                        <div  class="col-md-8 col-md-offset-2" style="margin-top: 0">
                            <button type="button" class="btn btn-info" id="btn_confirm_save"
                                    style="padding-left: 20px; padding-right: 20px">确认保存</button>
                            <button type="button" class="btn btn-default" id="btn_reload"
                                    style="margin-left: 5px; padding-left: 20px;padding-right: 20px">重置</button>
                        </div>
                    </div>
                </form>
            </div>

            <%--<div class="col-md-6" style="float: left">
                <form id="form_account" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="realName">姓名</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="realName" id="realName" placeholder="请输入真实姓名" maxlength="15" value="${userInfo.realName}"/>
                        </div>
                        <div id="realName_msg" style="margin-top: 7px">
                            <span class='glyphicon glyphicon-ok' style='color: #5cb85c !important; margin-right: 5px'></span>hello
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="gender">性别</label>
                        <div  class="col-md-4">
                            <select id="gender" name="gender" class="selectpicker">
                                <option value="">请选择性别</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <div id="gender_msg" style="margin-top: 7px">
                            <span class='glyphicon glyphicon-ok' style='color: #5cb85c !important; margin-right: 5px'></span>hello
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="phoneNum">电话号码</label>
                        <div  class="col-md-4">
                            <input type="text" class="form-control" name="phoneNum" id="phoneNum" placeholder="请输入电话号码" maxlength="11" value="${userInfo.userDetail.phoneNum}"/>
                        </div>
                        <div id="phoneNum_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="email">电子邮箱</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="email" id="email" placeholder="请输入正确的电子邮箱" maxlength="32" value="${userInfo.userDetail.email}"/>
                        </div>
                        <div id="email_msg" style="margin-top: 7px"></div>
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
            </div>--%>
        </div>
    </div>
</div>

<script>
    $(function () {
        var flags = [false, false, false, false, false, false, false, false];

        //验证是否全部通过
        $("#btn_confirm_save").click(function(){
            for (var flag in flags){
                if (!flags[flag]){
                    toastr.error("新建用户失败！请按要求填写信息");
                    return;
                }
            }
            //通过
            var studentId = $("#studentId").val();
            var username = $("#username").val();
            var password = $("#password").val();
            var authority = $("#authority").val();
            var realName = $("#realName").val();
            var gender = $("#gender").val();
            var phoneNum = $("#phoneNum").val();
            var email = $("#email").val();
            var json = {
                realName: realName,
                account:{
                    studentId:studentId,
                    username:username,
                    password:password,
                    authority:authority
                },
                userDetail: {
                    gender:gender,
                    phoneNum:phoneNum,
                    email:email,
                }
            };
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/user/save.do",
                contentType: 'application/json',
                data:JSON.stringify(json),
                success: function(id) {
                    toastr.success("新建用户成功","", {"onHidden":function () {
                            window.location.href = "${pageContext.request.contextPath}/user/detail.do?id="+id;
                    }});
                }
            });
        })

        //提示错误信息
        function showMsg(id, msg, isSuccess){
            if (isSuccess){
                $("#"+id+"_msg").html(
                    "<span class='glyphicon glyphicon-ok' style='color: #5cb85c !important; margin-right: 5px'></span>" +
                    msg
                );
            }else {
                $("#"+id+"_msg").html(
                    "<span class='glyphicon glyphicon-remove' style='color: #d9534f !important; margin-right: 2px'></span>" +
                    msg
                );
            }
        }

        $("#studentId").keyup(function () {
            flags[0] = false;
            var studentId = $(this).val();
            //正则判断格式是否正确
            var regex = /^[0-9]{15}$/;
            if (! regex.test(studentId)){
                showMsg("studentId", "学号格式错误", false);
                return;
            }
            //ajax查询是否重复
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/account/checkStudentId.do",
                contentType:"application/json;charset=UTF-8",
                data:'{"studentId":"'+ studentId +'"}',
                data_type:"json",
                //传回一个布尔值，查询数据库是否已有此账户
                success:function (bool) {
                    if(bool){
                        showMsg("studentId", "此学号已被注册", false);
                        return;
                    }
                    //如果正确，重置错误信息
                    showMsg("studentId", "该学号可以使用", true);
                    flags[0] = true;
                }
            })
        })

        $("#username").keyup(function () {
            flags[1] = false;
            var username = $(this).val();
            var regex = /^[a-zA-Z0-9]{4,10}$/;
            if (! regex.test(username)){
                showMsg("username", "用户名格式错误",false);
                return;
            }
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/account/checkUsername.do",
                contentType:"application/json;charset=UTF-8",
                data:'{"username":"'+ username +'"}',
                data_type:"json",
                success:function (bool) {
                    if(bool){
                        showMsg("username", "此用户名已被注册", false);
                        return;
                    }
                    showMsg("username", "该用户名可以使用", true);
                    flags[1] = true;
                }
            })
        })

        $("#password").keyup(function () {
            flags[2] = false;
            var password = $(this).val();
            var regex = /^[\S]{6,20}$/;
            if (! regex.test(password)){
                showMsg("password", "密码格式错误", false);
                return;
            }
            if($("#passwordConfirm").val() !== "" && password !== $("#passwordConfirm").val()){
                showMsg("passwordConfirm", "两次输入的密码不一致", false);
                return;
            }
            showMsg("password", "", true);
            flags[2] = true;
        })

        $("#passwordConfirm").keyup(function () {
            flags[3] = false;
            var passwordConfirm = $(this).val();
            var regex = /^[\S]{6,20}$/;
            if (! regex.test(passwordConfirm)){
                showMsg("passwordConfirm", "密码格式错误");
                return;
            }
            if(passwordConfirm !=  $("#password").val()){
                showMsg("passwordConfirm", "两次输入的密码不一致", false);
                return;
            }
            showMsg("passwordConfirm", "", true);
            flags[3] = true;
        })

        $("#realName").keyup(function () {
            flags[4] = false;
            var realName = $(this).val();
            var regex = /^[\d]{8,11}$/;
            if (realName === ""){
                showMsg("realName", "请填写真实姓名", false);
                return;
            }
            showMsg("realName", "", true);
            flags[4] = true;
        })

        $("#gender").change(function (){
            flags[5] = false;
            var gender = $(this).val();
            if (gender === ""){
                showMsg("gender", "请选择性别", false);
                return;
            }
            showMsg("gender", "", true);
            flags[5] = true;
        })

        $("#phoneNum").keyup(function () {
            flags[6] = false;
            var phoneNum = $(this).val();
            var regex = /^[\d]{8,11}$/;
            if (! regex.test(phoneNum)){
                showMsg("phoneNum", "电话号码格式错误");
                return;
            }
            showMsg("phoneNum", "", true);
            flags[6] = true;
        })

        $("#email").keyup(function () {
            flags[7] = true;
            var email = $(this).val();
            var regex = /^\w+[@]\w+[.]\w+$/;
            if (! regex.test(email)){
                showMsg("email", "邮箱地址格式错误");
                return;
            }
            showMsg("email", "", true);
            flags[7] = true;
        })
    });

    $(function () {
        $("#btn_reload").click(function () {
            location.reload();
        })
    })

    /*选择框设初始值*/
    $(function () {
        $("#authority").selectpicker("val","0");
        $("#gender").selectpicker("val","");
        $("#gender").selectpicker({size: 3});
    })

    /*下拉框动画*/
    $(function () {
        $("#user_menu > a").addClass("nav-left-dropdown-a");
        $("#user_menu > a").addClass("nav-left-bottom-border");
        $("#user_menu > a").next("ul").addClass("nav-left-dropdown-ul").slideDown(0);
        $("#user_menu > a").attr("d", "2");
        $("#user_menu > a").attr("style", "color:#08A5E0 !important");
        $("#user_menu_save").attr("style", "color:#08A5E0 !important");

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

    var index = 0

    function clickEnter() {
        $("input").each(function (i) {
            if ($(this).is(':focus')) {
                index = i
            }
        })
    }

    function onEnter() {
        if (event.keyCode == 13){
            index++
            if (index >= $("input").length) {
                index = 0
            }
            $("input").each(function (i) {
                if (i == index) {
                    $(this).focus()
                }
            })
        }
    }

</script>
</body>
</html>
