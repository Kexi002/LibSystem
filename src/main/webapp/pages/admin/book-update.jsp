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
                        <li class="active">图书修改</li>
                    </c:if>
                    <c:if test="${!empty condition}">
                        <li><a href="${pageContext.request.contextPath}/book/find.do?page=1&size=7">查询全部</a></li>
                        <li><a href="javascript:history.go(-1)">按条件查询</a></li>
                        <li class="active">图书修改</li>
                    </c:if>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-10 col-md-offset-2" style="margin-top: 50px;">
    <div class="panel panel-3" style="margin-left: 15px; margin-right: 15px">
        <div class="panel-heading" style="padding-top: 0;">
            <h3>图书修改</h3>
            <hr style="margin-top: 0; margin-bottom: 0">
        </div>
        <div class="panel-body" style="height: 508px; overflow-y: scroll">
            <img class="col-md-4" src="${pageContext.request.contextPath}/img/bookImage/${bookInfo.bookDetail.image}" style="float: left;width: 390px; height: auto">
            <div class="col-md-7">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="bookName">书名</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="bookName" id="bookName" placeholder="请输入书名" maxlength="20" value="${bookInfo.bookName}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="author">分类</label>
                        <div  class="col-md-6">
                            <select id="category" name="category" class="selectpicker">
                                <option value="A">A 马克思主义、列宁主义、毛泽东思想、邓小平理论</option>
                                <option value="B">B 哲学、宗教</option>
                                <option value="C">C 社会科学总论</option>
                                <option value="D">D 政治、法律</option>
                                <option value="E">E 军事</option>
                                <option value="F">F 经济</option>
                                <option value="G">G 文化、科学、教育、体育</option>
                                <option value="H">H 语言、文字</option>
                                <option value="I">I 文学</option>
                                <option value="J">J 艺术</option>
                                <option value="K">K 历史、地理</option>
                                <option value="N">N 自然科学总论</option>
                                <option value="O">O 数理科学和化学</option>
                                <option value="P">P 天文学、地球科学</option>
                                <option value="Q">Q 生物科学</option>
                                <option value="R">R 医药、卫生</option>
                                <option value="S">S 农业科学</option>
                                <option value="T">T 工业技术</option>
                                <option value="U">U 交通运输</option>
                                <option value="V">V 航空、航天</option>
                                <option value="X">X 环境科学、劳动保护科学（安全科学）</option>
                                <option value="Z">Z 综合性图书</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="author">作者</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者的姓名" maxlength="20" value="${bookInfo.author}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="author">出版社</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="publisher" id="publisher" placeholder="请输入出版社的名称" maxlength="20" value="${bookInfo.publisher}"/>
                        </div>
                    </div>
                </form>



            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#category_B").prop("selected",true);
        $("#category").selectpicker("val","${bookInfo.category}");
        var test = $("#category").val();
    })
    
    /*下拉框动画*/
    $(function () {
        $("#book_menu > a").addClass("nav-left-dropdown-a");
        $("#book_menu > a").addClass("nav-left-bottom-border");
        $("#book_menu > a").next("ul").addClass("nav-left-dropdown-ul").slideDown(0);
        $("#book_menu > a").attr("d", "2");
        $("#book_menu > a").attr("style", "color:#08A5E0 !important");
        $("#book_menu_find").attr("style", "color:#08A5E0 !important");

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
</script>
</body>
</html>
