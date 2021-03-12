<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>在线图书管理系统</title>
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
<body class="bg-grey-lighter font-sans antialiased flex flex-col">
<div class="fixed bg-grey-lighter pin z-50 flex justify-center items-center" id="loading">
    <img src="${pageContext.request.contextPath}/img/cheche.jpg" style="width: 100px; height: 100px; border-radius: 50%" id="logo">
</div>

<div class="bg-indigo-darker" style="height: 15%">

</div>

<div class="flex flex-row justify-center" style="background:url('${pageContext.request.contextPath}/img/library.png'); height: 70%">

    <div class="flex flex-col justify-start">
        <h1 class="mt-10 text-white" style="font-size: 55px">在线图书管理系统</h1>

        <form action="${pageContext.request.contextPath}/login.do" method="post">
            <div  onkeyup="onEnter()">
                <input name="username" id="username" maxlength="15" class="mt-12 w-full text-xl h-10 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="text"
                       placeholder="账号或用户名" onclick="clickEnter()">

                <input name="password" id="password" maxlength="15" class="mt-6 w-full text-xl h-10 px-4 rounded-lg bg-grey-lighter text-indigo-dark outline-none" type="text"
                       placeholder="密码" onclick="clickEnter()">
            </div>
            <div class="flex flex-row justify-center mt-8">
                <button id="login" type="button" class="text-2xl bg-indigo-darker h-12 hover:bg-indigo-darker text-white text-md py-2 px-16 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                onclick="checkSubmit()">
                    登录
                </button>
            </div>
        </form>

        <div class="flex flex-row justify-center mt-8">
            <a href="${pageContext.request.contextPath}/register_old.jsp" class="no-underline text-white text-lg">还没有账号？马上注册</a>
        </div>
    </div>
</div>

<script>
    /*toastr配置*/
    $(function() {
        toastr.options = {
            "closeButton" : true,//是否显示关闭按钮
            "debug" : false,//是否使用debug模式
            "positionClass" : "toast-center-center",//弹出窗的位置
            "onclick" : null,
            "showDuration" : "1000",//显示的动画时间
            "hideDuration" : "1000",//消失的动画时间
            "timeOut" : "3000",//展现时间
            "extendedTimeOut" : "1000",//加长展示时间
            "showEasing" : "swing",//显示时的动画缓冲方式
            "hideEasing" : "linear",//消失时的动画缓冲方式
            "showMethod" : "fadeIn",//显示时的动画方式
            "hideMethod" : "fadeOut" //消失时的动画方式
        };
    });

    $(function () {
        if (${param.msg == "fail"}){
            toastr.error("登录失败！用户名或密码错误");
        }
    })

    function checkSubmit(){
        if ($("#username").val() === "" || $("#password").val() === ""){
            toastr.error("用户名或密码不能为空");
            return;
        }
        $("form").submit();
    }

    var index = 0

    function clickEnter(){
        $("input").each(function(i){
            if($(this).is(':focus')){
                index=i
            }
        })
    }

    function onEnter(){
        if(event.keyCode==13){
            index++
            if(index>=$("input").length){
                index = $("#login").click();
            }
            $("input").each(function(i){
                if(i==index){
                    $(this).focus()
                }
            })
        }
    }


</script>
</body>
</html>

