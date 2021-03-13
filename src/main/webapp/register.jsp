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

<div class="bg-indigo-darker text-center p-4 px-6 flex items-center">
    <div class="hidden lg:block lg:w-1/4 xl:w-1/5 pr-8">
        <a href="#" class="text-lg text-white py-2 hover:text-grey-dark no-underline px-6">图书资料管理系统</a>
    </div>
</div>

<div class="flex">
    <!-- 侧边导航栏 -->
    <div class="w-1/5">

    </div>
    <!-- 内容 -->
    <div class="flex flex-1 flex-col md:px-6 pt-6" id="content">
        <!-- 标题 -->
        <div class="px-6 md:px-0 flex justify-between items-center -order-1">
            <div>
                <h2 class="font-normal">用户注册</h2>
                <p class="text-grey-dark mt-2">Register</p>
            </div>

            <button class="mr-8 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-8 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                    onclick="window.location.href='${pageContext.request.contextPath}/login.jsp'">
                返回登录
            </button>
        </div>

        <!-- 注册 -->
        <div class=" hidden px-6 md:px-0 mt-4 md:flex md:shadow-md js-tab-pane"
             id="section-stats">
            <div class="p-4 px-6 w-full flex flex-row rounded md:rounded-r-none bg-white shadow-md md:shadow-none">
                <div class="w-full ml-8">
                    <table class=" w-full">
                        <tbody class="leading-loose text-md">
                        <tr class="">
                            <td class="py-3 w-1/6">学号</td>
                            <td class="w-2/5">
                                <input id="studentId" maxlength="15" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="text"
                                       placeholder="请输入学号，15位纯数字">
                            </td>
                            <td class="pl-6">
                                <div id="studentId_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">用户名</td>
                            <td class="">
                                <input id="username" maxlength="10" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="text"
                                       placeholder="请输入用户名，4-10位英文字母和数字">
                            </td>
                            <td class="pl-6">
                                <div id="username_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">密码</td>
                            <td class="">
                                <input id="password" maxlength="20" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="password"
                                       placeholder="请输入密码，6-20位英文字符和数字">
                            </td>
                            <td class="pl-6">
                                <div id="password_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">确认密码</td>
                            <td class="">
                                <input id="passwordConfirm" maxlength="20" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="password"
                                       placeholder="请再次输入密码">
                            </td>
                            <td class="pl-6">
                                <div id="passwordConfirm_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">姓名</td>
                            <td class="">
                                <input id="realName" maxlength="15" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="text"
                                       placeholder="请输入您的真实姓名">
                            </td>
                            <td class="pl-6">
                                <div id="realName_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">性别</td>
                            <td class="">
                                <select id="gender" class="pr-10 -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none">
                                    <option value="">请选择您的性别</option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </td>
                            <td class="pl-6">
                                <div id="gender_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">电话号码</td>
                            <td class="">
                                <input id="phoneNum" maxlength="11" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="text"
                                       placeholder="请输入8-11位的电话号码">
                            </td>
                            <td class="pl-6">
                                <div id="phoneNum_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="py-3">电子邮箱</td>
                            <td class="">
                                <input id="email" maxlength="32" class="w-full -ml-4 text-md h-8 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="text"
                                       placeholder="请输入格式正确的电子邮箱">
                            </td>
                            <td class="pl-6">
                                <div id="email_msg" class="flex-row flex"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="w-full flex justify-center mt-6">
            <button id="btn_register" class="h-12 mr-4 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-12 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">
                注册
            </button>
        </div>
    </div>

    <div class="w-1/5"></div>


</div>

<script>
    $(function () {
        /*学号、用户名、姓名、密码、确认密码、性别、电话、邮箱 8个*/
        var flags = [false, false, false, false, false, false, false, false];

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
                showMsg("username", "用户名格式错误", false);
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
                    showMsg("username", "该用户名可以使用",true);
                    flags[1] = true;
                }
            })
        })

        $("#password").keyup(function () {
            flags[2] = false;
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
                flags[3] = true;
            }
            showMsg("password", "", true);
            flags[2] = true;
        })

        $("#passwordConfirm").keyup(function () {
            flags[3] = false;
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
            flags[3] = true;
        })

        $("#realName").keyup(function () {
            flags[4] = false;
            var realName = $("#realName").val();
            if (realName === ""){
                showMsg("realName", "真实姓名不能为空", false);
                return;
            }
            showMsg("realName", "", true);
            flags[4] = true;
        })

        $("#gender").change(function () {
            flags[5] = false;
            var gender = $("#gender").val();
            if (gender === ""){
                showMsg("gender", "性别不能为空", false);
                return;
            }
            showMsg("gender", "", true);
            flags[5] = true;
        })

        $("#phoneNum").keyup(function () {
            flags[6] = false;
            var phoneNum = $("#phoneNum").val();
            if (phoneNum === ""){
                showMsg("phoneNum", "电话号码不能为空", false);
                return;
            }else {
                var regex = /^[0-9]{8,11}$/;
                if (!regex.test(phoneNum)){
                    showMsg("phoneNum", "电话号码格式错误", false);
                    return;
                }
            }
            showMsg("phoneNum", "", true);
            flags[6] = true;
        })

        $("#email").keyup(function () {
            flags[7] = false;
            var email = $("#email").val();
            if (email === ""){
                showMsg("email", "电子邮箱不能为空", false);
                return;
            }else {
                var regex = /^\w+[@]\w+[.]\w+$/;
                if (!regex.test(email)){
                    showMsg("email", "电子邮箱格式错误", false);
                    return;
                }
            }
            showMsg("email", "", true);
            flags[7] = true;
        })

        $("#btn_register").click(function () {
            var check = true;
            for (var flag in flags){
                if (!flags[flag]){
                    check = false;
                    break;
                }
            }
            if (!check){
                toastr.error("注册失败！请按要求填写信息","", {"onHidden":function () {
                        return;
                    }});
            }else {
                var studentId = $("#studentId").val();
                var username = $("#username").val();
                var password = $("#password").val();
                var realName = $("#realName").val();
                var gender = $("#gender").val();
                var phoneNum = $("#phoneNum").val();
                var email = $("#email").val();
                var json = {
                    realName:realName,
                    account: {
                        studentId:studentId,
                        username:username,
                        password:password
                    },
                    userDetail:{
                        gender:gender,
                        phoneNum:phoneNum,
                        email:email
                    }
                }
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/user/register.do",
                    contentType: 'application/json',
                    data:JSON.stringify(json),
                    success: function() {
                        toastr.success("注册成功！","", {"onHidden":function () {
                                window.location.href='${pageContext.request.contextPath}/login.jsp';
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
        $("#gender").val("");

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
