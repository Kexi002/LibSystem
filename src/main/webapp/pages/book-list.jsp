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
    <jsp:include page="side-navbar.jsp"/>
    <!-- 内容 -->
    <div class="flex flex-1 flex-col md:px-6" id="content">
        <!-- 页面选择 -->
        <div class="px-6 pb-2 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-8 ">
            <div>
                <h2 class="font-normal">图书列表</h2>
                <h4 class="hidden md:inline-block text-grey-dark font-normal mt-2">Books</h4>
            </div>
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

        <div class="flex justify-center">
            <ul class="pagination">
                <c:if test="${pageInfo.total == 0}">
                    <h2 class="font-normal mt-12">哎呀！我们找不到你的搜索结果∑(°Д°;)</h2>
                    <h2 class="font-normal text-center mt-8">换个关键词试试吧</h2>
                </c:if>

                <c:if test="${pageInfo.total != 0}">
                    <li><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}"><img src="${pageContext.request.contextPath}/img/icon/left.png" style="width: 21px; height: auto"></a></li>
                        <%--如果长度小于7，直接完整显示--%>
                    <c:if test="${pageInfo.pages <= 7}">
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageNum}</a></li>
                        </c:forEach>
                    </c:if>
                        <%--如果长度大于7，则分三种情况：靠近首页、靠近尾页和在中间--%>
                    <c:if test="${pageInfo.pages > 7}">
                        <%--更靠近首页，且当前页离首页只有3格（4）--%>
                        <c:if test="${((pageInfo.pageNum - 1) < 4) && ((pageInfo.pageNum - 1) <= (pageInfo.pages - pageInfo.pageNum))}">
                            <%--如果离首页不到3格，则按照当前页为4显示--%>
                            <c:if test="${pageInfo.pageNum < 4}">
                                <c:forEach begin="1" end="6" var="pageNum">
                                    <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageNum}</a></li>
                                </c:forEach>
                            </c:if>
                            <%--当前页为4或以上--%>
                            <c:if test="${pageInfo.pageNum >= 4}">
                                <c:forEach begin="1" end="${pageInfo.pageNum + 2}" var="pageNum">
                                    <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageNum}</a></li>
                                </c:forEach>
                            </c:if>
                            <li><a href="#">...</a></li>
                            <li id="page_${pageInfo.pages}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageInfo.pages}</a></li>
                        </c:if>
                        <%--更靠近尾页，且当前页离尾页只有不到3格--%>
                        <c:if test="${((pageInfo.pages - pageInfo.pageNum) < 4) && ((pageInfo.pageNum - 1) > (pageInfo.pages - pageInfo.pageNum))}">
                            <li id="page_1"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">1</a></li>
                            <li><a href="#">...</a></li>
                            <c:if test="${pageInfo.pageNum > (pageInfo.pages - 3)}">
                                <c:forEach begin="${pageInfo.pages - 5}" end="${pageInfo.pages}" var="pageNum">
                                    <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageNum}</a></li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${pageInfo.pageNum <= (pageInfo.pages - 3)}">
                                <c:forEach begin="${pageInfo.pageNum - 2}" end="${pageInfo.pages}" var="pageNum">
                                    <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageNum}</a></li>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <%--当前页在中间位置--%>
                        <c:if test="${(pageInfo.pageNum - 1 >= 4) && ((pageInfo.pages - pageInfo.pageNum) >= 4)}">
                            <li id="page_1"><a href="${pageContext.request.contextPath}/book/find.user.do?page=1&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">1</a></li>
                            <li><a href="#">...</a></li>
                            <c:forEach begin="${pageInfo.pageNum - 2}" end="${pageInfo.pageNum + 2}" var="pageNum">
                                <li id="page_${pageNum}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="#">...</a></li>
                            <li id="page_${pageInfo.pages}"><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}">${pageInfo.pages}</a></li>
                        </c:if>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&condition=${condition}&category=${category}" ><img src="${pageContext.request.contextPath}/img/icon/right.png" style="width: 21px; height: auto"></a></li>
                </c:if>
            </ul>
        </div>
    </div>

    <!-- 用户资料栏 -->
    <jsp:include page="side-profile.jsp"/>




</div>

<script>

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
                    location.href = "${pageContext.request.contextPath}/book/find.user.do?page=1&size=${pageInfo.pageSize}"
                } else{
                    var condition = $("#condition").val();
                    location.href = "${pageContext.request.contextPath}/book/find.user.do?page=1&size="+
                        ${pageInfo.pageSize} +"&condition="
                        + condition;
                }
            }
        })

    });

</script>
</body>
</html>
