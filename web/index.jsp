<%-- 
    Document   : index
    Created on : 3 Dec, 2015, 10:04:45 PM
    Author     : harish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
        <title>Blood Donor</title>
    </head>
    <body>
        <jsp:include page="top-navbar.jsp" />
        <div class="jumbotron" id="aboutContent" style="margin:0 auto; width:80%">
            <div class="container">
                <h1>Blood Donor</h1>
                <h2>Allows you to </h2></br>
                <dl class="dl-horizontal">
                    <dt class="glyphicon glyphicon-check"></dt><dd><h4>Look up donors with suitable blood groups.</h4></dd>
                    <dt class="glyphicon glyphicon-check"></dt><dd><h4>Register yourself as a donor and help the community.</h4></dd>
                    <dt class="glyphicon glyphicon-check"></dt><dd><h4>Make different types of requests.</h4></dd>
                    <dt class="glyphicon glyphicon-check"></dt><dd><h4>Blood donation on the go. Our volunteers will arrive at a location near you.</h4></dd>
                </dl>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
