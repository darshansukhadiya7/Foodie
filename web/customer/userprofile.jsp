<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>

<%
    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    String upd = "select * from customer where username=?";
    PreparedStatement stmtupd = con.prepareStatement(upd);
    stmtupd.setString(1, username);
    ResultSet rsupd = stmtupd.executeQuery();
      

%>
<html lang="en">

    <head>
      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">

      <title>Foodie</title>
      <meta content="" name="description">
      <meta content="" name="keywords">



      <!-- Google Fonts -->
      <link href="https://fonts.gstatic.com" rel="preconnect">
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

      <!-- Vendor CSS Files -->
      <link href="../restaurant/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="../restaurant/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="../restaurant/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
      <link href="../restaurant/assets/vendor/quill/quill.snow.css" rel="stylesheet">
      <link href="../restaurant/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
      <link href="../restaurant/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
      <link href="../restaurant/assets/vendor/simple-datatables/style.css" rel="stylesheet">
      <link href="../restaurant/assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        
        <%@include file="header.jsp" %>
        
        <main id="main" class="main">
            <div class="pagetitle col-lg-9">
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                  <li class="breadcrumb-item active">Profile</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="col-xl-9">

                  <div class="card">
                    <div class="card-body pt-3">
                      <!-- Bordered Tabs -->
                      <div class="tab-content pt-2">
                        <div class="tab-pane fade show active profile-overview" id="profile-overview">
                            <h5 class="card-title">Profile Details</h5>
                            
                            <% while(rsupd.next()) {  %>
                              <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Username</div>
                                <div class="col-lg-9 col-md-8"><%= rsupd.getString("username") %></div>
                              </div>

                              <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Full Name</div>
                                <div class="col-lg-9 col-md-8"><%= rsupd.getString("firstname") + " " + rsupd.getString("lastname")  %></div>
                              </div>

                              <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Email</div>
                                <div class="col-lg-9 col-md-8"><%= rsupd.getString("email") %></div>
                              </div>

                              <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Phone</div>
                                <div class="col-lg-9 col-md-8"><%= rsupd.getString("phno") %></div>
                              </div>
                            <% } %>
                        </div>
                      </div><!-- End Bordered Tabs -->
                    </div>
                  </div>

                </div>
            </section>
          </main><!-- End #main -->
        
        <%@include file="footer.jsp" %>
        

          <script src="restaurant/assets/vendor/apexcharts/apexcharts.min.js"></script>
          <script src="../restaurant/assets/vendor/apexcharts/apexcharts.min.js"></script>
          <script src="../restaurant/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
          <script src="../restaurant/assets/vendor/chart.js/chart.umd.js"></script>
          <script src="../restaurant/assets/vendor/echarts/echarts.min.js"></script>
          <script src="../restaurant/assets/vendor/quill/quill.min.js"></script>
          <script src="../restaurant/assets/vendor/simple-datatables/simple-datatables.js"></script>
          <script src="../restaurant/assets/vendor/tinymce/tinymce.min.js"></script>
          <script src="../restaurant/assets/vendor/php-email-form/validate.js"></script>
          <script src="../restaurant/assets/js/main.js"></script>

    </body>

</html>

