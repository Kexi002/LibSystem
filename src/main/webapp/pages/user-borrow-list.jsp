<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/toastr.min.css"/>
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
                <h2 class="font-normal">我的借书单</h2>
                <p class="text-grey-dark mt-2">My book list</p>
            </div>

            <button class="mr-8 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-8 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                    onclick="window.location.href='javascript:history.go(-1)'">
                返回
            </button>
        </div>

        <c:forEach items="${borrowList}" var="borrow">
            <!-- 图书信息 -->
            <div class=" hidden px-6 md:px-0 mt-4 md:flex md:shadow-md js-tab-pane"
                 id="section-stats">
                <div class="p-4 px-6 w-full flex flex-row rounded md:rounded-r-none bg-white shadow-md md:shadow-none">
                    <%--图片--%>
                    <div class="w-1/5 mr-6">
                        <img class="shadow-md" src="${pageContext.request.contextPath}/img/bookImage/${borrow.bookInfo.bookDetail.image}">
                    </div>
                    <div class="w-2/3 mt-4 flex-col flex">
                        <h2>${borrow.bookInfo.bookName}</h2>
                        <div class="flex flex-col">
                            <table class="mt-4 w-5/6 mr-2">
                                <tbody class=" leading-loose text-md">
                                <tr class="border-b">
                                    <td class="py-2 w-1/6">借书日期</td>
                                    <td class="py-2 w-1/4 text-indigo-dark"><fmt:formatDate value="${borrow.borrowDate}" pattern="yyyy-MM-dd"/></td>
                                    <td class="py-2 w-1/6">还书日期</td>
                                    <td class="py-2 w-1/4 text-indigo-dark"><fmt:formatDate value="${borrow.returnDate}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="w-5/6 mr-2">
                                <tbody class="leading-loose text-md">
                                <tr class="border-b">
                                    <td class="py-2 w-1/6">续借状态</td>
                                    <td class="py-2 w-1/6">
                                        <c:if test="${borrow.renew == 0}">
                                            <div class="rounded-lg text-indigo-dark justify-center flex">${borrow.renewStr}</div>
                                        </c:if>
                                        <c:if test="${borrow.renew == 1}">
                                            <div class="bg-blue-light rounded-lg text-indigo-dark justify-center flex">${borrow.renewStr}</div>
                                        </c:if>
                                    </td>
                                    <td class="py-2 w-1/6"></td>
                                    <td class="py-2 w-1/6"></td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="w-5/6 mr-2">
                                <tbody class="leading-loose text-md">
                                <tr class="border-b">
                                    <td class="py-2 w-1/6">逾期状态</td>
                                    <c:if test="${borrow.status == 0 || borrow.status == 1}">
                                        <td class="py-2 w-1/6">
                                            <div class="bg-green-light rounded-lg text-indigo-dark justify-center flex">未逾期</div>
                                        </td>
                                        <td class="py-2 w-1/6"></td>
                                        <td class="py-2 w-1/6"></td>
                                    </c:if>
                                    <c:if test="${borrow.status == 2}">
                                        <td class="py-2 w-2/3 pl-5">
                                            <div class="bg-yellow-light rounded-lg text-indigo-dark ml-4 px-4 justify-center flex">已逾期，请续借或尽快还书</div>
                                        </td>
                                        <td class="py-2 w-1/6"></td>
                                    </c:if>
                                    <c:if test="${borrow.status == 3}">
                                        <td class="py-2 w-1/2 pl-5 pr-5">
                                            <div class="bg-red-light rounded-lg text-indigo-dark justify-center flex">已逾期，请尽快还书！</div>
                                        </td>
                                        <td class="py-2 w-1/6"></td>
                                    </c:if>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%--借书按钮--%>
                    <div class="w-1/6 flex flex-col justify-center px-2">
                        <c:if test="${borrow.renew == 0}">
                            <button class="ml-4 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none"
                                    onclick="renew(${borrow.id})">
                                续借
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 用户资料栏 -->
    <jsp:include page="side-profile.jsp"/>


</div>

<script>
    function renew(id){
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/borrow/renew.do",
            data:{id:id},
            success: function() {
                toastr.success("续借成功","", {"timeOut" : "1000", "onHidden":function () {
                        window.location.reload();
                }});
            }
        });
    }


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
