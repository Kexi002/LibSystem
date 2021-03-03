<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2>测试注册</h2>

<form action="${pageContext.request.contextPath}/user/register.do" method="post">
    <table>
        <tr>
            <td>学号：</td>
            <td><input type="text" name="studentId" id="studentId" maxlength="15"/></td>
            <td><div id="studentId_msg"></div></td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="account.username" id="username" maxlength="10"/></td>
            <td><div id="username_msg"></div></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="account.password" id="password" maxlength="16"/></td>
            <td><div id="password_msg"></div></td>
        </tr>
        <tr>
            <td>确认密码：</td>
            <td><input type="password" id="passwordConfirm" maxlength="16"/></td>
            <td><div id="passwordConfirm_msg"></div></td>
        </tr>
        <tr>
            <td>真实姓名：</td>
            <td><input type="text" name="realName" maxlength="15"/></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><select name="userDetail.gender" >
                    <option selected="selected">男</option>
                    <option>女</option>
                </select></td>
        </tr>
        <tr>
            <td>电话：</td>
            <td><input type="text" name="userDetail.phoneNum" id="phoneNum" maxlength="11"/></td>
            <td><div id="phoneNum_msg"></div></td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><input type="text" name="userDetail.email" id="email" maxlength="32"/></td>
            <td><div id="email_msg"></div></td>
        </tr>
        <tr>
            <td><input type="hidden" name="account.studentId" id="account_studentId"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" id="submit" value="注册" disabled="disabled"/>
                <input type="reset" value="重置" /></td>
        </tr>
    </table>
</form>
<script>
    $(function () {
        var flags = [false, false, false, false, false, false];

        //判断是否禁用提交按钮
        function enableSubmit(bool){
            if (bool) $("#submit").removeAttr("disabled");
            else $("#submit").attr("disabled", "disabled");
        }

        //验证是否全部通过
        function validate(){
            for (var flag in flags){
                if (!flags[flag]){
                    enableSubmit(false);
                    return;
                }
            }
            enableSubmit(true);
        }

        function showMsg(id, msg){
            $("#"+id+"_msg").text(msg);
            //后期加入换class更改msg颜色
        }

        $("#studentId").blur(function () {
            flags[0] = false;
            var studentId = $(this).val();
            //正则判断格式是否正确
            var regex = /^[0-9]{15}$/;
            if (! regex.test(studentId)){
                showMsg("studentId", "学号格式错误");
                return;
            }
            //ajax查询是否重复
            $.ajax({
                type:"post",
                url:"account/checkStudentId.do",
                contentType:"application/json;charset=UTF-8",
                data:'{"studentId":"'+ studentId +'"}',
                data_type:"json",
                //传回一个布尔值，查询数据库是否已有此账户
                success:function (bool) {
                    if(bool){
                        showMsg("studentId", "此学号已被注册");
                        return;
                    }
                    //如果正确，重置错误信息
                    showMsg("studentId", "该学号可以使用");
                    flags[0] = true;
                    validate();
                }
            })
        })

        $("#username").blur(function () {
            flags[1] = false;
            var username = $(this).val();
            var regex = /^[a-zA-Z0-9]{4,10}$/;
            if (! regex.test(username)){
                showMsg("username", "用户名格式错误");
                return;
            }
            $.ajax({
                type:"post",
                url:"account/checkUsername.do",
                contentType:"application/json;charset=UTF-8",
                data:'{"username":"'+ username +'"}',
                data_type:"json",
                success:function (bool) {
                    if(bool){
                        showMsg("username", "此用户名已被注册");
                        return;
                    }
                    showMsg("username", "该用户名可以使用");
                    flags[1] = true;
                    validate();
                }
            })
        })

        $("#password").blur(function () {
            flags[2] = false;
            var password = $(this).val();
            var regex = /^[\S]{6,16}$/;
            if (! regex.test(password)){
                showMsg("password", "密码格式错误");
                return;
            }
            showMsg("password", "该密码可以使用");
            flags[2] = true;
            validate();
        })

        $("#passwordConfirm").blur(function () {
            flags[3] = false;
            var passwordConfirm = $(this).val();
            var regex = /^[\S]{6,16}$/;
            if (! regex.test(passwordConfirm)){
                showMsg("passwordConfirm", "密码格式错误");
                return;
            }
            if(passwordConfirm !=  $("#password").val()){
                showMsg("passwordConfirm", "两次输入的密码不一致");
                return;
            }
            showMsg("passwordConfirm", "√");
            flags[3] = true;
            validate();
        })

        $("#phoneNum").blur(function () {
            flags[4] = false;
            var phoneNum = $(this).val();
            var regex = /^[\d]{8,11}$/;
            if (! regex.test(phoneNum)){
                showMsg("phoneNum", "电话号码格式错误");
                return;
            }
            showMsg("phoneNum", "√");
            flags[4] = true;
            validate();
        })

        $("#email").blur(function () {
            flags[5] = true;
            var email = $(this).val();
            var regex = /^\w+[@]\w+[.]\w+$/;
            if (! regex.test(email)){
                showMsg("email", "邮箱地址格式错误");
                return;
            }
            showMsg("email", "√");
            flags[5] = true;
            validate();
        })

        $("form").submit(function(){

            $("#account_studentId").val($("#studentId").val());
        });
    })



</script>

</body>
</html>

