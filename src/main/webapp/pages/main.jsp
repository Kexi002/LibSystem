<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>在线图书管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/light.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script><!-- jquery文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/bundle.js" async defer></script>
</head>
<body class="bg-grey-lighter font-sans antialiased">
<div class="fixed bg-grey-lighter pin z-50 flex justify-center items-center" id="loading">
    <img src="${pageContext.request.contextPath}/img/cheche.jpg" style="width: 100px; height: 100px; border-radius: 50%" id="logo">
</div>

<%--顶部导航栏--%>
<div class="bg-indigo-darker text-center p-4 px-6 flex items-center">
        <div class="hidden lg:block lg:w-1/4 xl:w-1/5 pr-8">
            <a class="text-lg text-white py-2 hover:text-grey-dark no-underline px-6">图书资料管理系统</a>
        </div>

        <div class="flex flex-grow items-center lg:w-3/4 xl:w-4/5">
				<span class="relative w-full">
				<input type="search" placeholder="Search"
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

<%--主体--%>
<div class="flex">
    <!-- 侧边导航栏 -->
    <jsp:include page="side-navbar.jsp"></jsp:include>
    <!-- 内容 -->
    <div class="flex flex-1 flex-col md:px-6 pt-10" id="content">
        <!-- 标题 -->
        <div class="px-6 md:px-0 flex justify-between items-center -order-1">
            <div>
                <h2 class="font-normal">今日推荐</h2>
                <p class="text-grey-dark mt-2">Today's Recommendation</p>
            </div>
        </div>

        <div class="carousel slide hidden px-6 md:px-0 mt-4 md:flex flex-wrap order-1 md:-order-1 md:shadow-md js-tab-pane" id="carousel-example-generic" data-ride="carousel" data-interval="1500">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/img/carousel/carousel-01.jpg">
                    </a>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/carousel/carousel-02.jpg">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/carousel/carousel-03.jpg">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/carousel/carousel-04.jpg">
                </div>
            </div>
            <%--按钮样式--%>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            </a>
        </div>

        <!-- Desktop Stats -->
        <%--<div class="hidden px-6 md:px-0 mt-4 md:flex flex-wrap order-1 md:-order-1 md:shadow-md js-tab-pane"
             id="section-stats">
            <div class="p-4 px-6 w-full md:w-1/2 rounded md:rounded-r-none bg-white shadow-md md:shadow-none">
                <h4>Your favourite authors in this category</h4>
                <table class="mt-4 w-full">
                    <thead class="p-2 text-sm leading-loose border-b text-indigo">
                    <tr>
                        <td>Name</td>
                        <td class="text-center">Owned/Wishlist</td>
                        <td class="text-right">Nationality</td>
                    </tr>
                    </thead>
                    <tbody class="p-2 leading-loose text-sm">
                    <tr class="border-b">
                        <td class="py-2">Yohji Yamamoto</td>
                        <td class="py-2 text-center">5/4</td>
                        <td class="py-2 text-right">Japan</td>
                    </tr>
                    <tr class="border-b">
                        <td class="py-2">Sato Oki</td>
                        <td class="py-2 text-center">1/3</td>
                        <td class="py-2 text-right">Japan</td>
                    </tr>
                    <tr>
                        <td class="py-2">Amaya Arzuaga</td>
                        <td class="py-2 text-center">1/1</td>
                        <td class="py-2 text-right">Spain</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="w-full md:w-1/2 p-4 md:pt-12 md:pl-1 mt-4 md:mt-0 lg:pt-12 lg:pl-8 rounded md:rounded-r-none bg-white shadow-md md:shadow-none">
                <div class="flex">
                    <div class="w-1/2">
                        <p class="text-indigo text-sm p-2">Most read format</p>
                        <p class="font-medium text-sm pl-2">Print</p>
                    </div>
                    <div class="w-1/2">
                        <p class="text-indigo text-sm p-2">Total read/own</p>
                        <p class="font-medium text-sm pl-2">4/7</p>
                    </div>
                </div>
                <div class="pt-6">
                    <p class="text-indigo text-sm p-2">Most re-read book</p>
                    <p class="font-medium text-sm pl-2 leading-normal">Just My Type: A Book About Fonts
                        <br><span class="font-normal">by Simon Garfield</span></p>
                </div>
            </div>
        </div>
