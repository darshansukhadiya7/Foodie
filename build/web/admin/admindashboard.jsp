<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String ausername = (String)session.getAttribute("adminname");
    
    // total restaurant
    Statement stmtrtot = con.createStatement();
    String quertot = "select count(restaurant_id) as total_restaurant from restaurant where active = 'yes'";
    ResultSet rsrtot = stmtrtot.executeQuery(quertot);
    
    // total sales
    String querstot = "select sum(quantity) as total_sale, sum(total) as total_revenue from order2";
    PreparedStatement stmtsrtot = con.prepareStatement(querstot);
    ResultSet rssrtot = stmtsrtot.executeQuery();
    
    // total revenues
    String queretot = "select sum(order_total_price) as total_revenue from order_total";
    PreparedStatement stmtretot = con.prepareStatement(queretot);
    ResultSet rsretot = stmtretot.executeQuery();

    // maximum sales restaurant revenue
    String quemsr = "SELECT o.restaurant_id, SUM(o.quantity) AS total_sales, SUM(o.total) AS total_revenue, "
                    + "r.name AS restaurant_name, r.city AS city "
                    + "FROM order2 o "
                    + "INNER JOIN restaurant r ON o.restaurant_id = r.restaurant_id "
                    + "GROUP BY o.restaurant_id ORDER BY SUM(o.total) DESC LIMIT 5";
    PreparedStatement stmtmsr = con.prepareStatement(quemsr);
    ResultSet rsmsr = stmtmsr.executeQuery();
    
    // maximum sales restaurant product
//    String quemsp = "select m.menu_id, sum(o.quantity) as total_sales, sum(o.total) as total_revenue, "
//            + "m.name as product_name, r.name as restaurant_name, r.city as city, m.image as img "
//            + "from order2 o "
//            + "inner join menu m on o.menu_id = m.menu_id "
//            + "inner join restaurant r on o.restaurant_id = r.restaurant_id "
//            + "group by m.menu_id order by sum(o.total) desc limit 5";
//    PreparedStatement stmtmsp = con.prepareStatement(quemsp);
//    ResultSet rsmsp = stmtmsp.executeQuery();
    int count = 0;
%>
<head>
    <style>
        .item{
            text-align: center;
        }
    </style>
</head>
    <body>
        <%@include file="./adminheader.jsp" %>
        
        <main id="main" class="main">

            <div class="pagetitle">
              <h1>Dashboard</h1>
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="./admindashboard.jsp">Home</a></li>
                  <li class="breadcrumb-item active">Dashboard</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->
            
            <section class="section dashboard">
                <div class="row">

                  <!-- Left side columns -->
                  <div class="col-lg-12">
                    <div class="row">

                      <!-- Sales Card -->
                      <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">


                          <div class="card-body">
                            <h5 class="card-title">Total Sold Products</h5>
                            <% if(rssrtot.next()) { %>
                            <div class="d-flex align-items-center">
                              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-cart"></i>
                              </div>
                              <div class="ps-3">
                                  <h6><%= rssrtot.getString("total_sale") %></h6>
                              </div>
                            </div>
                            <% } %>
                          </div>

                        </div>
                      </div><!-- End Sales Card -->

                      <!-- Revenue Card -->
                      <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card">
                          <div class="card-body">
                            <h5 class="card-title">Total Revenue</h5>
                            <% if(rsretot.next()) { %>
                            <div class="d-flex align-items-center">
                              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-currency-dollar"></i>
                              </div>
                              <div class="ps-3">
                                <h6>₹<%= rsretot.getString("total_revenue") %></h6>
                              </div>
                            </div>
                            <% } %>
                          </div>

                        </div>
                      </div><!-- End Revenue Card -->

                      <!-- Customers Card -->
                      <div class="col-xxl-4 col-xl-12">
                        <div class="card info-card customers-card">
                          <div class="card-body">
                            <h5 class="card-title">Total Restaurant</h5>
                            <% if(rsrtot.next()) {  %>
                            <div class="d-flex align-items-center">
                              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-people"></i>
                              </div>
                              <div class="ps-3">
                                  <h6><%= rsrtot.getString("total_restaurant") %></h6>
                              </div>
                            </div>
                            <% } %>

                          </div>
                        </div>

                      </div><!-- End Customers Card -->


                      <!-- Recent Sales -->
                      <div class="col-12">
                        <div class="card recent-sales overflow-auto">
                          <div class="card-body">
                            <h5 class="card-title">Top Restaurant</h5>

                            <table class="table table-borderless datatable">
                              <thead>
                                <tr>
                                    <th scope="col" class="item"></th>
                                  <th scope="col" class="item">Restaurant Name</th>
                                  <th scope="col" class="item">City</th>
                                  <th scope="col" class="item">Sold</th>
                                  <th scope="col" class="item">Revenue</th>
                                </tr>
                              </thead>
                              <tbody>
                                <% while(rsmsr.next()) { %>
                                <tr>
                                  <th scope="row" class="item"><%= ++count %></th>
                                  <td class="item" style="color: blue;"><%= rsmsr.getString("restaurant_name") %></td>
                                  <td class="item"><%= rsmsr.getString("city") %></td>
                                  <td class="item"><%= rsmsr.getString("total_sales") %></td>
                                  <td class="item">₹<%= rsmsr.getString("total_revenue") %></td>
                                </tr>
                                <% } %>
                              </tbody>
                            </table>

                          </div>

                        </div>
                      </div><!-- End Recent Sales -->

                   
                    </div>
                  </div><!-- End Left side columns -->
                </div>
            </section>
        </main>
        <%@include file="./adminfooter.jsp" %>
    </body>

