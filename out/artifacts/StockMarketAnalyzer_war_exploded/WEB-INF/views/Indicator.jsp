<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
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
                        <div class="carousel-caption"></div>
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
    <script src= "../resources/addstocks.js">
    </script>
    <!--<div w3-include-html="/Users/Shabista/Desktop/Portfolio.html"></div>  -->

    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-12">
                <div class="row">
                    <div class="col-lg1-4 col-md-4 col-sm-6 col-xs-6">
                        <div class="">

                            <h3>Indicators</h3>
                            <form:form action="/indicators" method="post">
                            <input type="text" name="company" list="companyname" placeholder="Name of Company">
                            <datalist id="companyname">
                                <option value="BANK OF AMERICA" selected>BANK OF AMERICA</option>
                                <option value="CISCO">CISCO</option>
                                <option value="CABLEVISION">CABLEVISION</option>
                                <option value="FACEBOOK">FACEBOOK</option>
                                <option value="GOOGLE">GOOGLE</option>
                                <option value="IBM">IBM</option>
                                <option value="MICROSOFT">MICROSOFT</option>
                                <option value="WFC">WFC</option>
                                <option value="YAHOO">YAHOO</option>
                            </datalist>

                            <input type="text" name="indicator" list="indicatorname" placeholder="Type of Indictaor">
                            <datalist id="indicatorname">
                                <option value="Simple Moving Average"/>
                                <option value="Exponential Moving Average"/>
                            </datalist>

                                <input type="text" id="timeperiod" name="values" list="numdays" placeholder="Time Period(in days)">
                                <datalist id="numdays">
                                    <option value="5" selected>5</option>
                                    <option value="10">10</option>
                                    <option value="12">12</option>
                                    <option value="20">20</option>
                                    <option value="26">26</option>
                                    <option value="50">50</option>
                                </datalist>

                            <button type="submit" class="btn btn-success">Done</button>
                                <br><br><br><br>
                            </form:form>
                            <%
                                String display = (String)request.getAttribute("display");
                                String indicator = (String)request.getAttribute("indicator");
                                String company = (String)request.getAttribute("company");
                                String td=(String)request.getAttribute("td");
                                if(display.equals("true") && indicator.equals("Simple Moving Average"))
                                {
                            %>
                            <div id="graph">
                                <h3><%=company%> <%=td%>- <%=indicator%></h3>
                                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                                <div id="chart_div"></div>
                                <script type="text/javascript">
                                    google.charts.load('current', {packages: ['corechart', 'line']});
                                    google.charts.setOnLoadCallback(drawAxisTickColors);

                                    function drawAxisTickColors() {
                                        var data = new google.visualization.DataTable();
                                        data.addColumn('number', 'X');
                                        data.addColumn('number', 'SMA');
                                        <%--<%System.out.println("hisadsa");%>--%>
                                        var data1 = new Array(600);
                                        var i = 0;
                                        // alert('Deep');
                                        <%
                                            double[] res = (double[])request.getAttribute("res");
                                           // System.out.println(res[0]+""+res[1]+""+res[2]);
                                           for(int j=0;j<res.length;j++)
                                           {
                                           %>
                                        data1[<%=j%>] = <%=res[j]%>;
                                        // alert(data1[i]);
                                        i=i+1;
                                        <%
                                            System.out.print(j+":"+res[j] +" ");
                                           }
                                        %>
                                        //data1 = <%=res%>;

                                        //alert('Rama');
                                        <%System.out.println("hisadsa");%>
                                        var cc = 0;
                                        var td= <%=Integer.parseInt((String)request.getAttribute("td"))%>;
                                        //var td= td1[td1.selectedIndex].value;
                                       // alert("td: "+td);
                                        i=0;
                                        var j=0;
                                        var avg=0;
                                        for (cc = 1; cc < td; cc++)
                                        {
                                            avg=0;
                                            for (i=j; i < td*cc; i++)
                                            {
                                                avg=avg+data1[i];
                                                j++;
                                            }
                                            avg=avg/td;
                                            data.addRows([[cc, avg]]);
                                        }

                                        //data.addRows([[1, 2]]);

                                        var options = {
                                            hAxis: {
                                                title: 'Month',
                                                textStyle: {
                                                    color: '#01579b',
                                                    fontSize: 50,
                                                    fontName: 'Arial',
                                                    bold: true,
                                                    italic: true
                                                },
                                                titleTextStyle: {
                                                    color: '#01579b',
                                                    fontSize: 16,
                                                    fontName: 'Arial',
                                                    bold: false,
                                                    italic: true
                                                }
                                            },
                                            vAxis: {
                                                title: 'Stock Value',
                                                textStyle: {
                                                    color: '#1a237e',
                                                    fontSize: 24,
                                                    bold: true
                                                },
                                                titleTextStyle: {
                                                    color: '#1a237e',
                                                    fontSize: 24,
                                                    bold: true
                                                }
                                            },
                                            colors: ['#a52714', '#097138']
                                        };
                                        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                                        chart.draw(data, options);
                                    }
                                </script>
                            </div>

                            <%
                                }
                            %>
                            <%
                                if(display.equals("true") && indicator.equals("Exponential Moving Average"))
                                {
                            %>
                            <div id="graph">
                                <h3><%=company%> <%=td%>- <%=indicator%></h3>
                                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                                <div id="chart_div1"></div>
                                <script type="text/javascript">
                                    google.charts.load('current', {packages: ['corechart', 'line']});
                                    google.charts.setOnLoadCallback(drawAxisTickColors1);

                                    function drawAxisTickColors1() {
                                        var data = new google.visualization.DataTable();
                                        data.addColumn('number', 'X');
                                        data.addColumn('number', 'Exponential Moving Average');
                                        var mon_label = "";
                                        var data1 = new Array(600);

                                        var i = 0;

                                        <%
                                            double[] res = (double[])request.getAttribute("res");
                                           // System.out.println(res[0]+""+res[1]+""+res[2]);
                                           for(int j=0;j<res.length;j++)
                                           {
                                           %>
                                        data1[<%=j%>] = <%=res[j]%>;
                                        // alert(data1[i]);
                                        i=i+1;
                                        <%
                                            System.out.print(j+":"+res[j] +" ");
                                           }
                                        %>
                                        //data1 = <%=res%>;

                                        //alert('Rama');
                                        <%System.out.println("hisadsa");%>
                                        var td= <%=Integer.parseInt((String)request.getAttribute("td"))%>;
                                        var cc = 0;
                                        i=0;
                                        var j=0;
                                        var avg=0;
                                        var prev = 0 ;
                                        for (cc = 1; cc < td; cc++)
                                        {
                                            avg=0;
                                            for (i=j; i < td*cc; i++)
                                            {
                                                avg=avg+data1[i];
                                                j++;
                                            }
                                            avg=avg/td;
                                            var mul = 2/(10+1);
                                            if(prev==0)
                                                prev=avg;
                                            var ema=(data1[j-1]-prev)*mul + prev;

                                            prev = ema;
                                            data.addRows([[cc, ema]]);
                                        }

                                        var options = {
                                            hAxis: {
                                                title: 'Period',
                                                textStyle: {
                                                    color: '#01579b',
                                                    fontSize: 50,
                                                    fontName: 'Arial',
                                                    bold: true,
                                                    italic: true
                                                },
                                                titleTextStyle: {
                                                    color: '#01579b',
                                                    fontSize: 16,
                                                    fontName: 'Arial',
                                                    bold: false,
                                                    italic: true
                                                }
                                            },
                                            vAxis: {
                                                title: 'Stock Value',
                                                textStyle: {
                                                    color: '#1a237e',
                                                    fontSize: 24,
                                                    bold: true
                                                },
                                                titleTextStyle: {
                                                    color: '#1a237e',
                                                    fontSize: 24,
                                                    bold: true
                                                }
                                            },
                                            colors: ['#a52714', '#097138']
                                        };
                                        var chart = new google.visualization.LineChart(document.getElementById('chart_div1'));
                                        chart.draw(data, options);
                                    }
                                </script>
                            </div>

                            <%
                                }
                            %>



                        </div>
                    </div>


                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">

                    </div>


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

<script src="../resources/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/js/bootstrap.js"></script>

</body>
</html>