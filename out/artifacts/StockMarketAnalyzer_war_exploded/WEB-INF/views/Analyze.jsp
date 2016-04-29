<%@ page import="org.rutgers.models.UsersWithShares" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.*" %>
<%@ page import="org.joda.time.DateTime" %>
<%@ page import="org.rutgers.models.LongTerm" %>
<%@ page import="org.rutgers.models.CompanyStock" %>


<%--
  Created by IntelliJ IDEA.
  User: Rama,Shabista,Rashmi,Christin,Deepak
  Date: 4/23/2016
  Time: 6:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>INDICATOR</title>

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
                <%--<li><a href="/analyze">Analyze</a></li>--%>
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


    <script src= "../resources/js/analyze.js">
    </script>

    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-12">
                <div class="row">
                    <div class="col-lg1-4 col-md-4 col-sm-6 col-xs-6">

                        <script>
                            function predictVal(num){
                                alert(num);
                                <%

                                List<LongTerm> resLongTerm1 = (List<LongTerm>)request.getAttribute("resLongTerm");
                                int p=0;
                                //System.out.println("date inside analyze:");
                                for(p=0;p<resLongTerm1.size() && p<30;p++)
                                {
                                    String date1 = resLongTerm1.get(p).getDate().toString();
                                    System.out.println("date inside analyze:"+date1 );
                                %>

                                    var val;
                                    if(num=="2016-04-30"){
                                        alert("num: "+num);
                                        alert("date1: "+${date1});
                                        alert("date1"+<%=date1%>);
                                        alert("date1"+<%=date1%>);
                                            alert("matched");
                                        disp.show();
                                    }
                                <%
                                }
                                %>
                            }

                        </script>

                        <h3>TYPE OF ANALYSIS</h3>

                        <div class="right">
                            <input type="radio" name="analyze" value="stanalysis">  Short-Term Analysis:
                            <%--<input type="text" name="value" placeholder="Number of Days for Analysis" style="display:inline"><br><br>--%>
                            <br><br>
                            <input type="radio" name="analyze" value="ltanalysis">  Long-Term Analysis<br><br>
                            <%--<input type="text" name="date" id="num" placeholder="yyyy-mm-dd" style="display:inline" ><br><br>--%>
                            <input type="radio" name="analyze" value="historydata">  Historical Data<br><br>
                            <br><br>

                            <div class="container" id="values" hidden="true">
                                <div class="row">
                                    <div class="col-lg-9 col-md-12">
                                        <div class="row">
                                            <div class="col-lg1-4 col-md-4 col-sm-6 col-xs-6">
                                                <div class="thumbnail">



                                                    <input type="text" name="company" list="companyname">
                                                    <datalist id="companyname">
                                                        <option value="Boston"/>
                                                        <option value="Cambridge"/>
                                                    </datalist>

                                                    <input type="text" name="number" list="number">
                                                    <datalist id="number">
                                                        <option value="1"/>
                                                        <option value="2"/>
                                                    </datalist>


                                                    <button type="button" style="display:inline" class="btn btn-success" id="showanalysis">Add</button>

                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>


                </div>

            </div>

        </div>
    </div>


</section>

<br><br>
<div class="clearfix">
    <div class="col-md-12 column">

        <div class="col-sm-6">
            <div class="stock" hidden="true" id="chart">
                <a class="twitter-timeline">#Historical Data Analysis</a>
                <script type="text/javascript" src="https://d33t3vvu2t2yu5.cloudfront.net/tv.js"></script>
                <script type="text/javascript">
                    new TradingView.widget({
                        "width": 300,
                        "height": 510,
                        "symbol": "GOOG",
                        "interval": "D",
                        "timezone": "Etc/UTC",
                        "theme": "White",
                        "style": "1",
                        "locale": "en",
                        "toolbar_bg": "#f1f3f6",
                        "allow_symbol_change": true,
                        "hideideas": true,
                        "show_popup_button": true,
                        "popup_width": "1000",
                        "popup_height": "650",
                        "no_referral_id": true
                    });
                </script>


            </div>

        </div>

        <div id="tabnew_logic" hidden="true">
            <h3>SHORT TERM ANALYSIS</h3>
        <table class="table table-bordered table-hover disptable" id="" >
            <thead>
            <tr >
                <th class="text-center">
                    S.No
                </th>
                <th class="text-center">
                    Date
                </th>
                <th class="text-center">
                    Value
                </th>
            </tr>
            </thead>
            <tbody>
            <%
                double[] list = (double[])request.getAttribute("res");
                int k=0;
                int i;
                DateTime start = new DateTime();
                //System.out.println("date: "+start);
                String s= start.getYear()+"-"+start.getMonthOfYear()+"-"+start.getDayOfMonth();
                for(i=0;i<list.length;i++)
                {
                    s= start.getYear()+"-"+start.getMonthOfYear()+"-"+start.getDayOfMonth();
                    System.out.println(s);
                    k++;
            %>

            <tr>
                <td>
                    <%=k%>
                </td>
                <td>
                    <%=s%>
                </td>
                <td>
                    <%=list[i]%>
                </td>


            </tr>
            <%
                    start = start.plusDays(1);
                }%>
            <!-- <tr id="addr1"></tr>    -->
            </tbody>
        </table>
        </div>
        <br><br>


    </div>
