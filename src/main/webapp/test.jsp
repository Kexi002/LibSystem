<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="resource.jsp"%>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<%--    <link href="css/toastr.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-3.2.1.min.js"></script><!-- jquery文件 -->
    <script src="js/toastr.min.js"></script>--%>
</head>
<body>
<button id="showtoast">show info toast（提示）</button>
<br>
<button id="showtoastsuccess">show success toast（成功）</button>
<br>
<button id="showtoasterror">show error toast（错误）</button>
<br>
<button id="showtoastwarning">show warning toast（警告）</button>
<br>
<button id="cleartoasts">clear toast（清除）</button>
<br>
<button id="removetoasts">remove toast（移除）</button>
<br>

<script type="text/javascript">



        $(function() {

/*        //设置显示配置
        var messageOpts = {
            "closeButton" : true,//是否显示关闭按钮
            "debug" : false,//是否使用debug模式
            "positionClass" : "toast-top-center",//弹出窗的位置
            "onclick" : null,
            "showDuration" : "300",//显示的动画时间
            "hideDuration" : "1000",//消失的动画时间
            "timeOut" : "3000",//展现时间
            "extendedTimeOut" : "1000",//加长展示时间
            "showEasing" : "swing",//显示时的动画缓冲方式
            "hideEasing" : "linear",//消失时的动画缓冲方式
            "showMethod" : "fadeIn",//显示时的动画方式
            "hideMethod" : "fadeOut" //消失时的动画方式
        };
        toastr.options = messageOpts;*/

        $('#showtoast').click(function() {

            //提示
            //调用方法1
            toastr.info('内容1');

            //调用方法2
            //toastr.info('内容2', '标题2');

            //调用方法3
            //toastr['info']('内容3', '标题3');

            //调用方法4
            //toastr.info('内容4', '标题4',messageOpts);

        });

        $('#showtoastsuccess').click(function() {

            //成功
            toastr.success('内容success', '标题success');

        });

        $('#showtoasterror').click(function() {

            //错误
            toastr.error('内容error', '标题error');

        });

        $('#showtoastwarning').click(function() {

            //警告
            toastr.warning('内容warning', '标题warning');
        });

        $('#cleartoasts').click(function() {

            //清除
            toastr.clear();
        });

        $('#removetoasts').click(function() {

            //移除
            toastr.remove();
        });

    })
</script>
</body>

</html>