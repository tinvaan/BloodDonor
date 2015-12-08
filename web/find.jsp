<%-- 
    Document   : find
    Created on : 3 Dec, 2015, 10:48:04 PM
    Author     : harish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css">
        <title>Blood Donor</title>
    </head>
    <body>
        <jsp:include page="top-navbar.jsp"/>
        <div class="jumbotron" id="searchDonors" style="margin:0 auto; width:80%">
            <div class="container">
                <h2 style="font-family: Garamond" align:"center">Search for donors in your location</h2>
                <!--Search Box-->
                    <div class="row" style="margin:0 auto; width: 50%">
                        <div class="col-md-12">
                            <div class="input-group" id="adv-search">
                                <input type="text" class="form-control" placeholder="Type to search" />
                                <div class="input-group-btn">
                                    <div class="btn-group" role="group">
                                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!--/Search Box-->
            </div>
            <!--Display search results in a table-->
            <div class="table-responsive" style="margin:0 auto; width:80%">
                <table class="table table-condensed table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Location</th>
                            <th>Blood Group</th>
                            <th>Contact</th>
                            <th>Email id</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Class.forName("org.postgresql.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "harish", "harish");
                            String query = "SELECT * from donors";
                            PreparedStatement ps = conn.prepareStatement(query);
                            ResultSet rs = ps.executeQuery();
                            String donorName, donorLocation, donorBloodGroup, donorContactNumber, donorEmail;
                            while (rs.next()) {
                                donorName = rs.getString("d_name");
                                donorBloodGroup = rs.getString("d_bloodGroup");
                                donorLocation = rs.getString("d_location");
                                donorEmail = rs.getString("d_email");
                                donorContactNumber = rs.getString("d_contact");
                        %>
                        <tr>
                            <td><%= donorName %></td>
                            <td><%= donorLocation %></td>
                            <td><%= donorBloodGroup %></td>
                            <td><%= donorContactNumber %></td>
                            <td><%= donorEmail %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!--/Display search results in a table-->
        </div>
        <jsp:include page="footer.jsp"/>
</html>
