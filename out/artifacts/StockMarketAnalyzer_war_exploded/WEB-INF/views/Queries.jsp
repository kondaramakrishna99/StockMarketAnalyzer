<%@ page import="java.util.List" %>
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
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">


                    <h3>Queries: </h3><br>


                    <label>  List of All Companies in the Database</label><br>

                    <div>
                        <h5>First answer : Company names</h5>
                        <ul>


                            <%
                                List<String> first = (List<String>)request.getAttribute("first");
                                System.out.println(first.toString());
                                for(int i=0;i<first.size();i++)
                                {
                            %>
                            <li><%=first.get(i)%></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <br><br>

                    <label>  Highest Stock Price of Google in the last ten days</label><br>

                    <div>
                        <h5>Second answer : Highest Stock price of google</h5>
                        <%
                            //String
                            double second = (Double)request.getAttribute("second") ;
                            System.out.println(second);
                        %>
                        <h4><%=second%></h4>


                    </div>
                    <br><br>

                    <label>  Average stock price of Microsoft in the latest one year</label><br>

                    <div>
                        <h5>Third answer : Average Stock price of Microsoft</h5>
                        <%
                            double third = (Double)request.getAttribute("third") ;
//                        double third = (double)request.getAttribute("third");
                            System.out.println(third);
                        %>
                        <h4><%=third%></h4>

                    </div>
                    <br><br>


                    <label>  Lowest stock price for each company in the latest one year</label><br>

                    <div>
                        <h5>Fourth answer : lowest stock price for each company</h5>
                        <ul>
                            <%
                                String[] companyName={"BANK OF AMERICA","CISCO","CABLEVISION","FACEBOOK","GOOGLE","IBM","MICROSOFT","WFC","YAHOO"};
                                List<Double> fourth = (List<Double>)request.getAttribute("fourth");
                                System.out.println(fourth.toString());
                                for(int i=0;i<fourth.size();i++)
                                {
                            %>
                            <li><%=companyName[i]%>: <%=fourth.get(i)%></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <br><br>

                    <label>  ids of companies having average stock price lesser than the lowest of Google in the latest one year</label><br>

                    <div>
                        <h5>Fifth answer : Company IDs whose average is lesser than Minimum of google</h5>
                        <ul>
                            <%
                                //String[] companyName={"BANK OF AMERICA","CISCO","CABLEVISION","FACEBOOK","GOOGLE","IBM","MICROSOFT","WFC","YAHOO"};
                                List<String> fifth = (List<String>)request.getAttribute("fifth");
                                System.out.println(fifth.toString());
                                for(int i=0;i<fifth.size();i++)
                                {
                                    String[] temp =fifth.get(i).split(".csv");
                            %>
                            <li><%=temp[0]%></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <br><br>


                </div>

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
//    $("#myForm").validate();
</script>
</body>
</html>
