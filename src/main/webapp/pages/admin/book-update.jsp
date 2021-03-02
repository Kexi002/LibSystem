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
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
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
        <div class="panel-body" style="margin-top: -10px;height: 508px; overflow-y: auto">
            <form id="form_img" role="form">
                <div class="col-md-4" style="float: left;">
                    <img id="previewImg" src="${pageContext.request.contextPath}/img/bookImage/${bookInfo.bookDetail.image}" style="width: 375px; height: auto;">
                    <button type="button" id="btn_updateImg" class="btn btn-info"
                        style="position:absolute; left: calc(50% - 48px); top:calc(50% + 42px); padding-left: 15px; padding-right: 15px"
                    onclick="$('#img').click()">修改封面图片</button>
                    <input type="file" name="img" id="img" accept=".jpg, .jpeg, .png" style="display: none">
                    <input type="hidden" name="id" value="${bookInfo.id}">
                </div>
            </form>
            <div class="col-md-7">
                <form id="form_main" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="bookName">书名</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="bookName" id="bookName" placeholder="请输入书名" maxlength="20" value="${bookInfo.bookName}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="category">分类</label>
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
                        <label class="col-md-2 control-label" for="publisher">出版社</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="publisher" id="publisher" placeholder="请输入出版社的名称" maxlength="20" value="${bookInfo.publisher}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="publicationDate">出版日期</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" id="publicationDate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="isbn">isbn</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="isbn" id="isbn" placeholder="请输入13位的ISBN书号" maxlength="20" value="${bookInfo.bookDetail.isbn}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="location">馆藏地址</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="location" id="location" placeholder="请输入此书的馆藏地址" maxlength="50" value="${bookInfo.bookDetail.location}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="number">可借余量</label>
                        <div  class="col-md-6">
                            <input type="text" class="form-control" name="number" id="number" placeholder="请输入此书的可借余量" maxlength="50" value="${bookInfo.bookDetail.number}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="intro">简介</label>
                        <div  class="col-md-8">
                            <textarea class="form-control" name="intro" id="intro" placeholder="请输入简介，上限为500字" maxlength="500">${bookInfo.bookDetail.intro}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div  class="col-md-8">
                            <button type="button" class="btn btn-default" onclick="check()">保存修改</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    /*选择框设初始值*/
    $(function () {
        $("#category").selectpicker("val","${bookInfo.category}");
        $("#category").selectpicker({size: 10});
    })

    /*自适应高度textarea*/
    $(function () {
        $('textarea').each(function () {
            //设置初始高度
            this.setAttribute("style", "height: 50px; overflow-y:hidden");
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        }).on('input', function () {
            //输入文本时，自动调整高度
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        });
    })

    /*上传图片前预览*/
    $(function () {
        $("#img")[0].addEventListener("change", function () {
            var file = this.files[0];
            $("#previewImg")[0].src = file ? URL.createObjectURL(file) : "${pageContext.request.contextPath}/img/bookImage/defaultNoImg.jpg";
        }, this);
    })

    function check(){
        var img = new FormData($("#form_img")[0]);
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/book/uploadImg.do",
            data:img,
            contentType:false,
            processData: false,
        })
        var bookName = $("#bookName").val();
        var category = $("#category").val();
        var author = $("#author").val();
        var publisher = $("#publisher").val();
        var isbn = $("#isbn").val();
        var publicationDate = $("#publicationDate").val();
        var location = $("#location").val();
        var number = $("#number").val();
        var intro = $("#intro").val();
        var json = {
            id:${bookInfo.id},
            bookName:bookName,
            author:author,
            publisher:publisher,
            category:category,
            bookDetail:{
                id: ${bookInfo.bookDetail.id},
                isbn:isbn,
                publicationDate:publicationDate,
                location:location,
                number:number,
                intro:intro
            }
        };
        alert(JSON.stringify(json));
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/book/update.do",
            contentType: 'application/json',
            dataType: 'JSON',
            data:JSON.stringify(json),
            success: function(obj) {
            }
        });
    }
    
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

    $("#publicationDate").datetimepicker({
        forceParse: 0,//设置为0，时间不会跳转1899，会显示当前时间。
        language: 'zh-CN',//显示中文
        format: 'yyyy-mm-dd',//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true//显示今日按钮
    })
    $("#publicationDate").datetimepicker("setDate", new Date() );  //设置显示默认当天的时间

</script>
</body>
</html>
