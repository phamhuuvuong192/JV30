<%-- 
    Document   : login
    Created on : Jun 20, 2019, 8:17:26 PM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="wrapper-breadcrums">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-24">
                            <div class="breadcrumbs">
                                <ul>
                                    <li class="home"> <a href="http://localhost:8084/JV30_Project_Final/home" title="Go to Home Page"><span >Home</span></a> <span class="separator">/ </span>
                                    </li>
                                    <li class="cms_page"> <strong>Login</strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.wrapper-breadcrums -->
            <div class="em-wrapper-main">
                <div class="container container-main">
                    <div class="em-inner-main">
                        <div class="em-wrapper-area02"></div>
                        <div class="em-main-container em-col1-layout">
                            <div class="row">
                                <div class="em-col-main col-sm-24">
                                    <div class="account-login">
                                        <div class="page-title em-box-02">
                                            <div class="title-box">
                                                <h1>Login or Create an Account</h1>
                                            </div>
                                        </div>
                                        <form method="post" id="login-form" novalidate="novalidate" action="<c:url value="/j_spring_security_check"/>">
                                            <div class="col2-set">
                                                <div class="col-1 new-users">
                                                    <div class="content">
                                                        <h2>New Customers</h2>
                                                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                                                    </div>
                                                    <div class="buttons-set">
                                                        <button type="button" title="Create an Account" class="button"><span><span>Create an Account</span></span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="col-2 registered-users">
                                                    <div class="content">
                                                        <h2>Registered Customers</h2>
                                                        <p>If you have an account with us, please log in.</p>
                                                        <ul class="form-list">
                                                            <li>
                                                                <label for="email" class="required"><em>*</em>Email Address</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="username" value="" id="email" class="input-text required-entry validate-email" title="Email Address" />
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <label for="pass" class="required"><em>*</em>Password</label>
                                                                <div class="input-box">
                                                                    <input type="password" name="password" class="input-text required-entry validate-password" title="Password" />
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="buttons-set">
                                                        <button type="submit" value ="submit" class="button" title="Login" name="send"><span><span>Login</span></span>
                                                        </button> <a href="#" class="f-left">Forgot Your Password?</a>
                                                    </div>
                                                    
                                                    <input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
                                                </div>
                                            </div>
                                        </form>
                                    </div><!-- /.account-login -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.em-wrapper-main -->

            <jsp:include page="include/footer.jsp"/>
        </div>
    </body>
</html>
