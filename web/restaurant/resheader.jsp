<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>

<%  
    Connection con1 = ConnectionProvider.getcon();
    PreparedStatement data1 = con1.prepareStatement("select * from restaurant where username=?");
    String name1 = (String)session.getAttribute("restaurantname");
    data1.setString(1,name1);
    ResultSet rs1 = data1.executeQuery();
    while(rs1.next())
    {
        String rimg1 = "../resimages/resimageslogo/" + rs1.getString("image");
    
%>
<html lang="en">

<head>
      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">

      <title> <%= session.getAttribute("restaurantname") %> | Foodie </title>
      <meta content="" name="description">
      <meta content="" name="keywords">



      <!-- Google Fonts -->
      <link href="https://fonts.gstatic.com" rel="preconnect">
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

      <!-- Vendor CSS Files -->
      <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="./assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
      <link href="./assets/vendor/quill/quill.snow.css" rel="stylesheet">
      <link href="./assets/vendor/quill/quill.bubble.css" rel="stylesheet">
      <link href="./assets/vendor/remixicon/remixicon.css" rel="stylesheet">
      <link href="./assets/vendor/simple-datatables/style.css" rel="stylesheet">
      <link href="./assets/css/style.css" rel="stylesheet">

</head>.
    <body>
        
          <!-- ======= Header ======= -->
            <header id="header" class="header fixed-top d-flex align-items-center">

              <div class="d-flex align-items-center justify-content-between">
                <a href="./dashboard.jsp" class="logo d-flex align-items-center">
                  <span class="d-none d-lg-block"><%= session.getAttribute("restaurantname") %> | Foodie</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
              </div>


              <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">

                  <li class="nav-item d-block d-lg-none">
                    <a class="nav-link nav-icon search-bar-toggle " href="#">
                      <i class="bi bi-search"></i>
                    </a>

                  <li class="nav-item dropdown pe-3">

                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                        <img src="<%= rimg1  %>" alt="Profile" class="rounded-circle"> <% } %>
                      <span class="d-none d-md-block dropdown-toggle ps-2"><%= session.getAttribute("restaurantname") %></span>
                    </a><!-- End Profile Iamge Icon -->

                  </li><!-- End Profile Nav -->

                </ul>
              </nav><!-- End Icons Navigation -->

            </header><!-- End Header -->
            
            <!-- ======= Sidebar ======= -->
            <aside id="sidebar" class="sidebar">

              <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                  <a class="nav-link " href="./dashboard.jsp">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                  </a>
                </li><!-- End Dashboard Nav -->


                <li class="nav-item">
                  <a class="nav-link collapsed" href="./resprofile.jsp">
                    <i class="bi bi-person"></i>
                    <span>Restaurant Details</span>
                  </a>
                </li><!-- End Profile Page Nav -->

                <li class="nav-item">
                  <a class="nav-link collapsed" href="./addcategory.jsp">
                        <i class="bi bi-upload"></i> 
                    <span>Add Category</span>
                  </a>
                </li><!-- End F.A.Q Page Nav -->

                <li class="nav-item">
                  <a class="nav-link collapsed" href="./additem.jsp">
                    <i class="bi bi-upload"></i>
                    <span>Add Product Details</span>
                  </a>
                </li><!-- End Contact Page Nav -->

                <li class="nav-item">
                  <a class="nav-link collapsed" href="./viewcategory.jsp">
                    <i class="bi bi-eye"></i>
                    <span>View Category & Products</span>
                  </a>
                </li><!-- End Register Page Nav -->
                
                <li class="nav-item">
                  <a class="nav-link collapsed" href="./viewfeedback.jsp">
                    <i class="bi bi-eye"></i>
                    <span>View Feedbacks</span>
                  </a>
                </li>
                
                <li class="nav-item">
                  <a class="nav-link collapsed" href="./vieworder.jsp">
                    <i class="bi bi-eye"></i>
                    <span>View Orders</span>
                  </a>
                </li>
                

                <li class="nav-item">
                  <a class="nav-link collapsed" href="../index.jsp">
                    <i class="bi bi-box-arrow-in-right"></i>
                    <span>Logout</span>
                  </a>
                </li><!-- End Login Page Nav -->


              </ul>

            </aside><!-- End Sidebar-->
            <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

          <script src="./assets/vendor/apexcharts/apexcharts.min.js"></script>
          <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
          <script src="./assets/vendor/chart.js/chart.umd.js"></script>
          <script src="./assets/vendor/echarts/echarts.min.js"></script>
          <script src="./assets/vendor/quill/quill.min.js"></script>
          <script src="./assets/vendor/simple-datatables/simple-datatables.js"></script>
          <script src="./assets/vendor/tinymce/tinymce.min.js"></script>
          <script src="./assets/vendor/php-email-form/validate.js"></script>
          <script src="./assets/js/main.js"></script>

    </body>

</html>
