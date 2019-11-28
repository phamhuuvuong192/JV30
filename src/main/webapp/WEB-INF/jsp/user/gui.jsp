<%-- 
    Document   : gui
    Created on : Oct 30, 2019, 3:43:46 PM
    Author     : NHU QUYNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="product_image_area section_padding">
                <div class="container">
                    <div class="row s_product_inner justify-content-between">
                        <div class="col-lg-7 col-xl-7">
                            <div class="product_slider_img">
                                <div id="vertical">
                                    <c:if test="${product.images!=null || fn:length(product.images)>0}">
                                        <c:forEach var="image" items="${product.images}">
                                            <div data-thumb="<c:url value="/resources/images/product/${image.name}"/>">
                                                <img src="<c:url value="/resources/images/product/${image.name}"/>"></img>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-xl-4">
                            <div class="s_product_text">
                                <form action="<s:url value="/update_order"/>">
                                    <h5>Previous<span>|</span> next</h5>
                                    <h3>${product.name}</h3>
                                    <c:if test="${product.price != price_old}">
                                        <div class="c">
                                            <h5>${price_old}00VNĐ</h5>
                                        </div>
                                    </c:if>
                                    <h2>${product.price}00 VNĐ</h2>


                                    <ul class="list">
                                        <li><a class="active" href="#"> <span>Producer</span>${product.producer.name}</a>
                                        </li>
                                        <li><a href="#"> <span>Availibility</span>
                                                ${product.category.status}
                                            </a></li>
                                    </ul>
                                    <p>${product.category.description}</p>
                                    <div
                                        class="card_area d-flex justify-content-between align-items-center">

                                        <s:url var="url_order" value="/order_product">
                                            <s:param name="productId" value="${product.id}" />
                                        </s:url>
                                        <button class="btn btn-info" type="button"
                                                onclick='location.href = "${url_order}"'>order
                                            Product</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
