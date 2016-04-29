

<%--
  Created by IntelliJ IDEA.
  User: Rama
  Date: 4/16/2016
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
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
            <a class="navbar-brand" href="home.jsp">STOCK MARKET ANALYZER</a> </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="myInverseNavbar2">
                <ul class="nav navbar-nav navbar-right">
                    <form:form method="post" action="/login" modelAttribute="user">
                       <div style="float:left">
                           <%
                               //boolean error = request.getAttribute("errors");
                               System.out.println(request.getAttribute("errors"));
                               if(request.getAttribute("errors").equals("true")){
                                   System.out.println("entered");
                           %>
                           <%--<div style="color:#ffffff" align="left">Incorrect login information. Please try again</div>--%>
                           <label class="aligntext">Invalid login.Please try again</label>
                           <%
                               }
                           %>
                           <%--<label class="aligntext">Invalid login.Please try again</label>--%>
                           <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Register/Login</button>

                       </div>

                        <div id="myModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                                        <div class="wellNew">
                                            <h3 class="text-center">LOGIN</h3>
                                            <form class="form-horizontal">

                                                <div class="form-group">
                                                    <label for="username" class="control-label">Username</label>

                                                    <div class="input-group">
                                                        <form:input path="Username" id="username" cssClass="form-control" type="text" minlength="5" required="true"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="password" class="control-label">Password</label>
                                                    <div class="input-group">
                                                        <form:input path="Password" id="password" type="password" cssClass="form-control" minlength="4" required="true"></form:input>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <a data-toggle="modal" data-target="#modal">Forgot Password</a>

                                                    <!-- Modal -->

                                                </div>

                                                <div class="form-group">
                                                    <a href="/register">New User</a>
                                                </div>

                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-default">Submit</button>
                                                </div>
                                            </form>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </ul>
        </div>
        </form:form>

        <form:form method="post" action="/emailSend">
            <div id="modal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <%
                        System.out.println("entered email address modal");
                    %>
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Enter email-address</h4>
                        </div>
                        <div class="modal-body">
                            <p><input type="text" class="form-control" name="email" id="email" aria-describedby="basic-addon1"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </div>
                    </div>

                </div>
            </div>
        </form:form>

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
                    <div class="item"> <img class="img-responsive" src="../resources/images/img10.jpg" alt="thumb">
                        <div class="carousel-caption"> STOCK MARKET PREDICTOR </div>
                    </div>
                    <div class="item active"> <img class="img-responsive" src="../resources/images/img8.jpg" alt="thumb">
                        <div class="carousel-caption"> STOCK MARKET ANALYZER </div>
                    </div>
                    <div class="item"> <img class="img-responsive" src="../resources/images/img9.jpg" alt="thumb">
                        <div class="carousel-caption"> STOCKING OPTIONS </div>
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

    <!--  <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
            <div class="media-object-default">
              <div class="media">


           <div class="media-left"> <a href="#"> <img class="media-object img-circle" src="images/100X100.gif" alt="placeholder image"> </a> </div>
                <div class="media-body">
                  <h4 class="media-heading">Heading 1</h4>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, sequi, repudiandae tenetur et veniam labore debitis repellendus totam non incidunt hic esse!</div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
            <div class="media">
              <div class="media-left"> <a href="#"> <img class="media-object img-circle" src="images/100X100.gif" alt="placeholder image"></a></div>
              <div class="media-body">
                <h4 class="media-heading">Heading 2</h4>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, odit, consequuntur, quae, at tempore nostrum perferendis corporis nam maxime tenetur iure facilis.</div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-6 hidden-sm hidden-xs">
            <div class="media">
              <div class="media-left"> <a href="#"> <img class="media-object img-circle" src="images/100X100.gif" alt="placeholder image"></a></div>
              <div class="media-body">
                <h4 class="media-heading">Heading 3</h4>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, id, aut, officiis laboriosam a vero illo dolor asperiores provident quibusdam praesentium ipsum!</div>
            </div>
          </div>
        </div>
      </div> -->
