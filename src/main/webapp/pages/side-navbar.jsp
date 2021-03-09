<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="absolute lg:relative lg:flex lg:text-sm bg-indigo-darker lg:bg-transparent pin-l pin-r py-4 px-6 lg:pt-10 lg:pl-12 lg:pr-6 -mt-1 lg:mt-0 overflow-y-auto lg:w-1/5 lg:border-r z-40 hidden">
    <ul class="mt-4 list-reset mb-8 w-full">
        <li class="ml-2 mb-3 pb-3 flex">
            <img src="${pageContext.request.contextPath}/img/icon/home-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
            <div class="text-md hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">
                首页
            </div>
        </li>
        <li class="ml-2 mb-3 pb-3">
            <div class="flex" id="sidenav-categories-trigger">
                <img src="${pageContext.request.contextPath}/img/icon/category-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                <div class="text-md hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium w-full relative">
                    分类
                    <div class="pointer-events-none absolute pin-y pin-r flex items-center px-1 text-grey-darker"
                         id="sidenav-icon">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
                        </svg>
                    </div>
                </div>
            </div>
            <ul class="text-grey lg:text-grey-dark list-reset leading-loose mt-2" id="sidenav-categories">
                <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">
                    Fiction
                </li>
                <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">
                    Nonfiction
                </li>
                <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">
                    Lifestyle
                </li>
                <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">
                    Health &amp; Fitness
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span>Art & Design</span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal">7</span>
                </li>
                <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4">
                    Music
                </li>
            </ul>
        </li>
        <li class="ml-2 mb-3 pb-3 flex">
            <img src="${pageContext.request.contextPath}/img/icon/wishlist-default.svg" alt="wishlist-icon" class="w-4 h-4 mr-2">
            <div class="text-md hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">
                Wishlist
            </div>
        </li>
    </ul>
</nav>
</body>
</html>
