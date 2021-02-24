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
<h3>文件上传测试</h3>
<form action="${pageContext.request.contextPath}/book/uploadImg.do" method="post" enctype="multipart/form-data" id="form">
    选择文件：<input type="file" name="upload"><br/>
    <input type="submit" value="上传文件">

    <input type="hidden" name="id" value="1">
</form>

<button id="btn_ajax">ajax上传</button>

<img src="${pageContext.request.contextPath}/img/bookImage/${bookDetail.image}">

<script>
    $(function () {
        $("#btn_ajax").click(function () {
            var formData = new FormData($("#form")[0]);
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/book/uploadImg.do",
                data:formData,
                contentType:false,
                processData: false,
                success:function () {
                    //alert("hi");
                    location.reload();
                }
            })
        })
    })

</script>
</body>
</html>
