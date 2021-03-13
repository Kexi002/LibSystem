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
    <jsp:include page="side-navbar.jsp"/>
    <!-- 内容 -->
    <div class="flex flex-1 flex-col md:px-6 pt-10" id="content">
        <!-- 标题 -->
        <div class="px-6 md:px-0 flex justify-between items-center -order-1">
            <div>
                <h2 class="font-normal">今日推荐</h2>
                <p class="text-grey-dark mt-2">Today's Recommendation</p>
            </div>
        </div>

        <div class="carousel slide hidden px-6 md:px-0 mt-4 md:flex flex-wrap order-1 md:-order-1 md:shadow-md js-tab-pane" id="carousel-example-generic" data-ride="carousel" data-interval="1500">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/img/carousel/carousel-01.jpg">
                    </a>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/carousel/carousel-02.jpg">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/carousel/carousel-03.jpg">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/carousel/carousel-04.jpg">
                </div>
            </div>
            <%--按钮样式--%>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            </a>
        </div>

        <!-- 页面选择 -->
        <div class="px-6 pb-2 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-8 ">
            <div>
                <h2 class="font-normal">图书列表</h2>
                <h4 class="hidden md:inline-block text-grey-dark font-normal mt-2">Books</h4>
            </div>

            <button class="mr-8 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-6 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
            onclick="window.location.href='${pageContext.request.contextPath}/book/find.user.do?page=1'">
                查看全部
            </button>
        </div>

        <!-- 图书列表 -->
        <div class="hidden px-2 pt-2 md:px-0 flex-wrap pb-4 js-tab-pane active" id="section-library">
            <c:forEach items="${pageInfo.list}" var="bookInfo" varStatus="s">
                <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/1 sm:w-1/2 md:w-1/4 p-4 js-book">
                    <img src="${pageContext.request.contextPath}/img/bookImage/${bookInfo.bookDetail.image}" alt="book-01"
                         class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo"
                    onclick="window.location.href='${pageContext.request.contextPath}/book/detail.user.do?id=${bookInfo.id}'">
                    <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                        <p class="text-xl my-2 font-bold sm:font-normal">${bookInfo.bookName}</p>
                        <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">${bookInfo.author}</p>
                        <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">${bookInfo.publisher}</p>
                        <c:if test="${bookInfo.bookDetail.number != 0}">
                            <label class="hidden sm:inline-block rounded-full libre-bg-green text-white px-2 py-1/2 text-xs">有可借余量</label>
                        </c:if>
                        <c:if test="${bookInfo.bookDetail.number == 0}">
                            <label class="hidden sm:inline-block rounded-full libre-bg-red text-white px-2 py-1/2 text-xs">无可借余量</label>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

    <!-- 用户资料栏 -->
    <jsp:include page="side-profile.jsp"/>


</div>

<script>
    //轮播图时间间隔
    $('.carousel').carousel({
        interval: 5000
    });

    /*给当前页添加active*/
    $(function () {
        $("#page_${pageInfo.pageNum}").addClass("active");
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
    


</script>
</body>
</html>
