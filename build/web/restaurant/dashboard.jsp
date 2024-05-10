<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String rusername = (String)session.getAttribute("restaurantname");
    
    // total customer
    Statement stmtctot = con.createStatement();
    String quectot = "select DISTINCT count(customer_id) as total_customer from order2 where restaurant_id = (select restaurant_id from restaurant where username='"+rusername+"')";
    ResultSet rsctot = stmtctot.executeQuery(quectot);
    
    // total sales
    Statement stmtcsaltot = con.createStatement();
    String quecsaltot = "select sum(quantity) as total_sale, sum(total) as total_revenue from order2 where restaurant_id = (select restaurant_id from restaurant where username='"+rusername+"')";
    ResultSet rscsaltot = stmtcsaltot.executeQuery(quecsaltot);
  
    // total revenue
    Statement stmttr = con.createStatement();
    String quetr = "select sum(total) as total_revenue from order2 where restaurant_id = (select restaurant_id from restaurant where username='"+rusername+"')";
    ResultSet rstr = stmttr.executeQuery(quetr);
    
    // recent sales
    Statement stmtrc = con.createStatement();
    String querc = "select o.order_id, o.pname as product_name, ch.name as customer_name, o.price as price, "
            + "o.quantity as qty, o.total as total, o.status1 as status from order2 o "
            + "inner join checkout ch on o.checkout_id = ch.checkout_id "
            + "inner join order_total ot on o.order_id = ot.order_id "
            + "where date(ot.date) = curdate() and o.restaurant_id = (select restaurant_id from restaurant where username='" + rusername + "') and status1='pending' limit 10";
    ResultSet rsrc = stmtrc.executeQuery(querc);
    


%>
<body>
       
        <%@include file="./resheader.jsp" %>   
        
        <main id="main" class="main">

            <div class="pagetitle">
              <h1>Dashboard</h1>
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
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
                            <% if(rscsaltot.next()) { %>
                            <div class="d-flex align-items-center">
                              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-cart"></i>
                              </div>
                              <div class="ps-3">
                                <h6><%= rscsaltot.getString("total_sale") %></h6>
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
                            <% if(rstr.next()) { %>
                            <div class="d-flex align-items-center">
                              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-currency-dollar"></i>
                              </div>
                              <div class="ps-3">
                                  <h6>₹<%= rstr.getString("total_revenue") %></h6>
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
                            <h5 class="card-title">Total Customers</h5>
                            <% if(rsctot.next()) { %>
                            <div class="d-flex align-items-center">
                              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-people"></i>
                              </div>
                              <div class="ps-3">
                                  <h6><%= rsctot.getString("total_customer") %></h6>
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
                            <h5 class="card-title">Recent Sales <span>| Today</span></h5>

                            <table class="table table-borderless datatable">
                              <thead>
                                <tr>
                                  <th scope="col">OrderId</th>
                                  <th scope="col">Customer</th>
                                  <th scope="col">Product</th>
                                  <th scope="col">Price</th>
                                  <th scope="col">QTY</th>
                                  <th scope="col">Total</th>
                                  <th scope="col">Status</th>
                                </tr>
                              </thead>
                              <tbody>
                                <% while(rsrc.next()) { String status = rsrc.getString("status"); %>
                                <tr>
                                    <th scope="row"><a href="#"><%= rsrc.getString("order_id") %></a></th>
                                    <td><%= rsrc.getString("customer_name") %></td>
                                  <td><a href="#" class="text-primary"><%= rsrc.getString("product_name") %></a></td>
                                  <td>₹<%= rsrc.getString("price") %></td>
                                  <td><%= rsrc.getString("qty") %></td>
                                  <td>₹<%=rsrc.getString("total")%></td>
                                  <% if("Pending".equals(status)) { %>
                                  <td><span class="badge bg-warning">Pending</span></td>
                                  <% } else { %>
                                  <td><span class="badge bg-success">Approved</span></td>
                                  <% } %>
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
        
        <%@include file="resfooter.jsp" %>

       

</body>