</section>
<hr>
<div class="container">
    <div class="row">
        <div class="col-lg-9 col-md-12">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <div class="">
                        <div class="">
                            <p>

                                <!-- start feedwind code --><script type="text/javascript">document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script><script type="text/javascript">(function() {var params = {rssmikle_url: "http://feeds.reuters.com/news/economy",rssmikle_frame_width: "320",rssmikle_frame_height: "500",frame_height_by_article: "0",rssmikle_target: "_blank",rssmikle_font: "Arial, Helvetica, sans-serif",rssmikle_font_size: "12",rssmikle_border: "off",responsive: "off",rssmikle_css_url: "https://dl.dropboxusercontent.com/u/172851763/css/fw004.css",text_align: "left",text_align2: "left",corner: "off",scrollbar: "on",autoscroll: "on",scrolldirection: "up",scrollstep: "3",mcspeed: "20",sort: "Off",rssmikle_title: "on",rssmikle_title_sentence: "Trending News:Economy",rssmikle_title_link: "http://feeds.reuters.com/news/economy",rssmikle_title_bgcolor: "#0066FF",rssmikle_title_color: "#FFFFFF",rssmikle_title_bgimage: "",rssmikle_item_bgcolor: "#FFFFFF",rssmikle_item_bgimage: "",rssmikle_item_title_length: "55",rssmikle_item_title_color: "#0066FF",rssmikle_item_border_bottom: "on",rssmikle_item_description: "on",item_link: "off",rssmikle_item_description_length: "150",rssmikle_item_description_color: "#666666",rssmikle_item_date: "gl1",rssmikle_timezone: "Etc/GMT",datetime_format: "%b %e, %Y %l:%M %p",item_description_style: "text+tn",item_thumbnail: "full",item_thumbnail_selection: "auto",article_num: "15",rssmikle_item_podcast: "off",keyword_inc: "",keyword_exc: ""};feedwind_show_widget_iframe(params);})();</script><div style="font-size:10px; text-align:center; width:320px;"><a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;">RSS Feed Widget</a><!--Please display the above link in your web page according to Terms of Service.--></div><!-- end feedwind code --><!--  end  feedwind code -->

                            </p>

                        </div>
                    </div>
                </div>


                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <div class="">
                        <div class="">
                            <p>

                                <!-- start feedwind code --><script type="text/javascript">document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script><script type="text/javascript">(function() {var params = {rssmikle_url: "http://feeds.reuters.com/news/wealth",rssmikle_frame_width: "320",rssmikle_frame_height: "500",frame_height_by_article: "0",rssmikle_target: "_blank",rssmikle_font: "Arial, Helvetica, sans-serif",rssmikle_font_size: "12",rssmikle_border: "off",responsive: "off",rssmikle_css_url: "https://dl.dropboxusercontent.com/u/172851763/css/fw004.css",text_align: "left",text_align2: "left",corner: "off",scrollbar: "on",autoscroll: "on",scrolldirection: "up",scrollstep: "3",mcspeed: "20",sort: "Off",rssmikle_title: "on",rssmikle_title_sentence: "Trending News:Money",rssmikle_title_link: "http://feeds.reuters.com/news/wealth",rssmikle_title_bgcolor: "#0066FF",rssmikle_title_color: "#FFFFFF",rssmikle_title_bgimage: "",rssmikle_item_bgcolor: "#FFFFFF",rssmikle_item_bgimage: "",rssmikle_item_title_length: "55",rssmikle_item_title_color: "#0066FF",rssmikle_item_border_bottom: "on",rssmikle_item_description: "on",item_link: "off",rssmikle_item_description_length: "150",rssmikle_item_description_color: "#666666",rssmikle_item_date: "gl1",rssmikle_timezone: "Etc/GMT",datetime_format: "%b %e, %Y %l:%M %p",item_description_style: "text+tn",item_thumbnail: "full",item_thumbnail_selection: "auto",article_num: "15",rssmikle_item_podcast: "off",keyword_inc: "",keyword_exc: ""};feedwind_show_widget_iframe(params);})();</script><div style="font-size:10px; text-align:center; width:320px;"><a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;">RSS Feed Widget</a><!--Please display the above link in your web page according to Terms of Service.--></div><!-- end feedwind code --><!--  end  feedwind code -->

                            </p>

                        </div>
                    </div>
                </div>





                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">

                    <!-- </div>
                     <div class="col-lg-4 col-md-4 col-sm-6 hidden-sm hidden-xs"> -->
                    <div class=""> <!--<img src="images/400X200.gif" alt="Thumbnail Image 1" class="img-responsive">-->
                        <div class="caption">
                            <!--<h3>Heading</h3>-->
                            <!--   <p> -->

                            <!-- start feedwind code --><!--<script type="text/javascript">document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script><script type="text/javascript">(function() {var params = {rssmikle_url: "http://finance.yahoo.com/rss/headline?s=yhoo",rssmikle_frame_width: "320",rssmikle_frame_height: "500",frame_height_by_article: "0",rssmikle_target: "_blank",rssmikle_font: "Arial, Helvetica, sans-serif",rssmikle_font_size: "12",rssmikle_border: "off",responsive: "off",rssmikle_css_url: "https://dl.dropboxusercontent.com/u/172851763/css/fw004.css",text_align: "left",text_align2: "left",corner: "off",scrollbar: "on",autoscroll: "on",scrolldirection: "up",scrollstep: "3",mcspeed: "20",sort: "Off",rssmikle_title: "on",rssmikle_title_sentence: "YAHOO NEWS",rssmikle_title_link: "http://finance.yahoo.com/rss/headline?s=yhoo",rssmikle_title_bgcolor: "#0066FF",rssmikle_title_color: "#FFFFFF",rssmikle_title_bgimage: "",rssmikle_item_bgcolor: "#FFFFFF",rssmikle_item_bgimage: "",rssmikle_item_title_length: "55",rssmikle_item_title_color: "#0066FF",rssmikle_item_border_bottom: "on",rssmikle_item_description: "on",item_link: "off",rssmikle_item_description_length: "150",rssmikle_item_description_color: "#666666",rssmikle_item_date: "gl1",rssmikle_timezone: "Etc/GMT",datetime_format: "%b %e, %Y %l:%M %p",item_description_style: "text+tn",item_thumbnail: "full",item_thumbnail_selection: "auto",article_num: "15",rssmikle_item_podcast: "off",keyword_inc: "",keyword_exc: ""};feedwind_show_widget_iframe(params);})();</script><div style="font-size:10px; text-align:center; width:320px;"><a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;">RSS Feed Widget</a> --><!--Please display the above link in your web page according to Terms of Service.--><!--</div> --><!-- end feedwind code --><!--  end  feedwind code -->

                            <!--    </p> -->

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <div class="">
                        <!--   <div class="caption">
                             <h3>Heading</h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                             <hr>
                             <p class="text-center"><a href="#" class="btn btn-info" role="button">For Rent</a></p>
                           </div>
                         </div>
                       </div>
                       <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                         <div class="thumbnail"> <img src="images/400X200.gif" alt="Thumbnail Image 1" class="img-responsive">
                           <div class="caption">
                             <h3>Heading</h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                             <hr>
                             <p class="text-center"><a href="#" class="btn btn-primary btn-success" role="button">For Sale</a></p>
                           </div>
                         </div>
                       </div>
                       <div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
                         <div class="thumbnail"> <img src="images/400X200.gif" alt="Thumbnail Image 1" class="img-responsive">
                           <div class="caption">
                             <h3>Heading</h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                             <hr>
                             <p class="text-center"><a href="#" class="btn btn-info" role="button">For Rent</a></p>
                           </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-lg-offset-0">

            <iframe src="http://livestream.com/accounts/13/events/3304002/player?width=550&height=315&autoPlay=true&mute=false" width="550" height="315" frameborder="0" scrolling="no"> </iframe>

            <!--<h3 class="text-center">Agents</h3>
            <div class="media-object-default">
              <div class="media">
                <div class="media-left"> <a href="#">  </a> </div>
                <div class="media-body">
                  <h4 class="media-heading">John Doe</h4>
                  <abbr title="Phone">P:</abbr> (123) 456-7890 <a href="mailto:#">first.last@example.com</a> </div>
              </div>
              <div class="media">
                <div class="media-left"> <a href="#"> <img class="media-object img-rounded" src="images/64X64.gif" alt="placeholder image"> </a> </div>
                <div class="media-body">
                  <h4 class="media-heading">Linda Smith</h4>
                  <abbr title="Phone">P:</abbr> (123) 456-7890 <a href="mailto:#">first.last@example.com</a> </div>
              </div>
            </div> -->
        </div>
    </div>
