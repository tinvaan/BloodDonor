<%-- 
    Document   : top-navbar
    Created on : 3 Dec, 2015, 10:30:16 PM
    Author     : harish
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">

<script src="assets/js/bootstrap.min.js"></script>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Blood Donor</a>
        </div>
        <div class="collapse navbar-collapse" id="top-navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
            </ul>
            <form class="navbar-form form-inline navbar-right" role="search" method="GET" action="LoginHandler">
                <%
                    if (request.getSession().getAttribute("logged_inUserName") != null) {
                        String user = request.getSession().getAttribute("logged_inUserName").toString();
                        if (user != null) {
                %>
                        <div class="form-group" id="userNameOrEmailField">
                            <label for="userNameOrEmail"></label>
                            <input type="TEXT" class="warning form-control" pattern="[a-zA-Z][0-9]" id="userNameOrEmail" name="username" placeholder="Username">
                        </div>
                        <div class="form-group" id="userPasswordField">
                            <label for="userPassword"></label>
                            <input type="PASSWORD" class="warning form-control" id="userPassword" name="password" placeholder="Password">
                        </div>
                        <button type="submit" id="triggerSignin" method="GET" action="LoginHandler" class="btn btn-success">Sign In</button>
                <%
                        }
                    } else
                    {
                %>
                        <div class="form-group" id="userNameOrEmailField">
                            <label for="userNameOrEmail"></label>
                            <input type="TEXT" class="form-control" id="userNameOrEmail" name="username" placeholder="Username">
                        </div>
                        <div class="form-group" id="userPasswordField">
                            <label for="userPassword"></label>
                            <input type="PASSWORD" class="form-control" id="userPassword" name="password" placeholder="Password">
                        </div>
                        <button type="submit" id="triggerSignin" method="GET" action="LoginHandler" class="btn btn-success">Sign In</button>
                <%        
                    }
                %>
            </form>
        </div>
    </div>
</nav>