--%>
        <!-- 页面选择 -->
        <div class="px-6 pb-2 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-8 ">
            <div>
                <h2 class="font-normal">图书列表</h2>
                <h4 class="hidden md:inline-block text-grey-dark font-normal mt-2">Books</h4>
            </div>

            <button class="mr-8 bg-indigo-dark hover:bg-indigo-darker text-white text-md py-2 px-6 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">
                查看全部
            </button>
        </div>

        <!-- 图书列表 -->
        <div class="hidden px-2 pt-2 md:px-0 flex-wrap pb-8 js-tab-pane active" id="section-library">
            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/1 sm:w-1/2 md:w-1/4 p-4 js-book">
                <img src="${pageContext.request.contextPath}/img/bookImage/defaultNoImg.jpg" alt="book-01"
                     class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo">
                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                    <p class="text-xl my-2 font-bold sm:font-normal">时间简史</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">斯蒂芬·霍金</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">某某出版社</p>
                    <label
                            class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">Loaned</label>
                </div>
            </div>
            <%--测试书--%>
            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/1 sm:w-1/2 md:w-1/4 p-4 js-book">
                <img src="${pageContext.request.contextPath}/img/bookImage/defaultNoImg.jpg" alt="book-01"
                     class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo">
                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                    <p class="text-xl my-2 font-bold sm:font-normal">时间简史</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">斯蒂芬·霍金</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">某某出版社</p>
                    <label
                            class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">Loaned</label>
                </div>
            </div>
            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/1 sm:w-1/2 md:w-1/4 p-4 js-book">
                <img src="${pageContext.request.contextPath}/img/bookImage/defaultNoImg.jpg" alt="book-01"
                     class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo">
                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                    <p class="text-xl my-2 font-bold sm:font-normal">时间简史</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">斯蒂芬·霍金</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">某某出版社</p>
                    <label
                            class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">Loaned</label>
                </div>
            </div>
            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/1 sm:w-1/2 md:w-1/4 p-4 js-book">
                <img src="${pageContext.request.contextPath}/img/bookImage/defaultNoImg.jpg" alt="book-01"
                     class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo">
                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                    <p class="text-xl my-2 font-bold sm:font-normal">时间简史</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">斯蒂芬·霍金</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">某某出版社</p>
                    <label
                            class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">Loaned</label>
                </div>
            </div>
            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/1 sm:w-1/2 md:w-1/4 p-4 js-book">
                <img src="${pageContext.request.contextPath}/img/bookImage/defaultNoImg.jpg" alt="book-01"
                     class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo">
                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                    <p class="text-xl my-2 font-bold sm:font-normal">时间简史</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">斯蒂芬·霍金</p>
                    <p class="text-sm my-2 font-medium sm:font-normal text-grey-darker">某某出版社</p>
                    <label
                            class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">Loaned</label>
                </div>
            </div>

        </div>


        <div class="flex">
            <ul class="pagination">
                <li><a href="#" aria-label="Previous">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#" aria-label="Next">&raquo;</a></li>
            </ul>
        </div>


    </div>



    <!-- Profile -->
    <div class="hidden absolute pin-b z-10 lg:relative lg:block w-full lg:w-1/5 bg-grey-lighter-2 px-6 pt-10"
         id="profile">
        <div class="flex items-center mb-6">
            <svg width="60px" height="60px" viewBox="0 0 60 60" version="1.1" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" id="avatar">
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g transform="translate(-1178.000000, -87.000000)">
                        <g transform="translate(1159.000000, 0.000000)">
                            <g transform="translate(0.000000, 87.000000)">
                                <g transform="translate(19.000000, 0.000000)">
                                    <circle id="small-circle" fill="#5661B3" cx="30" cy="30" r="30"></circle>
                                    <path id="moon"
                                          d="M30.5,49.7304688 C40.7172679,49.7304688 30.5,43.266096 30.5,33.0488281 C30.5,22.8315603 40.7172679,12 30.5,12 C20.2827321,12 11.0390625,20.6479665 11.0390625,30.8652344 C11.0390625,41.0825022 20.2827321,49.7304688 30.5,49.7304688 Z"
                                          fill="#F4E1E0"></path>
                                    <circle id="big-circle" fill="#070707" cx="31" cy="31" r="11"></circle>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <div class="ml-3">
                <p>Amie Chen</p>
                <p class="text-grey-dark mt-1 text-sm">Joined since 2017</p>
            </div>
        </div>
        <div class="my-4 border-t pt-4">
            <h3 class="text-indigo-dark font-normal">You have read <strong>4 of 30 books</strong> in 2018</h3>
            <div class="flex flex-wrap -ml-2 justify-start items-center">
                <img src="./images/read-01.jpg" alt="read"
                     class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
                <img src="./images/read-02.jpg" alt="read"
                     class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
                <img src="./images/read-03.jpg" alt="read"
                     class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
                <img src="./images/read-04.jpg" alt="read"
                     class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
            </div>
        </div>
        <div class="mt-6">
            <p class="text-grey-dark mt-1 text-sm">Currently Reading</p>
            <div class="flex items-start mt-2">
                <img src="./images/read-04.jpg" alt="read"
                     class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block transition-normal hover:brighter">
                <div class="ml-3">
                    <p class="mt-1 leading-normal">Popular Lies* About Graphic Design</p>
                    <p class="text-indigo text-sm mt-1">15/250 pages</p>
                </div>
            </div>
        </div>
    </div>


</div>

<script>
    //轮播图时间间隔
    $('.carousel').carousel({
        interval: 5000
    });
    


</script>
</body>
</html>
