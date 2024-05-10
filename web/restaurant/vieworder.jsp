<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 

    Connection con = ConnectionProvider.getcon();
    String rusername = (String)session.getAttribute("restaurantname");
    String query_fetch_ordertotal = "select o.pname as product_name, o.order_id, ot.date as date, ch.name as customer_name, o.pname as product_name, o.price as price, o.quantity as qty, o.total as total, o.checkout_id as checkout_id, o.status1 as status "
            + "from order2 o "
            + "inner join order_total ot on o.order_id = ot.order_id "
            + "inner join customer c on o.customer_id = c.customer_id "
            + "inner join checkout ch on o.checkout_id = ch.checkout_id "
            + "where o.restaurant_id = (select restaurant_id from restaurant where username=?)";
    PreparedStatement stmtqfot = con.prepareStatement(query_fetch_ordertotal);
    stmtqfot.setString(1, rusername);
    ResultSet rsqfot = stmtqfot.executeQuery();

%>
    <head>
           <style>
            .image-cell 
            {
                vertical-align: middle;
                text-align: center;
            }
          </style>
    </head>
    <body>
        
        <%@include file="resheader.jsp" %>
        
          <main id="main" class="main">

            <div class="pagetitle">
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
                  <li class="breadcrumb-item active">View Feedbacks</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->

            <section class="section">
              <div class="row">
                <div class="col-lg-12">

                  <div class="card">
                    <div class="card-body">
                      <table class="table datatable">
                        <thead>
                          <tr>
                                <th class="image-cell">Order Id</th>
                                <th class="image-cell">Date</th>
                                <th class="image-cell">customer</th>
                                <th class="image-cell">Product</th>
                                <th class="image-cell">Price</th>
                                <th class="image-cell">QTY</th>
                                <th class="image-cell">Total</th>
                                <th class="image-cell">Status</th>
                                <th class="image-cell"></th>
                          </tr>
                        </thead>
                        <tbody>
                            <% while(rsqfot.next()) { String status = rsqfot.getString("status"); %>
                            <tr>
                                <td class="image-cell">#<%= rsqfot.getString("order_id") %></td>
                                <td class="image-cell"><%= rsqfot.getString("date") %></td>
                                <td class="image-cell"><%= rsqfot.getString("customer_name") %> </td>
                                <td class="image-cell"><%= rsqfot.getString("product_name") %> </td>
                                <td class="image-cell">₹<%= rsqfot.getString("price") %> </td>
                                <td class="image-cell"><%= rsqfot.getString("qty") %> </td>
                                <td class="image-cell">₹<%= rsqfot.getString("total") %> </td>
                                <% if("Pending".equals(status)) { %>
                                <td class="image-cell"><span class="badge bg-warning">Pending</span></td>
                                  <% } else { %>
                                  <td class="image-cell"><span class="badge bg-success">Approved</span></td>
                                <% } %>
                                <td class="image-cell"><a href="vieworderdetails.jsp?id=<%= rsqfot.getString("checkout_id") %>&pname=<%= rsqfot.getString("product_name") %>&id2=<%= rsqfot.getString("order_id") %>">View Details</a></td>
                            </tr>
                            <% } %>
                      </table>
                      

                    </div>
                  </div>

                </div>
              </div>
            </section>

          </main><!-- End #main -->
        <%@include file="resfooter.jsp" %>


    </body>


