<%-- 
    Document   : viewdetail
    Created on : Oct 28, 2019, 4:30:24 PM
    Author     : NHU QUYNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="include/head-css.jsp"/>
    </head>
    <body class="contacts-index-index ">
        <div class="wrapper">
            <jsp:include page="include/header.jsp"/>
            <div class="em-wrapper-main">
                <div class="container-fluid container-main">
                    <div class="em-inner-main">
                        <div class="em-wrapper-area02"></div>
                        <div class="em-wrapper-area03"></div>
                        <div class="em-wrapper-area04"></div>
                        <div class="em-main-container em-col1-layout">
                            <div class="row">
                                <div class="em-col-main col-sm-22 col-sm-offset-1">
                                    <div id="messages_product_view"></div>


                                    <div class="product-view">
                                        <div class="product-essential">
                                            <form action="${pageContext.request.contextPath}/order_product" method="get" id="product_addtocart_form">
                                                <input name="id" type="hidden" value="${product.id}" />
                                                <div class="product-view-detail">
                                                    <div class="em-product-view row">
                                                        <div class="em-product-view-primary em-product-img-box col-sm-16 first">
                                                            <div id="em-product-shop-pos-top"></div>
                                                            <div class="product-img-box">
                                                                <div class="media-left" >
                                                                    <p class="product-image">
                                                                        <img style = "margin-top: 45px;" class="img-rounded center-block" class="img-rounded" src="<c:url value="/resources/images/product/${product.images[0].name}"/>" width="500" height="500"/></img>
                                                                    </p>
                                                                </div><!-- /.media-left -->
                                                            </div>
                                                        </div><!-- /.em-product-view-primary -->


                                                        <div class="em-product-view-secondary em-product-shop col-sm-8" style = "margin-top: 45px;" >
                                                            <div class="product-shop  fix_menu">
                                                                <div id="em-product-info-basic">
                                                                    <div class="product-name">
                                                                        <h1>${product.name}</h1>
                                                                    </div>

                                                                    <div class="em-sku-availability">
                                                                        <h2 class="availability in-stock"> Producer: <span class="value">${product.producer.name}</span>
                                                                        </h2>
                                                                        <p class="availability in-stock"> Availability: <span class="value">${product.status}</span></p>
                                                                        
                                                                    </div>
                                                                    <div class="short-description">
                                                                        <h2>Quick Overview</h2>
                                                                        <div class="std"><p>${product.category.description}</p></div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="price-box"> <span class="regular-price" id="product-price-206"> <span class="price"  content="${product.price}00VNĐ">${product.price}00VNĐ</span> </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="add-to-box">
                                                                        
                                                                        <div class="add-to-cart">
                                                                            <label for="qty">Qty:</label>
                                                                            <div class="qty_cart">
                                                                                <input name="quantity" type="number" value ="1"
                                                                                       class="input-text qty" style="width: 100px!important" />
                                                                            </div>
                                                                            <div class="button_addto">
<!--                                                                                <s:url var="url_order" value="/order_product">
                                                                                    <s:param name="productId" value="${product.id}" />
                                                                                </s:url>-->
                                                                                <button type="submit" id="em-buy-now" class="button btn-em-buy-now">
                                                                                    <span><span>Order This Game</span></span>
                                                                                </button>
                                                                                <!--<button type="button" title="Add to Cart" id="product-addtocart-button" class="button btn-cart btn-cart-detail"><span><span>Add to Cart</span></span>
                                                                                </button>-->
                                                                            </div>
                                                                        </div><!-- /.add-to-cart -->
                                                                    </div><!-- /.add-to-box -->
                                                                </div><!-- /.em-product-info-basic -->
                                                            </div>
                                                        </div><!-- /.em-product-view-secondary -->
                                                    </div>
                                                    <div class="clearer"></div>
                                                </div><!-- /.product-view-detail -->
                                            </form>
                                        </div><!-- /.product-essential -->
                                        <div class="row">
                                            <div class="em-product-view-primary col-sm-16 first"></div>
                                        </div>
                                    </div>
                                </div><!-- /.product-view -->
                            </div>
                        </div>
                    </div><!-- /.em-main-container -->
                </div>
            </div>
        </div><!-- /.em-wrapper-main -->
        <jsp:include page="include/footer.jsp"/>
    </div>

</body>
</html>
