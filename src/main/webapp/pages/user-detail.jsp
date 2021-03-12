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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script><!-- jquery文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
                <h2 class="font-normal">个人信息</h2>
                <p class="text-grey-dark mt-2">Personal information</p>
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
                <div class="w-3/5 ml-8">
                    <table class=" w-full">
                        <tbody class="leading-loose text-md">
                        <tr class="border-b">
                            <td class="py-2 w-1/4">学号</td>
                            <td class="py-2 text-indigo-dark">${userInfo.account.studentId}</td>
                        </tr>
                        <tr class="border-b">
                            <td class="py-2 w-1/4">用户名</td>
                            <td class="py-2 text-indigo-dark">${userInfo.account.username}</td>
                        </tr>
                        <tr class="border-b">
                            <td class="py-2 w-1/4">姓名</td>
                            <td class="py-2 text-indigo-dark">${userInfo.realName}</td>
                        </tr>
                        <tr class="border-b">
                            <td class="py-2 w-1/4">性别</td>
                            <td class="py-2 text-indigo-dark">${userInfo.userDetail.gender}</td>
                        </tr>
                        <tr class="border-b">
                            <td class="py-2 w-1/4">电话号码</td>
                            <td class="py-2 text-indigo-dark">${userInfo.userDetail.phoneNum}</td>
                        </tr>
                        <tr class="">
                            <td class="py-2 w-1/4">电子邮箱</td>
                            <td class="py-2 text-indigo-dark">${userInfo.userDetail.email}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
<%--                <div class="w-2/5 justify-end flex" style="padding-top: 31.5%">
                    <button class="h-8 mr-4 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-6 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                            onclick="window.location.href='javascript:history.go(-1)'">
                        修改个人信息
                    </button>
                    <button class="h-8 mr-2 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-6 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                            onclick="window.location.href='javascript:history.go(-1)'">
                        修改密码
                    </button>
                </div>--%>
            </div>
        </div>
        <div class="w-full flex justify-end mt-6">
            <button class=" mr-4 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-6 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                    onclick="window.location.href='${pageContext.request.contextPath}/pages/user-update.jsp'">
                修改个人信息
            </button>
            <button class="mr-8 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-6 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                    onclick="window.location.href='${pageContext.request.contextPath}/pages/user-update-password.jsp'">
                修改密码
            </button>
        </div>
    </div>

    <!-- 用户资料栏 -->
    <jsp:include page="side-profile.jsp"/>


</div>

<script>

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

</script>
</body>
</html>
