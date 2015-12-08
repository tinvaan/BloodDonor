<%-- 
    Document   : register
    Created on : 3 Dec, 2015, 10:38:50 PM
    Author     : harish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!--Blood Donor registration form-->
        <div class="jumbotron" id="registrationFormContent" style="margin:0 auto; width:80%">
            <div clas="container">
                <h1 align="center" style="font-family: Garamond">Register yourself as a donor</h1>
                <h2 align="center" style="font-family: Helvetica-narrow">Please enter your details below</h2>

                <form  class="form-horizontal" style="margin:0 auto; width: 40%">
                  <div class="form-group">
                      <label for="userName" class="col-sm-2 control-label" style="font-family: serif">Name</label>
                      <div class="col-sm-10">
                        <input type="TEXT" class="form-control" pattern="[a-zA-Z]" name="donorName" placeholder="Enter your name"></input>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="userEmail" class="col-sm-2 control-label" style="font-family: serif">Email</label>
                      <div class="col-sm-10">
                        <input type="EMAIL" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" name="donorEmail" placeholder="Enter Email id"></input>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="userContactNumber" class="col-sm-2 control-label" style="font-family: serif">Contact</label>
                      <div class="col-sm-10">
                        <input type="TEXT" class="form-control" pattern="[0-9]" minlength="5" maxlength="10" name="donorMobileNumber" placeholder="Mobile Number"></input>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="userLocation" class="col-sm-2 control-label" style="font-family: serif">Location</label>
                      <div class="col-sm-10">
                          <input type="TEXT" class="form-control" pattern="[a-zA-Z]" name="donorResidenceLocation" placeholder="Current location of residence"></input>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="userBloodGroup" class="col-sm-2 control-label" align="right" style="font-family: serif">Blood Group</label>
                      <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="RADIO" id="A_positiveCheckBox" name="group" value="A_positive" style="font-family: serif">A +ve</input>
                        </label>
                        <label class="radio-inline">
                            <input type="RADIO" id="A_negativeCheckBox" name="group" value="A_negative" style="font-family: serif">A -ve</input>
                        </label>
                        <label class="radio-inline">
                            <input type="RADIO" id="B_positiveCheckBox" name="group" value="B_positive" style="font-family: serif">B +ve</input>
                        </label>
                        <label class="radio-inline">
                            <input type="RADIO" id="B_negativeCheckBox" name="group" value="B_negative" style="font-family: serif">B -ve</input>
                        </label>
                      </div>
                      <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="RADIO" id="O_positiveCheckBox" name="group" value="O_positive" style="font-family: serif">O +ve</input>
                        </label>
                        <label class="radio-inline">
                            <input type="RADIO" id="O_negativeCheckBox" name="group" value="O_negative" style="font-family: serif">O -ve</input>
                        </label>
                        <label class="radio-inline">
                            <input type="RADIO" id="AB_positiveCheckBox" name="group" value="AB_positive" style="font-family: serif">AB +ve</input>
                        </label>
                        <label class="radio-inline">
                            <input type="RADIO" id="AB_negativeCheckBox" name="group" value="AB_negative" style="font-family: serif">AB -ve</input>
                        </label>
                      </div>
                      <div class="form-group">
                          <label></label>
                      </div>
                      <div class="form-group">
                          <div class="col-sm-offset-4 col-sm-10" align:"center">
                            <button type="submit" method="POST" action="Register" class="btn btn-default glyphicon glyphicon-log-in"> Register</button>
                        </div>
                      </div>
                  </div>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
