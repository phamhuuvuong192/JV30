<%-- 
    Document   : order
    Created on : Nov 4, 2019, 2:24:25 PM
    Author     : NHU QUYNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="include/head-css.jsp"/>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="include/header.jsp"/>
            <div class="em-wrapper-main">
                <div class="container container-main">
                    <div class="row">
                        <div class="col-sm-24">
                            <div class="table-responsive">
                                <table id="shopping-cart-table" class="table table-bordered">
                                    <thead>
                                        <tr class="em-block-title">
                                            <th><span class="nobr">Product Name</span>
                                            </th>
                                            <th>Images</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th class="a-center last">Subtotal</th>
                                            <th class="a-center last">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="o" items="${sessionScope.order.orderDetails}" varStatus="st">
                                            <tr class="first odd">
                                                <td>
                                                    <h2 class="product-name"> <a href="${o.name}" > ${o.name} </a></h2>
                                                </td>
                                                <td>
                                                    <img src="<c:url value="/resources/images/product/${o.product.images[0].name}"/>" width="200" class="product-image">                                                  </img>
                                                </td>
                                                <td class="a-center"> <span class="cart-price"> <span class="price" >${o.product.price}00VNĐ</span> </span>
                                                </td>
                                                <td>
                                                    <div class="qty_cart" style="width: 100%">
                                                        <form action="${pageContext.request.contextPath}/update-quantity"
                                                              method="post" >
                                                            <input name="productId" hidden value="${o.product.id}"/>
                                                            <input name="quantity" type="number" value="${o.quantity}"
                                                                   class="input-text qty" style="width: 100px!important" />
                                                            <button class="btn btn-default" style="height: 39px; margin-left: 5px">Update</button>
                                                        </form>
                                                    </div>
                                                </td>
                                                <td class="a-center last"> <span class="cart-price"> <span class="price"><fmt:formatNumber pattern="###,###,###" value="${o.price*1000}"/> VNĐ</span> </span>
                                                </td>
                                                <td>
                                                    <button class="btn btn-danger btn-sm" type="button" 
                                                            onclick='location.href = "<c:url value="/delete_dt/${o.product.id}"/>"'>DELETE
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-24">
                            <div style="text-align: right">
                                <h4>Total Price: <fmt:formatNumber pattern="###,###,###" value="${order.totalPrice*1000}"/> VNĐ</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <button type="button" title="Continue Shopping" class="button btn-continue" onclick='location.href = "<c:url value="/continue"/>"'>
                                <span><span>Continue Shopping</span></span>
                            </button>
                        </div>
                        <sec:authorize access="!isAuthenticated()">
                            <div class="col-sm-12" style="text-align: right">
                                <button type="button" class="button btn-continue" onclick='location.href = "<c:url value="/check_out"/>"'
                                        style="float: right">
                                    <span><span>Order</span></span>
                                </button>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <div class="col-sm-12" style="text-align: right">
                                <button type="button" class="button btn-continue" onclick='location.href = "<c:url value="/user/check_out"/>"'
                                        style="float: right">
                                    <span><span>Order</span></span>
                                </button>
                            </div>
                        </sec:authorize>
                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"/>
        </div>
    </body>
</html>
