<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>

<a href="${pageContext.request.contextPath}/account/findAll.do">测试查询</a>

<form action="${pageContext.request.contextPath}/account/save.do" method="post">
    <table>
        <tr>
            <td>学号：</td>
            <td><input type="text" name="studentId" /></td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username" /></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="password" /></td>
        </tr>
        <tr>
            <td>权限：</td>
            <td><input type="text" name="authority" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="测试添加" />
                <input type="reset" value="重置" /></td>
        </tr>
    </table>
</form>
</body>
</html>
