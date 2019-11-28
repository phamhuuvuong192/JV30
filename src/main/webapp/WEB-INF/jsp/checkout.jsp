<%-- 
    Document   : checkout
    Created on : Nov 4, 2019, 2:10:59 PM
    Author     : NHU QUYNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="include/head-css.jsp"/>
        <style>
            .required{
                color: red;
            }
        </style>
    </head>
    <body class="cms-index-index">

        <div class="wrapper">
            <jsp:include page="include/header.jsp"/>
            <div class="container">
                <div class="col-lg-14">
                    <div>
                        </br>
                        <h2>Billing Information</h2>
                    </div>
                    <div id="checkout-step-billing" class="step a-item collapse in">
                        <form:form class="row contact_form"
                                   action="${pageContext.request.contextPath}/${action}"
                                   method="post" novalidate="novalidate" modelAttribute="customerInfo">
                            <div class="form-group">
                                <label class="required"><em>*</em>Full Name</label>
                                <div class="input-box">
                                    <input type="text" name="fullName" value="${acc.fullName}" placeholder="Full name" maxlength="255" 
                                           class="input-text required-entry form-control" />
                                    <form:errors path="fullName" cssClass="ui-error required" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="billing:telephone" class="required"><em>*</em>Telephone</label>
                                <div class="input-box">
                                    <input type="text"  name="phoneNumber" value="${acc.phoneNumber}" placeholder="Phone Number" 
                                           title="Telephone" class="input-text form-control required-entry" id="billing:telephone" />
                                    <form:errors path="phoneNumber" cssClass="ui-error required" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="billing:lastname" class="required"><em>*</em>Email Address</label>
                                <div class="input-box">
                                    <input type="text" name="email" value="${acc.email}" placeholder="Email" title="Email Address" 
                                           maxlength="255" class="input-text form-control required-entry" />
                                    <form:errors path="email" cssClass="ui-error required" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="billing:lastname" class="required"><em>*</em>Address</label>
                                <div class="input-box">
                                    <input type="text" name="address" value="${acc.address}" placeholder="Address" title="Address" 
                                           maxlength="255" class="input-text form-control required-entry" />
                                    <form:errors path="address" cssClass="ui-error required" />
                                </div>
                            </div>
                            <sec:authorize access="isAuthenticated()">
                                <label path="gender" class="control-label">Gender</label>
                                <c:forEach items="${genders}" var="gender">
                                    <c:if test="${gender==acc.gender}" >
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" checked value="${gender}" style="float: none; margin-left: 0px;"/>
                                            ${gender}
                                        </label>
                                    </c:if>
                                    <c:if test="${gender!=acc.gender}" >
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="${gender}" style="float: none; margin-left: 0px;"/>
                                            ${gender}
                                        </label>
                                    </c:if>
                                </c:forEach>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                                <div class="form-group">
                                    <label path="gender" class="control-label">
                                        Gender</label>
                                        <c:forEach items="${genders}" var="gender">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="${gender}" style="float: none; margin-left: 0px;">${gender}
                                        </label>
                                    </c:forEach>
                                </div>
                            </sec:authorize>
                            <div class="buttons-set">
                                <button type="submit" class="button"><span><span>Confirm</span></span>
                                </button>
                            </div>
                        </form:form>

                    </div>
                </div><!-- /#checkout-step-billing -->

                <div class="col-lg-10">
                    <div>
                        </br>
                        <h2>Your Order</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" style="background-color: #FFF">
                            <tr>
                                <td style="text-align: center">Product</td>
                                <td style="text-align: center">Quantity</td>
                                <td style="text-align: center">Total</td>
                            </tr>
                            <c:forEach var="o" items="${order.orderDetails}" varStatus="st">
                                <tr>
                                    <td>${o.name}</td>
                                    <td style="text-align: center">${o.quantity}</td>
                                    <td style="text-align: center"><fmt:formatNumber pattern="###,###,###" value="${o.price*1000}"/> VND</td>

                                </tr>
                            </c:forEach>
                            <tr>
                                <td>Shipping Fee</td>
                                <td></td>
                                <td style="text-align: center">50.000VNĐ</td>
                            </tr>
                            <tr>
                                <td>Total: </td>
                                <td></td>
                                <td style="text-align: center"><fmt:formatNumber pattern="###,###,###" value="${order.totalPrice*1000}"/> VNĐ</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </div>
</body>
</html>