</div>
<hr>
<section>



    <!-- START Worden Top Gainers and Losers Ticker Widget -->


    <!--<iframe src="http://livestream.com/accounts/13/events/3304002/player?width=1060&height=315&autoPlay=true&mute=false" width="1060" height="315" frameborder="0" scrolling="no"> </iframe> -->

    <!-- <div class="container">
       <div class="row">
         <div class="col-lg-6">
           <h3>New Properties</h3>
           <hr>
           <div class="row">
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"> </div>
             </div>
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
             </div>
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
             </div>
           </div>
           <hr>
           <div class="row">
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
             </div>
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
   </div>
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
   </div>
           </div>
           <hr>
           <div class="row">
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
   </div>
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
   </div>
             <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
               <div class="text-center"> <img src="images/72X72.gif" alt="Thumbnail Image 1"></div>
   </div>
           </div>
         </div>
         <div class="col-lg-6">
           <h3>Our Services</h3>
           <hr>
           <ul id="myTab1" class="nav nav-tabs">
             <li class="active"> <a href="#home1" data-toggle="tab"> Tab Panel 1 </a> </li>
             <li><a href="#pane2" data-toggle="tab">Tab Panel 2</a></li>
             <li> <a href="#pane3" data-toggle="tab">Tab Panel 3</a> </li>
           </ul>
           <div id="myTabContent1" class="tab-content">
             <div class="tab-pane fade in active" id="home1">
               <p class="text-center"><img src="images/3b536b.gif" alt=""></p>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus maxime aut ea impedit voluptates aperiam dolor laborum officiis autem aspernatur! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus, alias, repudiandae sunt illo consequatur aperiam doloribus nesciunt ut deserunt ipsa est tempora nihil. Totam eveniet aperiam debitis fugit ipsa doloremque. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio sequi dolorem suscipit assumenda molestiae voluptatem qui consequuntur magni? Deleniti, corporis.</p>
             </div>
             <div class="tab-pane fade" id="pane2">
               <p class="text-center"><img src="images/9b59b6.gif" alt=""></p>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus maxime aut ea impedit voluptates aperiam dolor laborum officiis autem aspernatur! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus, alias, repudiandae sunt illo consequatur aperiam doloribus nesciunt ut deserunt ipsa est tempora nihil. Totam eveniet aperiam debitis fugit ipsa doloremque. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio sequi dolorem suscipit assumenda molestiae voluptatem qui consequuntur magni? Deleniti, corporis.</p>
             </div>
             <div class="tab-pane fade" id="pane3">
               <p class="text-center"><img src="images/16a085.gif" alt=""></p>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus maxime aut ea impedit voluptates aperiam dolor laborum officiis autem aspernatur! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus, alias, repudiandae sunt illo consequatur aperiam doloribus nesciunt ut deserunt ipsa est tempora nihil. Totam eveniet aperiam debitis fugit ipsa doloremque. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio sequi dolorem suscipit assumenda molestiae voluptatem qui consequuntur magni? Deleniti, corporis.</p>
             </div>
           </div>
         </div>
       </div>
     </div> -->
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
