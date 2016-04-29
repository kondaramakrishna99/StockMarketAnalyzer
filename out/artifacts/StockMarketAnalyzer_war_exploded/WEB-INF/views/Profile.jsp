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
            <a class="navbar-brand" href="568_new.html">STOCK MARKET ANALYZER</a> </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="myInverseNavbar2">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/profile">Profile</a></li>
                <li><a href="/dashboard">Dashboard</a></li>
                <li><a href="/analyze">Analyze</a></li>
                <li><a href="/indicators">Indicators</a></li>
                <li><a href="/">Sign Out</a></li>

            </ul>
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
                        <div class="carousel-caption"> </div>
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
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">


                    <h3>User Profile</h3>


                    <div class="left">
                        <label>Username : </label>
                    </div>
                    <div class="right">
                        <label>${user.username}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>Name : </label>
                    </div>
                    <div class="right">
                        <label>${user.name}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>Email : </label>
                    </div>
                    <div class="right">
                        <label>${user.email}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>Gender : </label>
                    </div>
                    <div class="right">
                        <label>${user.gender}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>DOB : </label>
                    </div>
                    <div class="right">
                        <label>${user.dateOfBirth}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>Country : </label>
                    </div>
                    <div class="right">
                        <label>${user.country}</label>
                        <br><br>
                    </div>


                    <div class="left">
                        <label>Address: </label>
                    </div>
                    <div class="right">
                        <label>${user.address}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>City : </label>
                    </div>
                    <div class="right">
                        <label>${user.city}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>Occupation: </label>
                    </div>
                    <div class="right">
                        <label>${user.occupation}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>Income : </label>
                    </div>
                    <div class="right">
                        <label>${user.annualIncome}</label>
                        <br><br>
                    </div>

                    <div class="left">
                        <label>Mobile : </label>
                    </div>
                    <div class="right">
                        <label>${user.mobile}</label>
                        <br><br>
                    </div>

                    <div class="center">
                        <button type="button" class="btn btn-success" onclick="location.href='/updateProfile'" >Update Profile</button>
                    </div>




                </div>


            </div>
        </div>

    </div>
</div>

<div class="container ">
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-lg-4 col-md-4 backcolor"> <span class="text-right">
      </span>
            <h3>Latest News</h3>
            <hr>
            <p><iframe width="350" height="300" src="https://www.youtube.com/v/62ROK4o48Jg">
            </iframe></p>

        </div>
        <div class="col-xs-6 col-sm-6 col-lg-4 col-md-4 hidden-sm hidden-xs backcolor"> <span class="text-right"> </span>
            <h3>About Us</h3>
            <hr>
            <div class="media-object-default">
                <div class="media">
                    <div class="media-body">
                        <p>For a financial portal born in early 2016, we couldn't have chosen a more difficult time to launch. But it was really passion and belief that saw us through. A single-minded passion to become the country's greatest resource for financial information on the Internet.

                        </p>
                        <p>We have been there to chronicle the growth of the economy. And along with it we plan to grown as well ; starting off as a financial portal that began by offering end-of-day stock prices to today arguably becoming the biggest store of news (text and videos), analysis, data and tools on investing (across diverse asset classes), personal finance, the business sector and the economy.This we believe is merely the start of our journey.</p>
                    </div>

                </div>
                <div class="media">

                    <div class="media-right"> <a href="#"> </a></div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-lg-4 col-md-4 backcolor"> <span class="text-right"> </span>
            <h3>Latest News</h3>
            <hr>

            <p><iframe width="350" height="300" src="https://www.youtube.com/v/r7Xy0lclLlU">
            </iframe></p>
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
</body>
</html>
