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
                    <li><a href="${pageContext.request.contextPath}/account/find.do?page=1&size=7">查询全部</a></li>
                    <li><a href="javascript:history.go(-1)">按条件查询</a></li>
                    <li class="active">账户修改</li>
                </ol>
            </div>
        </div>
    </div>
</div>


<div class="col-md-10 col-md-offset-2" style="margin-top: 70px;">
    <form class="form-horizontal" role="form">
        <div class="panel panel-3" style="margin-left: 15px; margin-right: 15px">
            <div class="panel-heading"><h3>账户修改</h3></div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-1 control-label" for="studentId">学号</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="studentId" id="studentId" placeholder="请输入15位数字的学号" maxlength="15" value="${account.studentId}"/>
                        </div>
                        <div id="studentId_msg" style="margin-top: 7px"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 control-label" for="username">用户名</label>
                        <div  class="col-md-4">
                            <input type="text" class="form-control" name="username" id="username" placeholder="请输入4-10位英文字母和数字的用户名" maxlength="10" value="${account.username}"/>
                        </div>
                        <div id="username_msg" style="margin-top: 7px">
<%--                            <span class='glyphicon glyphicon-ok' style='color: #5cb85c !important; margin-right: 2px'></span>
                            我是成功信息--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 control-label">密码</label>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-info" style="padding-left: 20px; padding-right: 20px"
                                    id="btn_updatePassword">修改密码</button>
                        </div>
                    </div>
                </div>
            </div>
        <div  style="margin-top: 70px; margin-left: 200px">
            <button type="button" id="btn_updateAccount_confirm" class="btn btn-info" style="padding-left: 20px; padding-right: 20px;">修改账户</button>
            <button type="button" id="btn_updateAccount_reset" class="btn btn-default" style="padding-left: 40px; padding-right: 40px; margin-left: 5px">重置</button>
        </div>
    </form>
</div>

