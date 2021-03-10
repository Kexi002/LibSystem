<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="bg-indigo-darker text-center p-4 px-6 flex items-center">
    <div class="hidden lg:block lg:w-1/4 xl:w-1/5 pr-8">
        <a href="${pageContext.request.contextPath}/user/main.user.do" class="text-lg text-white py-2 hover:text-grey-dark no-underline px-6">图书资料管理系统</a>
    </div>

    <div class="flex flex-grow items-center lg:w-3/4 xl:w-4/5">
				<span class="relative w-full">
				<input type="search" placeholder="Search" id="condition"
                       class="w-full text-sm text-white transition border border-transparent focus:outline-none focus:border-indigo placeholder-white rounded bg-indigo-medium py-1 px-2 pl-10 appearance-none leading-normal ds-input">
				<div class="absolute search-icon" style="top: .5rem; left: .8rem;">
				<svg class="fill-current pointer-events-none text-white w-4 h-4" xmlns="http://www.w3.org/2000/svg"
                     viewBox="0 0 20 20">
					<path d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"></path>
				</svg>
				</div>
			</span>
        <a href="${pageContext.request.contextPath}/logout.do"
           class="text-sm text-right text-white py-2 px-3 hover:text-grey-dark no-underline hidden lg:block lg:w-1/3 px-6">退出登录</a>
    </div>
</div>
</body>
</html>
