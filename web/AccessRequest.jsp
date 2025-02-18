<%@page import="SACS.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Sanitizable Access Control System</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-574-mexant.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
    
    <link rel="stylesheet" href="assets/css/table.css">
  </head>
  
  
      <%
        if (request.getParameter("Approved") != null) {%>
    <script>alert('Access Approved');</script>  
    <%}
    %>
      <%
        if (request.getParameter("Rejected") != null) {%>
    <script>alert('Access Rejected');</script>  
    <%}
    %>

<body>


  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <nav class="main-nav">
                      <!-- ***** Logo Start ***** -->
                      <a href="#" class="logo">
                      </a>
                      <!-- ***** Logo End ***** -->
                      <!-- ***** Menu Start ***** -->
                      <ul class="nav">
                          <li class="scroll-to-section"><a href="AuthorityHome.jsp">Home</a></li>
                          <li class="scroll-to-section"><a href="DataPublisherAct.jsp" >Data Publishers</a></li>  
                          <li class="scroll-to-section"><a href="ReceiverAct.jsp">Receivers</a> </li>        
                         <li class="scroll-to-section"><a href="ActivePublishers.jsp" >Active Publishers</a> </li>
                          <li class="scroll-to-section"><a href="ActiveReceivers.jsp">Active Receivers</a> </li>
                          <li class="scroll-to-section"><a href="AccessRequest.jsp" class="active">Access Request</a> </li>
                          <li class="scroll-to-section"><a href="logout.jsp">Logout</a></li>
                        
<!--                          <li><a href="contact-us.html">Contact Support</a></li> -->
                      </ul>        
                      <a class='menu-trigger'>
                          <span>Menu</span>
                      </a>
                      <!-- ***** Menu End ***** -->
                  </nav>
              </div>
          </div>
      </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <!-- ***** Main Banner Area Start ***** -->
  <div class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="header-text">
            <h2>Access Request List</h2>
            <div class="div-dec"></div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ***** Main Banner Area End ***** -->

  <section class="contact-us-form">
    <div class="container">
       <table id="naresh" style="margin: auto;padding: 10px;">
                                <tr>
                                    <th>Id</th>
                                    <th>DR id</th>
                                    <th>DR Name</th>
                                    <th>DP Id</th>
                                    <th>DP Name</th>
                                    <th>Status</th>
                                    <th>Date & Time</th>
                                    <th>Action</th>
                                </tr>
                                <%

                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    try {
                                        ResultSet rs = st.executeQuery("Select * from searchreq where vstatus ='Waiting'");
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td><%=rs.getString("id")%></td>
                                    <td><%=rs.getString("drid")%></td>
                                    <td><%=rs.getString("drname")%></td>
                                    <td><%=rs.getString("dpid")%></td>
                                    <td><%=rs.getString("dpname")%></td>
                                    <td><%=rs.getString("vstatus")%></td>
                                    <td><%=rs.getString("time")%></td>
                                    <td><a href="RequestApprove?id=<%=rs.getString("id")%>&fid=<%=rs.getString("fid")%>"  class="btn btn-success" style="color: white">&nbsp;Approve</a>&nbsp;&nbsp;
                                        <a href="RequestReject?id=<%=rs.getString("id")%>&fid=<%=rs.getString("fid")%>"   class="btn btn-danger" style="color: white">&nbsp;Reject</a></td>
                                </tr>
                                <%                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </table> 
                            <br><br><br><br><br><br><br><br><br><br>
      </div>
    </div>
  </section>
  <br><br><br>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Sanitizable Access Control System.</p>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>

    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/swiper.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        var interleaveOffset = 0.5;

      var swiperOptions = {
        loop: true,
        speed: 1000,
        grabCursor: true,
        watchSlidesProgress: true,
        mousewheelControl: true,
        keyboardControl: true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev"
        },
        on: {
          progress: function() {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
              var slideProgress = swiper.slides[i].progress;
              var innerOffset = swiper.width * interleaveOffset;
              var innerTranslate = slideProgress * innerOffset;
              swiper.slides[i].querySelector(".slide-inner").style.transform =
                "translate3d(" + innerTranslate + "px, 0, 0)";
            }      
          },
          touchStart: function() {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
              swiper.slides[i].style.transition = "";
            }
          },
          setTransition: function(speed) {
            var swiper = this;
            for (var i = 0; i < swiper.slides.length; i++) {
              swiper.slides[i].style.transition = speed + "ms";
              swiper.slides[i].querySelector(".slide-inner").style.transition =
                speed + "ms";
            }
          }
        }
      };

      var swiper = new Swiper(".swiper-container", swiperOptions);
    </script>
  </body>
</html>

