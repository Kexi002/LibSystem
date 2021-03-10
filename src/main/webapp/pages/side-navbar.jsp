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
            <div href="www.baidu.com" class="text-md hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">
                <a class="no-underline text-indigo-darkest" href="${pageContext.request.contextPath}/user/main.user.do">
                    首页
                </a>
            </div>
        </li>
        <li class="ml-2 mb-3 pb-3">
            <%--藏一个隐藏域来告诉js是否展开分类--%>
            <input id="open" type="hidden" value="${category != null}"/>

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
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=A"
                    id="category_A">
                        马克思主义、列宁主义...</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                    id="categoryNumber_A"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=B"
                             id="category_B">
                        哲学、宗教</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_B"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=C"
                             id="category_C">
                        社会科学总论</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_C"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=D"
                             id="category_D">
                        政治、法律</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_D"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=E"
                             id="category_E">
                        军事</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_E"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=F"
                             id="category_F">
                        经济</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_F"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=G"
                             id="category_G">
                        文化、科学、教育、体育</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_G"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=H"
                             id="category_H">
                        语言、文字</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_H"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=J"
                             id="category_J">
                        艺术</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_J"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=K"
                             id="category_K">
                        历史、地理</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_K"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=N"
                             id="category_N">
                        自然科学总论</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_N"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=O"
                             id="category_O">
                        数理科学和化学</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_O"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=P"
                             id="category_P">
                        天文学、地球科学</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_P"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=Q"
                             id="category_Q">
                        生物科学</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_Q"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=R"
                             id="category_R">
                        医药、卫生</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_R"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=Q"
                             id="category_Q">
                        生物科学</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_Q"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=S"
                             id="category_S">
                        农业科学</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_S"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=T"
                             id="category_T">
                        工业技术</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_T"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=U"
                             id="category_U">
                        交通运输</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_U"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=V"
                             id="category_V">
                        航空、航天</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_V"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=X"
                             id="category_X">
                        环境科学、劳动保护科学...</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_X"></span>
                </li>
                <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                    <span><a class="hover:text-indigo-dark hover:cursor-pointer transition-normal no-underline text-grey-darker"
                             href="${pageContext.request.contextPath}/book/find.user.do?page=${pageInfo.pageNum}&size=${pageInfo.pageSize}&condition=${condition}&category=Z"
                             id="category_Z">
                        综合性图书</a></span>
                    <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal"
                          id="categoryNumber_Z"></span>
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

<script>
    $(function () {
        $("#category_${category}").addClass("text-indigo-dark");
        $("#categoryNumber_${category}").text(${categoryNumber});
    })


</script>

</body>
</html>
