<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="include/head-css.jsp"/>
    </head>
    <body class="cms-index-index">
        <c:if test="${message != null}">
            <script>
                alert("Đã đặt hàng , vui lòng kiểm tra lại email");
            </script>
        </c:if>
        <div class="wrapper">
            <jsp:include page="include/header.jsp"/>
            <jsp:include page="include/slide-show.jsp"/>
            <div class="em-wrapper-main">
                <div class="container container-main">
                    <div class="em-inner-main">
                        <div class="em-wrapper-area02">
                            <div class="hidden-xs">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="img-banner-small">
                                            <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em_ads_01" src="<c:url value="resources/images/wysiwyg/em_ads_01.jpg"/>" /><span class="effect-line">&nbsp;</span>
                                            </a>
                                        </div>
                                        <div class="img-banner">
                                            <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em_ads_02" src="<c:url value="resources/images/wysiwyg/em_ads_02.jpg"/>" /><span class="effect-line">&nbsp;</span> </a>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="img-banner">
                                            <div class="effect-hover-text">
                                                <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em_ads_03" src="<c:url value="/resources/images/wysiwyg/em_ads_03.jpg"/>" /> </a>
                                                <a class="banner-text" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="<c:url value = "/resources/images/wysiwyg/em_ads_text_03.png"/>" /> </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="img-banner-small">
                                            <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em_ads_04" src="<c:url value="resources/images/wysiwyg/em_ads_04.jpg"/>" /><span class="effect-line">&nbsp;</span> </a>
                                        </div>
                                        <div class="img-banner">
                                            <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em_ads_05" src="<c:url value="resources/images/wysiwyg/em_ads_05.jpg"/>" /><span class="effect-line">&nbsp;</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.em-wrapper-area02 -->
                        <div class="em-main-container em-col1-layout">
                            <div class="row">
                                <div class="em-col-main col-sm-24">
                                    <div class="std"></div>
                                    <div class="block block-sample">
                                        <div class="em-line-01">
                                            <div class="em-block-title">
                                                <h3><span>New Arrivals</span></h3>
                                            </div>
                                            <div class="em-new-arrivals-tabs em-line-01 button-hide-text">
                                                <div id="em_gameworld_new_arrivals_tab01" class="em-grid-20 ">
                                                    <div class="widget em-filterproducts-grid">
                                                        <div class="widget-products em-widget-products">
                                                            <div id="em-grid-mode-em_gameworld_new_arrivals_tab01">
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
                                                                                            <sec:authorize access="isAuthenticated()">
                                                                                                <ul class="add-to-links">
                                                                                                    <li><a href="<c:url value="/user/add-favorite?productId=${product.id}"/>" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
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
                                            </div><!-- /.em-grid-20 -->
                                        </div>        
                                    </div>   
                                </div><!-- /.block -->
                                <div class="em-wrapper-top-games-slider  em-line-01 button-show01">
                                    <div class="widget-title em-widget-title">
                                        <h3><span>Top Games</span></h3>
                                    </div>
                                    <div class="em-top-games-slider">
                                        <div id="em_ajax_products_49d77777fbd464282288a6cbd5b9e828" class="emfilter-ajaxblock-loaded">
                                            <div id="em_minifilter_products_634834e06ccc85dbb9d829718815cb41" class="em-grid-00 ">
                                                <div class="widget em-filterproducts-grid">
                                                    <div class="widget-products em-widget-products">
                                                        <div class="products-grid owl-carousel owl-theme ">
                                                            <div class="item first">
                                                                <div class="product-item">
                                                                    <div class="product-shop-top">
                                                                        <a href="product-detail.html" title=" Frozen" class="product-image">
                                                                            <!--show label product - label extension is required--><img class="em-alt-hover img-responsive em-img-lazy" src="<c:url value="resources/images/product/350x350/gameword_sp5_2.jpg"/>" width="350" height="350" alt=" Frozen" /> <img class="img-responsive em-img-lazy em-alt-org" src="<c:url value="resources/images/product/350x350/gameword_sp5_1.jpg"/>" width="350" height="350" alt=" Frozen" /> </a>
                                                                        <div class="em-element-display-hover bottom">
                                                                            <div class="em-btn-addto">
                                                                                <!--product add to cart-->
                                                                                <button type="button" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                                <!--product add to compare-wishlist-->
                                                                                <ul class="add-to-links">
                                                                                    <li><a href="#406" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                                                    </li>
                                                                                    <li><span class="separator">|</span> <a href="#406" class="link-compare" title="Add to Compare">Add to Compare</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="quickshop-link-container"> <a href="#" class="quickshop-link" title="Quickshop">Quickshop</a> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-shop">
                                                                        <div class="f-fix">
                                                                            <!--product name-->
                                                                            <h3 class="product-name"><a href="product-detail.html" title=" Frozen"> Frozen</a></h3>
                                                                            <!--product description-->
                                                                            <!--product reviews-->
                                                                            <!--product price-->
                                                                            <div class="price-box"> <span class="regular-price">
                                                                                    <span class="price">$860.00</span> </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.item -->
                                                            <div class="item">
                                                                <div class="product-item">
                                                                    <div class="product-shop-top">
                                                                        <a href="product-detail.html" title="Cinderella 2-Disc" class="product-image">
                                                                            <!--show label product - label extension is required--><img class="em-alt-hover img-responsive em-img-lazy" src="<c:url value="resources/images/product/350x350/gameword_sp10_2.jpg"/>" width="350" height="350" alt="Cinderella 2-Disc" /> <img class="img-responsive em-img-lazy em-alt-org" src="<c:url value="resources/images/product/350x350/gameword_sp10_1.jpg"/>" width="350" height="350" alt="Cinderella 2-Disc" /> </a>
                                                                        <div class="em-element-display-hover bottom">
                                                                            <div class="em-btn-addto">
                                                                                <!--product add to cart-->
                                                                                <button type="button" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                                <!--product add to compare-wishlist-->
                                                                                <ul class="add-to-links">
                                                                                    <li><a href="#411" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                                                    </li>
                                                                                    <li><span class="separator">|</span> <a href="#411" class="link-compare" title="Add to Compare">Add to Compare</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="quickshop-link-container"> <a href="#" class="quickshop-link" title="Quickshop">Quickshop</a> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-shop">
                                                                        <div class="f-fix">
                                                                            <!--product name-->
                                                                            <h3 class="product-name"><a href="product-detail.html" title="Cinderella 2-Disc">Cinderella 2-Disc</a></h3>
                                                                            <!--product description-->
                                                                            <!--product reviews-->
                                                                            <!--product price-->
                                                                            <div class="price-box"> <span class="regular-price">
                                                                                    <span class="price">$150.00</span> </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.item -->
                                                            <div class="item">
                                                                <div class="product-item">
                                                                    <div class="product-shop-top">
                                                                        <a href="product-detail.html" title="Furious 7" class="product-image">
                                                                            <!--show label product - label extension is required--><img class="em-alt-hover img-responsive em-img-lazy" src="<c:url value="resources/images/product/350x350/gameword_sp7_2.jpg"/>" width="350" height="350" alt="Furious 7" /> <img class="img-responsive em-img-lazy em-alt-org" src="<c:url value="resources/images/product/350x350/gameword_sp7_1.jpg"/>" width="350" height="350" alt="Furious 7" /> </a>
                                                                        <div class="em-element-display-hover bottom">
                                                                            <div class="em-btn-addto">
                                                                                <!--product add to cart-->
                                                                                <button type="button" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                                <!--product add to compare-wishlist-->
                                                                                <ul class="add-to-links">
                                                                                    <li><a href="#408" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                                                    </li>
                                                                                    <li><span class="separator">|</span> <a href="#408" class="link-compare" title="Add to Compare">Add to Compare</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="quickshop-link-container"> <a href="#" class="quickshop-link" title="Quickshop">Quickshop</a> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-shop">
                                                                        <div class="f-fix">
                                                                            <!--product name-->
                                                                            <h3 class="product-name"><a href="product-detail.html" title="Furious 7">Furious 7</a></h3>
                                                                            <!--product description-->
                                                                            <!--product reviews-->
                                                                            <!--product price-->
                                                                            <div class="price-box"> <span class="regular-price">
                                                                                    <span class="price">$110.00</span> </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.item -->
                                                            <div class="item">
                                                                <div class="product-item">
                                                                    <div class="product-shop-top">
                                                                        <a href="product-detail.html" title="Iron Man 3" class="product-image">
                                                                            <!--show label product - label extension is required--><img class="em-alt-hover img-responsive em-img-lazy" src="<c:url value="resources/images/product/350x350/gameword_sp3_2.jpg"/>" width="350" height="350" alt="Iron Man 3" /> <img class="img-responsive em-img-lazy em-alt-org" src="<c:url value="resources/images/product/350x350/gameword_sp3_1.jpg"/>" width="350" height="350" alt="Iron Man 3" /> </a>
                                                                        <div class="em-element-display-hover bottom">
                                                                            <div class="em-btn-addto">
                                                                                <!--product add to cart-->
                                                                                <button type="button" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                                <!--product add to compare-wishlist-->
                                                                                <ul class="add-to-links">
                                                                                    <li><a href="#404" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                                                    </li>
                                                                                    <li><span class="separator">|</span> <a href="#404" class="link-compare" title="Add to Compare">Add to Compare</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="quickshop-link-container"> <a href="#" class="quickshop-link" title="Quickshop">Quickshop</a> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-shop">
                                                                        <div class="f-fix">
                                                                            <!--product name-->
                                                                            <h3 class="product-name"><a href="product-detail.html" title="Iron Man 3">Iron Man 3</a></h3>
                                                                            <!--product description-->
                                                                            <!--product reviews-->
                                                                            <!--product price-->
                                                                            <div class="price-box"> <span class="regular-price">
                                                                                    <span class="price">$130.00</span> </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.item -->
                                                            <div class="item">
                                                                <div class="product-item">
                                                                    <div class="product-shop-top">
                                                                        <a href="product-detail.html" title="Jupiter Ascending" class="product-image">
                                                                            <!--show label product - label extension is required--><img class="em-alt-hover img-responsive em-img-lazy" src="<c:url value="resources/images/product/350x350/gameword_sp8_2.jpg"/>" width="350" height="350" alt="Jupiter Ascending" /> <img class="img-responsive em-img-lazy em-alt-org" src="<c:url value="resources/images/product/350x350/gameword_sp8_1.jpg"/>" width="350" height="350" alt="Jupiter Ascending" /> </a>
                                                                        <div class="em-element-display-hover bottom">
                                                                            <div class="em-btn-addto">
                                                                                <!--product add to cart-->
                                                                                <button type="button" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                                <!--product add to compare-wishlist-->
                                                                                <ul class="add-to-links">
                                                                                    <li><a href="#409" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                                                    </li>
                                                                                    <li><span class="separator">|</span> <a href="#409" class="link-compare" title="Add to Compare">Add to Compare</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="quickshop-link-container"> <a href="#" class="quickshop-link" title="Quickshop">Quickshop</a> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-shop">
                                                                        <div class="f-fix">
                                                                            <!--product name-->
                                                                            <h3 class="product-name"><a href="product-detail.html" title="Jupiter Ascending">Jupiter Ascending</a></h3>
                                                                            <!--product description-->
                                                                            <!--product reviews-->
                                                                            <!--product price-->
                                                                            <div class="price-box"> <span class="regular-price">
                                                                                    <span class="price">$170.00</span> </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.item -->
                                                            <div class="item last">
                                                                <div class="product-item">
                                                                    <div class="product-shop-top">
                                                                        <a href="product-detail.html" title="Jurassic World" class="product-image">
                                                                            <!--show label product - label extension is required--><img class="em-alt-hover img-responsive em-img-lazy" src="<c:url value="resources/images/product/350x350/gameword_sp9_2.html"/>" width="350" height="350" alt="Jurassic World" /> <img class="img-responsive em-img-lazy em-alt-org" src="<c:url value="resources/images/product/350x350/gameword_sp9_1.html"/>" width="350" height="350" alt="Jurassic World" /> </a>
                                                                        <div class="em-element-display-hover bottom">
                                                                            <div class="em-btn-addto">
                                                                                <!--product add to cart-->
                                                                                <button type="button" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                                <!--product add to compare-wishlist-->
                                                                                <ul class="add-to-links">
                                                                                    <li><a href="#410" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                                                    </li>
                                                                                    <li><span class="separator">|</span> <a href="#410" class="link-compare" title="Add to Compare">Add to Compare</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="quickshop-link-container"> <a href="#" class="quickshop-link" title="Quickshop">Quickshop</a> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-shop">
                                                                        <div class="f-fix">
                                                                            <!--product name-->
                                                                            <h3 class="product-name"><a href="product-detail.html" title="Jurassic World">Jurassic World</a></h3>
                                                                            <!--product description-->
                                                                            <!--product reviews-->
                                                                            <!--product price-->
                                                                            <div class="price-box"> <span class="regular-price">
                                                                                    <span class="price">$750.00</span> </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.item -->
                                                        </div>
                                                    </div>
                                                </div><!-- /.widget -->
                                            </div>
                                        </div>
                                    </div><!-- /.em-top-games-slider -->
                                </div>
                            </div>
                        </div>
                        <div class="em-wrapper-area06">
                            <div class="row">
                                <div class="col-sm-24">
                                    <div class="em-wrapper-ads-10 em-line-01">
                                        <div class="em-block-title">
                                            <h2><span>From Our Blog</span></h2>
                                        </div>
                                        <div class="em-slider em-slider-from-our-blog" data-emslider-navigation="true" data-emslider-items="3" data-emslider-desktop="3" data-emslider-desktop-small="2" data-emslider-tablet="2" data-emslider-mobile="1">
                                            <div class="em-blog-item em-effect-13 em-blog-style02">
                                                <div class="em-blog-content bkg-top">
                                                    <a title="em-sample-title" class="img-banner-small" href="blog-detail.html"> <img alt="em_blog" class="img-responsive" src="<c:url value="resources/images/blog/em-ads-08.jpg"/>" /> </a>
                                                    <div class="em-blog-time">
                                                        <p class="em-blog-date">21</p>
                                                        <p class="em-blog-month">Jul</p>
                                                    </div>
                                                    <div class="hov">&nbsp;</div>
                                                </div>
                                                <div class="em-box bkg-bottom">
                                                    <h4 class="em-blog-title"><a href="blog-detail.html">Pineapples, Mermaids and&hellip;</a></h4>
                                                    <p class="em-blog-des">Boutique festival Secret Garden went down in Sydney&rsquo;s&nbsp;Camden over the weekend, and all the free-spirited kids came out to&hellip;</p>
                                                    <p><a class="link-more" href="blog-detail.html">Read more</a>
                                                    </p>
                                                </div>
                                            </div><!-- /.em-blog-item -->
                                            <div class="em-blog-item em-effect-13 em-blog-style02">
                                                <div class="em-blog-content bkg-top">
                                                    <a title="em-sample-title" class="img-banner-small" href="blog-detail.html"> <img alt="em_blog" class="img-responsive" src="<c:url value="resources/images/blog/em-ads-09.jpg"/>" /> </a>
                                                    <div class="em-blog-time">
                                                        <p class="em-blog-date">21</p>
                                                        <p class="em-blog-month">Jul</p>
                                                    </div>
                                                    <div class="hov">&nbsp;</div>
                                                </div>
                                                <div class="em-box bkg-bottom">
                                                    <h4 class="em-blog-title"><a href="blog-detail.html">11 Emerging Jewelry&hellip;</a></h4>
                                                    <p class="em-blog-des">Jewelry&nbsp;designers are a little like the stepchild of the fashion industry. They&rsquo;re adored, but tend to play second fiddle to&hellip;</p>
                                                    <p><a class="link-more" href="blog-detail.html">Read more</a>
                                                    </p>
                                                </div>
                                            </div><!-- /.em-blog-item -->
                                            <div class="em-blog-item em-effect-13 em-blog-style02">
                                                <div class="em-blog-content bkg-top">
                                                    <a title="em-sample-title" class="img-banner-small" href="blog-detail.html"> <img alt="em_blog" class="img-responsive" src="<c:url value="resources/images/blog/em-ads-10.jpg"/>" /> </a>
                                                    <div class="em-blog-time">
                                                        <p class="em-blog-date">21</p>
                                                        <p class="em-blog-month">Jul</p>
                                                    </div>
                                                    <div class="hov">&nbsp;</div>
                                                </div>
                                                <div class="em-box bkg-bottom">
                                                    <h4 class="em-blog-title"><a href="blog-detail.html">Target’s Lilly&hellip;</a></h4>
                                                    <p class="em-blog-des">A few weeks after announcing that&nbsp;Lilly Pulitzer&nbsp;would be its next design collaboration, which will include&hellip;</p>
                                                    <p><a class="link-more" href="blog-detail.html">Read more</a>
                                                    </p>
                                                </div>
                                            </div><!-- /.em-blog-item -->
                                            <div class="em-blog-item em-effect-13 em-blog-style02">
                                                <div class="em-blog-content bkg-top">
                                                    <a title="em-sample-title" class="img-banner-small" href="blog-detail.html"> <img alt="em_blog" class="img-responsive" src="<c:url value="resources/images/blog/em-ads-08_1.jpg"/>" /> </a>
                                                    <div class="em-blog-time">
                                                        <p class="em-blog-date">21</p>
                                                        <p class="em-blog-month">Jul</p>
                                                    </div>
                                                    <div class="hov">&nbsp;</div>
                                                </div>
                                                <div class="em-box bkg-bottom">
                                                    <h4 class="em-blog-title"><a href="blog-detail.html">The Apple Watch Sport Is&hellip;</a></h4>
                                                    <p class="em-blog-des">If you ordered yourself an Apple Watch Sport, you might want to treat it with a little TLC now that&nbsp;reports&nbsp;are&hellip;</p>
                                                    <p><a class="link-more" href="blog-detail.html">Read more</a>
                                                    </p>
                                                </div>
                                            </div><!-- /.em-blog-item -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.em-wrapper-area06 -->
                    </div>
                </div>
            </div><!-- /.em-wrapper-main -->

            <jsp:include page="include/footer.jsp"/>
        </div>
    </body>
</html>
