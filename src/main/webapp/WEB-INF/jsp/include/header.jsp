<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="em-wrapper-header">
    <div class="hidden-xs em-header-style29">
        <div class="em-header-top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-24">
                        <div class="">
                            <div class="em-top-links">
                                <div class="f-right"></div>
                                <sec:authorize access="isAuthenticated()">
                                    <div class="f-right">
                                        <ul class="em-links-wishlist">
                                            <li class="first last"><a href="<c:url value="/logout"/>" title="Logout">Logout</a></li>
                                        </ul>
                                    </div>
                                    <ul class="list-inline f-right">
                                        <li><span>Welcome </span><sec:authentication property="principal.fullName"/><span>!</span></li>
                                    </ul>
                                </sec:authorize>

                                <sec:authorize access="!isAuthenticated()">
                                    <ul class="list-inline f-right">
                                        <li><a class="em-register-link" href="register.html" title="Register">Register</a></li>
                                    </ul>
                                    
                                    <div id="em-login-link" class="account-link f-right em-non-login"> <a href="<c:url value="${request.contextPath}/login"/>" class="link-account" id="link-login" title="Login">Login</a>
                                    </div><!-- /#em-login-link -->
                                </sec:authorize>
                            </div><!-- /.em-top-links -->
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.em-header-top -->
        <div class="em-header-middle">
            <div class="container em-menu-fix-pos">
                <div class="row">
                    <div class="col-sm-24">
                        <div class="em-logo f-left"><a href="http://localhost:8084/JV30_Project_Final/home" title="Game World Commerce" class="logo"><strong>Game World Commerce</strong><img class="retina-img" src="<c:url value="/resources/images/logo.png"/>" alt="Game World Commerce"></a>
                        </div>
                        <form action="${pageContext.request.contextPath}/search" method="GET" class="form-inline">
                            <div class="em-search f-right">
                                <div class="em-top-search">
                                    <div class="em-search-style02">
                                        <div class="em-no-category-search">
                                            <form id="search_mini_form" method="get">
                                                <div class="form-search no_cate_search">
                                                    <div class="text-search">
                                                        <label for="search">Search:</label>
                                                        <input id="search" type="text" name="searchTxt" value="" class="input-text" maxlength="128" placeholder="Search games here...">
                                                        <button type="submit" value="search" class="button"><span><span>Search</span></span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.em-search -->
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- /.em-header-middle -->
        <div id="em-fixed-top"></div>
        <div class="em-header-bottom em-fixed-top">
            <div class="container em-menu-fix-pos">
                <div class="row">
                    <div class="col-sm-24">
                        <div class="em-logo-sticky f-left">
                            <a href="http://localhost:8084/JV30_Project_Final/home" title="Game World Commerce" class="logo"><img src="<c:url value="/resources/images/logo_small.png"/>" alt="Game World Commerce">
                            </a>
                        </div>
                        <form action="${pageContext.request.contextPath}/search" method="GET" class="form-inline">
                            <div class="em-search em-search-sticky f-right">
                                <div class="em-top-search">
                                    <div class="em-wrapper-js-search em-search-style01">
                                        <div class="em-wrapper-search"> <a class="em-search-icon" title="Search" href="javascript:void(0);"><span>Search</span></a>
                                            <div class="em-container-js-search" style="display: none;">
                                                <form id="search_mini_form_fixed_top" method="get">
                                                    <div class="form-search">
                                                        <label for="search">Search:</label>
                                                        <input id="search-fixed-top" type="text" name="searchTxt" value="" class="input-text" maxlength="128" placeholder="Search entire store here...">
                                                        <button type="submit" value="search" class="button"><span><span>Search</span></span>
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.em-search -->
                        </form>
                        <div class="em-menu-hoz">
                            <div id="em-main-megamenu">
                                <div class="em-menu">
                                    <div class="megamenu-wrapper wrapper-11_9908">
                                        <div class="em_nav" id="toogle_menu_11_9908">
                                            <ul class="hnav effect-menu">
                                                <li class="menu-item-link menu-item-depth-0 menu_custom menu_col6 menu-item-parent"><a href="javascript:void(0)" class="arrow"><span>&gt;</span></a>
                                                    <a class="em-menu-link" href="#"> <span> Category </span> </a>
                                                    <ul class="menu-container" style="">
                                                        <li class="menu-item-vbox menu-item-depth-1 col-menu menu_col5 grid_5 menu-item-parent" style="">
                                                            <ul class="menu-container">
                                                                <li class="menu-item-text menu-item-depth-2  col-md-24 ">
                                                                    <ul class="em-catalog-navigation vertical">
                                                                        <c:if test="${category!=null || fn:length(category)>0}">
                                                                            <c:forEach var="category" items="${category}">
                                                                                <li>
                                                                                    <a href="${pageContext.request.contextPath}/findProductByCategory/${category.id}">${category.name}</a>
                                                                                </li>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </ul>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li><!-- /.menu-item-link -->
                                                <li class="menu-item-link menu-item-depth-0  menu-item-parent"><a href="javascript:void(0)" class="arrow"><span>&gt;</span></a>
                                                    <a class="em-menu-link" href="http://localhost:8084/JV30_Project_Final/home"> <span> Home </span> </a>
                                                </li><!-- /.menu-item-link -->
                                                <li class="menu-item-link menu-item-depth-0  menu-item-parent"><a href="javascript:void(0)" class="arrow"><span>&gt;</span></a>
                                                </li><!-- /.menu-item-link -->
                                                <sec:authorize access="isAuthenticated()">
                                                    <li class="menu-item-link menu-item-depth-0  menu-item-parent"><a href="javascript:void(0)" class="arrow"><span>&gt;</span></a>
                                                        <a class="em-menu-link" href="${pageContext.request.contextPath}/user/wishlist"> <span>WishList</span> </a>
                                                    </li><!-- /.menu-item-link -->
                                                </sec:authorize>
                                            </ul>
                                        </div>
                                    </div><!-- /.megamenu-wrapper -->
                                </div>
                            </div>
                        </div><!-- /.em-menu-hoz -->
                        <div class="em-top-cart-sticky em-top-cart f-right">
                            <div class="em-wrapper-js-topcart em-wrapper-topcart em-no-quickshop">
                                <div class="em-container-topcart">
                                    <div class="em-summary-topcart">
                                        <a class="em-amount-js-topcart em-amount-topcart" title="Shopping Cart" href="${pageContext.request.contextPath}/shopping_cart">
                                            <span class="em-topcart-text">My Cart:</span> <span class="em-topcart-qty"></span> </a>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.em-top-cart-sticky -->
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.em-header-style29 -->
</div>