<%--隐藏的修改密码--%>
<div class="modal fade" id="model_updatePassword">
    <div class="modal-dialog" style="margin-top: 250px;">
        <div class="modal-content message_align">
            <div class="modal-header" style="height: 50px">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >修改密码</h4>
            </div>
            <div class="modal-body" style="height: 200px;">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label col-md-2">密码</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" name="password" id="password" placeholder="请输入6-16位字符的密码" maxlength="15"/>
                        </div>
                        <div id="password_msg" style="margin-top: 7px">
                        <%--我是提示信息--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2">确认密码</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="请再次输入密码" maxlength="10"/>
                        </div>
                        <div id="passwordConfirm_msg" style="margin-top: 7px"></div>
                    </div>
                </form>
                <div style="float: right; margin-top: 25px">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="padding-left: 20px; padding-right: 20px"
                    >取消</button>
                    <button type="button" class="btn btn-primary" id="btn_updatePassword_confirm" style="margin-left: 5px;padding-left: 20px; padding-right: 20px"
                    >确认</button>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    //验证是否全部通过
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

    /*验证学号和用户名是否能够修改*/
    $(function () {

        //因为有可能只改了一个，所以两个keyup不会都触发
        var accountFlags = [true, true];

        var enableUpdateAccount = false;

        function validateUpdateAccount(){
            for (var accountFlag in accountFlags){
                if (!accountFlags[accountFlag]){
                    enableUpdateAccount = false;
                    return;
                }
            }
            enableUpdateAccount = true;
        }

        $("#studentId").keyup(function () {
            accountFlags[0] = false;
            var studentId = $(this).val();
            //正则判断格式是否正确
            var regex = /^[0-9]{15}$/;
            if (! regex.test(studentId)){
                showMsg("studentId", "学号格式错误", false);
                return;
            }
            //判断是否和当前一样，一样就不进行ajax查询
            if (studentId == "${account.studentId}"){
                showMsg("studentId", "", true);
                accountFlags[0] = true;
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
                    accountFlags[0] = true;
                }
            })
        })

        $("#username").keyup(function () {
            accountFlags[1] = false;
            var username = $(this).val();
            //正则判断格式是否正确
            var regex = /^[a-zA-Z0-9]{4,10}$/;
            if (! regex.test(username)){
                showMsg("username", "学号格式错误", false);
                return;
            }
            //判断是否和当前一样，一样就不进行ajax查询
            if (username == "${account.username}"){
                showMsg("username", "", true);
                accountFlags[1] = true;
                return;
            }
            //ajax查询是否重复
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
                    accountFlags[1] = true;
                }
            })
        })

        $("#btn_updateAccount_confirm").click(function () {
            validateUpdateAccount();
            if (enableUpdateAccount){
                if ($("#studentId").val() === "${account.studentId}" && $("#username").val() === "${account.username}"){
                    toastr.error("账户信息和原账户一样");
                }else{
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/account/update.do",
                        contentType:"application/json;charset=UTF-8",
                        data:'{"id":"${account.id}","studentId":"'+
                            $("#studentId").val() +
                            '", "username":"'+$("#username").val()+
                            '", "password":"${account.password}"}',
                        data_type:"json",
                        success:function () {
                            toastr.success("账户修改成功","", {"onHidden":function () {
                                    location.reload();
                                }});
/*                            setTimeout(function () {
                                location.reload();
                            }, 1500)*/
                        }
                    })
                }
            }else {
                toastr.error("账户修改失败！");
            }
        })

        $("#btn_updateAccount_reset").click(function () {
            $("#studentId").val("${account.studentId}");
            $("#username").val("${account.username}");
            $("#studentId_msg").html("");
            $("#username_msg").html("")
        })
    })

    /*验证密码是否能够修改*/
    $(function () {
        var passwordFlags = [false, false];

        var enableUpdatePassword = false;

        $("#btn_updatePassword").click(function (){
            //重置flag，清空提示信息和密码，否则下次会失效
            passwordFlags = [false, false];
            enableUpdatePassword = false;
            $("#password").val("");
            $("#passwordConfirm").val("");
            $("#password_msg").html("");
            $("#passwordConfirm_msg").html("");
            $("#model_updatePassword").modal();
        });

        function validateUpdatePassword(){
            for (var passwordFlag in passwordFlags){
                if (!passwordFlags[passwordFlag]){
                    enableUpdatePassword = false;
                    return;
                }
            }
            enableUpdatePassword = true;
        }

        $("#password").keyup(function () {
            passwordFlags[0] = false;
            var password = $(this).val();
            var regex = /^[\S]{6,16}$/;
            if (! regex.test(password)){
                showMsg("password", "密码格式错误", false);
                return;
            }
            if($("#passwordConfirm").val() !== "" && password !== $("#passwordConfirm").val()){
                showMsg("passwordConfirm", "两次输入的密码不一致", false);
                return;
            }
            if($("#passwordConfirm").val() !== "" && password == $("#passwordConfirm").val()){
                showMsg("passwordConfirm", "", true);
                passwordFlags[1] = true;
            }
            showMsg("password", "", true);
            passwordFlags[0] = true;
        })

        $("#passwordConfirm").keyup(function () {
            passwordFlags[1] = false;
            var passwordConfirm = $(this).val();
            var regex = /^[\S]{6,16}$/;
            if (! regex.test(passwordConfirm)){
                showMsg("passwordConfirm", "密码格式错误", false);
                return;
            }
            if(passwordConfirm !==  $("#password").val()){
                showMsg("passwordConfirm", "两次输入的密码不一致", false);
                return;
            }
            showMsg("passwordConfirm", "", true);
            passwordFlags[1] = true;
        })

        $("#btn_updatePassword_confirm").click(function (){
            //验证flag
            validateUpdatePassword();
            if (enableUpdatePassword){
                //ajax发信息修改密码
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/account/updatePassword.do",
                    contentType:"application/json;charset=UTF-8",
                    data:'{"id":"${account.id}","password":'+ $("#password").val() +'}',
                    data_type:"json",
                    success:function () {
                        $("#model_updatePassword").modal("hide");
                        toastr.success("密码修改成功");
                    }
                })
            }else {
                toastr.error("密码修改失败！")
            }
        });
    })

    /*toastr配置*/
    $(function() {
        toastr.options = {
            "closeButton": true,//是否显示关闭按钮
            "debug": false,//是否使用debug模式
            "positionClass": "toast-center-center",//弹出窗的位置
            "onclick": null,
            "showDuration": "300",//显示的动画时间
            "hideDuration": "1000",//消失的动画时间
            "timeOut": "2000",//展现时间
            "extendedTimeOut": "1000",//加长展示时间
            "showEasing": "swing",//显示时的动画缓冲方式
            "hideEasing": "linear",//消失时的动画缓冲方式
            "showMethod": "fadeIn",//显示时的动画方式
            "hideMethod": "fadeOut" //消失时的动画方式
        };
    });

    /*下拉框动画*/
    $(function () {
        $(".dropdownMenu").dropdown();
        $(".nav-left-dropdown>a").click(function () {


            if ($(this).attr("d") != 1 && $(this).attr("d") != undefined) {
                $(this).removeClass("nav-left-dropdown-a");
                $this = $(this);
                $(this).next("ul").slideUp(300, function () {
                    $this.removeClass("nav-left-bottrom-border");
                    $this.removeClass("nav-left-dropdown-ul")
                });

                $(this).attr("d", "1");

            } else {
                $(this).addClass("nav-left-dropdown-a");
                $(this).addClass("nav-left-bottrom-border");
                $(this).next("ul").addClass("nav-left-dropdown-ul").slideDown(300);
                $(this).attr("d", "2");
            }
        });
    });
</script>

</body>
</html>

