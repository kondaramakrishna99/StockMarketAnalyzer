<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>STOCK MARKET ANALYZER</title>
    <link href="../resources/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myInverseNavbar2" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <a class="navbar-brand" href="home.jsp">Stock Market Analyzer</a> </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="myInverseNavbar2">
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-xs">
            <div id="carousel-299058" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-299058" data-slide-to="0" class=""> </li>
                    <li data-target="#carousel-299058" data-slide-to="1" class="active"> </li>
                    <li data-target="#carousel-299058" data-slide-to="2" class=""> </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item"> <img class="img-responsive" src="../resources/images/img20.jpg" alt="thumb">
                        <div class="carousel-caption"></div>
                    </div>
                    <div class="item active"> <img class="img-responsive" src="../resources/images/img21.jpg" alt="thumb">
                        <div class="carousel-caption"> </div>
                    </div>
                    <div class="item"> <img class="img-responsive" src="../resources/images/img22.jpg" alt="thumb">
                        <div class="carousel-caption"> </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-299058" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel-299058" data-slide="next"><span class="icon-next"></span></a></div>
        </div>
    </div>
    <hr>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-9 col-md-12">
            <div class="row">
                <form:form id="myForm" modelAttribute="user" action="/register" method="post">

                    <script>
                        function validateEmail(email)
                        {
                            var re = /\S+@\S+\.\S+/;
                            if(!email.match(re)){
                                alert("Email should have a valid format:");
                            }

                        }
                    </script>

                    <script>
                        function isValidDate(dateString) {
                            var rxDatePattern = /^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/; //Declare Regex
                            var dtArray = dateString.match(rxDatePattern); // is format OK?

                            if (dtArray == null){
                                alert("Date should be entered in the format: yyyy-mm-dd");
                                location.reload();
                            }

                        }

                    </script>

                    <script>
                        function validateNumber(phonenum){
                            if (/^\d{10}$/.test(phonenum)) {
                                // value is ok, use it
                            } else {
                                alert("Invalid number; must be ten digits");
                                number.focus();
                            }
                        }
                    </script>

                    <script>
                        function checkSalary(obj) {
                            if(!isNaN(obj) && obj >= 0 && obj.length > 0) {
                                return true;
                            } else {
                                alert("you must enter a valid salary")
                                return false;
                            }
                        }
                    </script>



                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <h3>User Registration</h3>
                    <div class="left">
                        <label>UserName</label>
                    </div>
                    <div class="right">
                        <form:input path="Username" id="username" cssClass="form-control" type="text" minlength="5" required="true"/><br>
                    </div>

                    <div class="left">
                        <label>Password</label>
                    </div>
                    <div class="right">
                        <form:input path="Password" id="pwd" type="password" cssClass="form-control" minlength="5" required="true"></form:input>
                        <br>
                    </div>

                    <div class="left">
                        <label>Name</label>
                    </div>
                    <div class="right">
                        <form:input path="Name" id="name" type="text" cssClass="form-control" minlength="2" required="true"></form:input>
                        <br>
                    </div>

                    <div class="left">
                        <label>Email</label>
                    </div>
                    <div class="right">
                        <form:input path="Email" id="email" type="text" cssClass="form-control" minlength="8" onChange="validateEmail(email.value)"  required="true"></form:input>
                        <br>
                    </div>

                    <div class="left">
                        <label>Gender</label>
                    </div>
                    <div class="right">
                        <form:radiobutton path="Gender" value="male"/>Male<br>
                        <form:radiobutton path="Gender" value="female"/>Female<br>
                        <br>
                    </div>

                    <div class="left">
                        <label>DOB</label>
                    </div>
                    <div class="right">
                        <input type="text" class="form-control" id="dob" aria-describedby="basic-addon1" placeholder="yyyy-mm-dd" onChange="isValidDate(dob.value)">
                        <br>
                        <br>
                    </div>

                        <div class="left">
                            <label>Address</label>
                        </div>
                        <div class="right">
                            <form:input path="Address" id="address" type="text" cssClass="form-control"></form:input>
                            <br>
                        </div>

                        <div class="left">
                            <label>City</label>
                        </div>
                        <div class="right">
                            <form:input path="City" id="city" type="text" cssClass="form-control"></form:input>
                            <br>
                        </div>

                    <div class="left">
                        <label>Country</label>
                    </div>
                    <div class="right">
                        <form:input path="Country" id="country" type="text" cssClass="form-control"></form:input>
                        <br>
                    </div>


                    <div class="left">
                        <label>Occupation</label>
                    </div>
                    <div class="right">
                        <form:input path="Occupation" id="occupation" type="text" cssClass="form-control"></form:input>
                        <br>
                    </div>


                    <div class="left">
                        <label>Annual Income</label>
                    </div>
                    <div class="right">
                        <input type="text" class="form-control" id="income" aria-describedby="basic-addon1" onChange="checkSalary(income.val)">
                        <br>
                    </div>

                    <div class="left">
                        <label>Mobile</label>
                    </div>
                    <div class="right">
                        <input type="text" class="form-control" id="mobile" aria-describedby="basic-addon1" onChange="validateNumber(mobile.value)">
                        <br>
                    </div>

                    <div class="center">
                        <button type="submit" class="btn btn-default">Submit</button>
                        </div>

                </div>

                </form:form>
            </div>
        </div>

    </div>
</div>
<footer class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 ">
                <p>Copyright © MyWebsite. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../resources/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/js/bootstrap.js"></script>
<script>
    $("#myForm").validate();
</script>
</body>
</html>
