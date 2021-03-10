<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="h-full hidden absolute pin-b z-10 lg:relative lg:block w-full lg:w-1/5 bg-grey-lighter-2 px-6 pt-10"
     id="profile">
    <div class="flex items-center mb-6">
        <img src="${pageContext.request.contextPath}/img/cheche.jpg" style="width: 80px; height: 80px; border-radius: 50%">
        <div class="ml-3">
            <p>${userInfo.realName}</p>
            <p class="text-grey-dark mt-1 text-sm">@${userInfo.account.username}</p>
        </div>
    </div>
</div>

</body>
</html>
