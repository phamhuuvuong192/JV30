<%-- 
    Document   : category
    Created on : Nov 1, 2019, 12:35:41 AM
    Author     : NHU QUYNH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="include/head-css.jsp"/>
    </head>
    <body class="cms-index-index">
        <div class="wrapper">
            <jsp:include page="include/header.jsp"/>
            <div class="em-wrapper-main" >
                <div class="container">
                    <div id="em_gameworld_new_arrivals_tab01" >
                        <div class="products-grid owl-carousel owl-theme ">
                            <c:if test="${products!=null || fn:length(products)>0}">
                                <c:forEach var="product" items="${products}">
                                    <div class="item first">
                                        <div class="product-item">
                                            <a href="<c:url value="/view-detail/${product.id}"/>" title="${product.name}" class="product-image">
                                                <div class="product-shop-top">

                                                    <!--show label product - label extension is required-->
                                                <img src="<c:url value="/resources/images/product/${product.images[0].name}"/>" width="350" height="350"/> </a>
                                            <div class="em-element-display-hover bottom">
                                                <div class="em-btn-addto">
                                                    <!--product add to cart-->
                                                    <form action = "${pageContext.request.contextPath}/order_product">
                                                        <input name="id" type="hidden" value="${product.id}" />
                                                        <input name="quantity" type="hidden" value="1" />
                                                        <button type="submmit" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                        </button>
                                                    </form>
<!--                                                <button type="button" onclick='location.href ="<c:url value="/order_product?id=${product.id}"/>"' title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                </button>-->
                                                    <sec:authorize access="isAuthenticated()">
                                                        <ul class="add-to-links">
                                                            <li><a href="#406" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                            </li>
                                                        </ul>
                                                    </sec:authorize>
                                                </div>
                                                <div class="quickshop-link-container"> <a href="<c:url value="/view-detail/${product.id}"/>" title="${product.name}" class="quickshop-link" title="Quickshop">Quickshop</a> </div>
                                            </div>
                                        </div>
                                        <div class="product-shop">
                                            <div class="f-fix">
                                                <!--product name-->
                                                <h3 class="product-name"><a href= "<c:url value="/view-detail/${product.id}"/>" title="${product.name}">${product.name}</a></h3>
                                                <!--product description-->
                                                <!--product reviews-->
                                                <!--product price-->
                                            </div>
                                            <div class="price-box"> <span class="regular-price">
                                                    <span class="price">${product.price}00 đ</span> </span>
                                            </div>
                                        </div>
                                        </img>
                                    </div>
                                </div><!-- /.item -->
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </div>
</body>
</html>
