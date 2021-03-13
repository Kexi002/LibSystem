<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>图书资料管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/light.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/select.css">
    <link href="${pageContext.request.contextPath}/css/toastr.min.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script><!-- jquery文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bundle.js" async defer></script>
</head>
<body class="bg-grey-lighter font-sans antialiased">
<div class="fixed bg-grey-lighter pin z-50 flex justify-center items-center" id="loading">
    <img src="${pageContext.request.contextPath}/img/cheche.jpg" style="width: 100px; height: 100px; border-radius: 50%" id="logo">
</div>

<%--顶部导航栏--%>
<jsp:include page="top-navbar.jsp"/>

<%--主体--%>
<div class="flex">
    <!-- 侧边导航栏 -->
    <jsp:include page="side-navbar.jsp"></jsp:include>
    <!-- 内容 -->
    <div class="flex flex-1 flex-col md:px-6 pt-10" id="content">
        <!-- 标题 -->
        <div class="px-6 md:px-0 flex justify-between items-center -order-1">
            <div>
                <h2 class="font-normal">修改密码</h2>
                <p class="text-grey-dark mt-2">Change password</p>
            </div>

            <button class="mr-8 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-8 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                    onclick="window.location.href='javascript:history.go(-1)'">
                返回
            </button>
        </div>

        <!-- 图书信息 -->
        <div class=" hidden px-6 md:px-0 mt-4 md:flex md:shadow-md js-tab-pane"
             id="section-stats">
            <div class="p-4 px-6 w-full flex flex-row rounded md:rounded-r-none bg-white shadow-md md:shadow-none">
                <div class="w-full ml-8">
                    <table class=" w-full">
                        <tbody class="leading-loose text-md">
                        <tr class="">
                            <td class="py-3">密码</td>
                            <td class="">
                                <input id="password" maxlength="20" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="password"
                                       placeholder="请输入新密码，6-20位英文字符和数字">
                            </td>
                            <td class="pl-6 w-2/5">
                                <div id="password_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">确认密码</td>
                            <td class="">
                                <input id="passwordConfirm" maxlength="20" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="password"
                                       placeholder="请再次输入新密码">
                            </td>
                            <td class="pl-6">
                                <div id="passwordConfirm_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="w-full flex justify-end mt-6">
            <button id="btn_update_password" class=" mr-6 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-6 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">
                保存修改
            </button>
        </div>
    </div>

    <!-- 用户资料栏 -->
    <jsp:include page="side-profile.jsp"/>


</div>

<script>
    $(function () {
        var flags = [false, false];

        $("#password").keyup(function () {
            flags[0] = false;
            var password = $(this).val();
            var regex = /^[\S]{6,20}$/;
            if (!regex.test(password)){
                showMsg("password", "密码格式错误", false);
                return;
            }
            if($("#passwordConfirm").val() !== "" && password !== $("#passwordConfirm").val()){
                showMsg("passwordConfirm", "两次输入的密码不一致", false);
                return;
            }
            if($("#passwordConfirm").val() !== "" && password == $("#passwordConfirm").val()){
                showMsg("passwordConfirm", "", true);
                flags[1] = true;
            }
            showMsg("password", "", true);
            flags[0] = true;
        })

        $("#passwordConfirm").keyup(function () {
            flags[1] = false;
            var passwordConfirm = $(this).val();
            var regex = /^[\S]{6,20}$/;
            if (!regex.test(passwordConfirm)){
                showMsg("passwordConfirm", "密码格式错误", false);
                return;
            }
            if(passwordConfirm !==  $("#password").val()){
                showMsg("passwordConfirm", "两次输入的密码不一致", false);
                return;
            }
            showMsg("passwordConfirm", "", true);
            flags[1] = true;
        })

        $("#btn_update_password").click(function () {
            var check = true;
            for (var flag in flags){
                if (!flags[flag]){
                    check = false;
                    break;
                }
            }
            if (!check){
                toastr.error("保存失败！请按要求修改密码","", {"onHidden":function () {
                        return;
                    }});
            }else {
                var password = $("#password").val();
                var json = {
                    id:${userInfo.account.id},
                    password:password
                }
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/account/updatePassword.do",
                    contentType: 'application/json',
                    data:JSON.stringify(json),
                    success: function() {
                        toastr.success("密码修改成功，请重新登录","", {"onHidden":function () {
                                window.location.href="${pageContext.request.contextPath}/logout.do"
                            }});
                    }
                });
            }
        })

    })

    //验证是否全部通过
    function showMsg(id, msg, isSuccess){
        if (isSuccess){
            $("#"+id+"_msg").html(
                "                <img class=\"h-8\" src='${pageContext.request.contextPath}/img/icon/true.png'>\n" +
                "                    <p class=\"ml-2\">"+ msg +"</p>"
            );
        }else {
            $("#"+id+"_msg").html(
                "                <img class=\"h-8\" src='${pageContext.request.contextPath}/img/icon/false.png'>\n" +
                "                    <p class=\"ml-2\">"+ msg +"</p>"
            );
        }
    }

    /*select展开*/
    $(function () {
        $("#gender").val("${userInfo.userDetail.gender}");

        var select_flag = true;
        $("#gender").blur(function () {
            $("#gender").removeClass("opened");
            select_flag = true;
        })

        $("#gender").click(function (){
            if (select_flag){
                $("#gender").addClass("opened");
                select_flag = false;
            }else {
                $("#gender").removeClass("opened");
                select_flag = true;
            }
        })
    })

    /*搜索框*/
    $(function (){
        if (${!empty condition}){
            $("#condition").val("${condition}");
        } else {
            $("#condition").attr("placeholder","搜索你想找的书，按书名、作者、出版社或类别查询")
        }

        $("#condition").keydown(function (event) {
            if (event.keyCode == 13){
                if($("#condition").val() === ""){
                    location.href = "${pageContext.request.contextPath}/book/find.user.do?page=1&size=12"
                } else{
                    var condition = $("#condition").val();
                    location.href = "${pageContext.request.contextPath}/book/find.user.do?page=1&size=12&condition="
                        + condition;
                }
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
            "timeOut" : "1000",//展现时间
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
