<%@ page import="org.rutgers.models.UsersWithShares" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Rama,Shabista,Rashmi,Christin,Deepak
  Date: 4/23/2016
  Time: 6:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>DASHBOARD</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="../resources/css/bootstrap.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via  -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                    <div class="item"> <img class="img-responsive" src="../resources/images/img3.jpg" alt="thumb">
                        <div class="carousel-caption"> </div>
                    </div>
                    <div class="item active"> <img class="img-responsive" src="../resources/images/img4.jpg" alt="thumb">
                        <div class="carousel-caption"> </div>
                    </div>
                    <div class="item"> <img class="img-responsive" src="../resources/images/img6.jpg" alt="thumb">
                        <div class="carousel-caption"> </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-299058" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel-299058" data-slide="next"><span class="icon-next"></span></a></div>
        </div>
    </div>
    <hr>
</div>
<section>

    <script src="http://widgets.macroaxis.com/widgets/url.jsp?t=42"></script>

    <script src="http://widgets.freestockcharts.com/js/jquery-1.3.1.min.js" type="text/javascript"></script> <script src="http://widgets.freestockcharts.com/script/WBIHorizontalTicker2.js?ver=12334" type="text/javascript"></script> <link href="http://widgets.freestockcharts.com/WidgetServer/WBITickerblue.css" rel="stylesheet" type="text/css" />
    <script>
        var gainerTick = new WBIHorizontalTicker('gainers');
        gainerTick.start();
        var loserTick = new WBIHorizontalTicker('losers');
        loserTick.start();
    </script> <!-- End Scrolling Ticker Widget -->


</section>
<hr>

<section>
    <script src= "../resources/js/addstocks.js">
    </script>
    <!--<div w3-include-html="/Users/Shabista/Desktop/Portfolio.html"></div>  -->

    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-12">
                <div class="row">
                    <form:form method="post" action="/addStock">
                    <div class="col-lg1-4 col-md-4 col-sm-6 col-xs-6">
                        <div class="thumbnail">

                            <h3>Add Stock</h3>

                            <input type="text" name="company" list="companyname">
                            <datalist id="companyname">
                                <option value="APPLE" selected>APPLE</option>
                                <option value="BAC">BANK OF AMERICA</option>
                                <option value="CISCO">CISCO</option>
                                <option value="CVC">CABLE VISION</option>
                                <option value="FB">FACEBOOK</option>
                                <option value="GOOGLE">GOOGLE</option>
                                <option value="IBM">IBM</option>
                                <option value="MICROSOFT">MICROSOFT</option>
                                <option value="WFC">WFC</option>
                                <option value="YAHOO">YAHOO</option>
                            </datalist>

                            <input type="text" name="number" placeholder="Number of stocks"/>
                            <input type="text" name="price" placeholder="price per stock"/>
                            <button type="submit" class="btn btn-default">Add</button>
                            <button type="submit" formaction="/watchList" class="btn btn-default">Watchlist</button>

                        </div>
                    </div>
                    </form:form>

                </div>
                </div>

            <div class="col-md-12 column">

                <h3>STOCKS PURCHASED</h3>
                <table class="table table-bordered table-hover" id="tabnew_logic">
                    <thead>
                    <tr >
                        <th class="text-center">
                            S.No
                        </th>
                        <th class="text-center">
                            Company
                        </th>
                        <th class="text-center">
                            Quantity of Stocks
                        </th>
                        <th class="text-center">
                            Price per stock
                        </th>
                        <th class="text-center">
                            Date bought
                        </th>
                        <th class="text-center">
                            Delete
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<UsersWithShares> list = (ArrayList<UsersWithShares>) request.getAttribute("shares");

                        int i;int p=0;
                        for(i=0;i<list.size();i++)
                        {
                            UsersWithShares userShare = list.get(i);
                            if(userShare.getStatus().equals("active"))
                            {
                                p++;
                    %>

                    <tr>
                        <td>
                            <%=p%>
                        </td>
                        <td>
                            <%=userShare.getCompany()%>
                        </td>
                        <td>
                            <%=userShare.getNumberOfShares()%>
                        </td>
                        <td>
                            <%=userShare.getPricePerShare()%>
                        </td>
                        <td>
                            <%=userShare.getDateBought()%>
                        </td>
                        <td>
                            <button type="button" name="delete" class="btn btn-success" value=<%=i%> onclick="location.href='/delete/<%=i%>'">Delete</button>

                        </td>
                    </tr>
                    <%}}%>
                    <!-- <tr id="addr1"></tr>    -->
                    </tbody>
                </table>
                <br><br>

                <h3>STOCKS ADDED TO WATCHLIST</h3>
                <table class="table table-bordered table-hover" id="tabnew2_logic">
                    <thead>
                    <tr >
                        <th class="text-center">
                            S.No
                        </th>
                        <th class="text-center">
                            Company
                        </th>
                        <th class="text-center">
                            Quantity of Stocks
                        </th>
                        <th class="text-center">
                            Price per stock
                        </th>
                        <th class="text-center">
                            Date bought
                        </th>
                        <th class="text-center">
                            Delete
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        //list = (ArrayList<UsersWithShares>) request.getAttribute("shares");
                        int k=0;
                        for(i=0;i<list.size();i++)
                        {
                            UsersWithShares userShare = list.get(i);
                            if(userShare.getStatus().equals("watchlist"))
                            {
                                k++;
                    %>

                    <tr>
                        <td>
                            <%=k%>
                        </td>
                        <td>
                            <%=userShare.getCompany()%>
                        </td>
                        <td>
                            <%=userShare.getNumberOfShares()%>
                        </td>
                        <td>
                            <%=userShare.getPricePerShare()%>
                        </td>
                        <td>
                            <%=userShare.getDateBought()%>
                        </td>
                        <td>
                            <button type="button" name="delete" class="btn btn-success" value="${i}" onclick="location.href='/delete'" >Delete</button>
                        </td>
                    </tr>
                    <%}}%>
                    <!-- <tr id="addr1"></tr>    -->
                    </tbody>
                </table>
                <br><br>

            </div>
            </div>

        </div>
    </div>

</section>

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
