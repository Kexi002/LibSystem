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

    <ul class="mt-4 list-reset mb-8 w-full border-t-0 pt-2">
        <li class="ml-2 mb-3 pb-4 flex" onclick="window.location.href='${pageContext.request.contextPath}/pages/user-detail.jsp'">
            <img src="${pageContext.request.contextPath}/img/icon/profile-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
            <div class="text-md hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">
                <a class="no-underline text-indigo-darkest">
                    个人信息
                </a>
            </div>
        </li>
    </ul>
</div>

</body>
</html>