</div>
<br><br>

<div class="clearfix">
    <div class="col-md-12 column">

        <div class="col-sm-6">
            <div class="stock" hidden="true" id="graph">
                <a class="twitter-timeline">#Historical Data Analysis</a>
                <script type="text/javascript" src="https://d33t3vvu2t2yu5.cloudfront.net/tv.js"></script>
                <script type="text/javascript">
                    new TradingView.widget({
                        "width": 300,
                        "height": 510,
                        "symbol": "GOOG",
                        "interval": "D",
                        "timezone": "Etc/UTC",
                        "theme": "White",
                        "style": "1",
                        "locale": "en",
                        "toolbar_bg": "#f1f3f6",
                        "allow_symbol_change": true,
                        "hideideas": true,
                        "show_popup_button": true,
                        "popup_width": "1000",
                        "popup_height": "650",
                        "no_referral_id": true
                    });
                </script>

            </div>

        </div>


        <div id="tabnew1_logic" hidden="true">
            <h3>LONG TERM ANALYSIS</h3>
        <table class="table table-bordered table-hover disptable" >

            <thead>
            <tr >
                <th class="text-center">
                    S.No
                </th>
                <th class="text-center">
                    Date
                </th>
                <th class="text-center">
                    Value
                </th>
            </tr>
            </thead>
            <tbody>
            <%

                //list = (double[])request.getAttribute("res");
                List<LongTerm> resLongTerm = (List<LongTerm>)request.getAttribute("resLongTerm");
                k=0;
                start = new DateTime();
                //System.out.println("date: "+start);
                s= start.getYear()+"-"+start.getMonthOfYear()+"-"+start.getDayOfMonth();
                System.out.println("res long term size:" +resLongTerm.size());
                for(i=0;i<30;i++)
                {
                    s= start.getYear()+"-"+start.getMonthOfYear()+"-"+start.getDayOfMonth();
                    //System.out.println("date: "+s);
                    k++;
            %>

            <tr>
                <td>
                    <%=k%>
                </td>
                <td>
                    <%=s%>
                </td>
                <td>
                    <%=resLongTerm.get(i).getValue()%>
                </td>


            </tr>
            <%
                    start = start.plusDays(1);
                }
            %>
            <!-- <tr id="addr1"></tr>    -->
            </tbody>
        </table>
            <label id="disp">The Predicted value on 2017-04-29 is:<%=resLongTerm.get(260).getValue()%></label>
        </div>
        <br><br>

        <div id="tabnew2_logic" hidden="true">
            <h3>HISTORICAL DATA</h3>
            <table class="table table-bordered table-hover disptable" >

                <thead>
                <tr >
                    <th class="text-center">
                        S.No
                    </th>
                    <th class="text-center">
                        Date
                    </th>
                    <th class="text-center">
                        Value
                    </th>
                </tr>
                </thead>
                <tbody>
                <%

                    //list = (double[])request.getAttribute("res");
                    List<CompanyStock> resHistoricalData = (List<CompanyStock>)request.getAttribute("resHistoricalData");
                    System.out.println("resHistoricalData size: "+resHistoricalData.size());
                    k=0;
                   // start = new DateTime();
                    //System.out.println("date: "+start);
                    //s= start.getYear()+"-"+start.getMonthOfYear()+"-"+start.getDayOfMonth();
                    //System.out.println("res long term size:" +resLongTerm.size());
                    for(i=0;i<resHistoricalData.size() && i<30;i++)
                    {
                      //  s= start.getYear()+"-"+start.getMonthOfYear()+"-"+start.getDayOfMonth();
                        //System.out.println("date: "+s);
                        k++;
                %>

                <tr>
                    <td>
                        <%=k%>
                    </td>
                    <td>
                        <%=resHistoricalData.get(i).getDateClose()%>
                    </td>
                    <td>
                        <%=resHistoricalData.get(i).getClose()%>
                    </td>


                </tr>
                <%
                        //start = start.plusDays(1);
                    }
                %>
                <!-- <tr id="addr1"></tr>    -->
                </tbody>
            </table>

        </div>
        <br><br>

        <br><br>


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
