<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    
    String rusername = (String)session.getAttribute("restaurantname");
    Statement stmtfb = con.createStatement();
    String que = "select c.name,re.category_id,count(re.rating) as total_rating, avg(re.rating) as avg_rating from review re "
            + "inner join category c on re.category_id = c.category_id "
            + "inner join restaurant r on re.restaurant_id = r.restaurant_id "
            + "where"
            + " re.restaurant_id=(select restaurant_id from restaurant where username='" + rusername + "') group by c.name";
    ResultSet rscat = stmtfb.executeQuery(que);
    int count = 0;
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
                                <th></th>
                                <th class="image-cell">Category</th>
                                <th class="image-cell">Total Rating</th>
                                <th class="image-cell">Average Rating</th>
                                <th class="image-cell"></th>
                          </tr>
                        </thead>
                        <tbody>
                            <% while(rscat.next()) { count++; %>
                            <tr>
                                <td class="image-cell"><%= count %></td>
                                <td class="image-cell"><%= rscat.getString("name") %></td>
                                <td class="image-cell"><%= rscat.getInt("total_rating") %> </td>
                                <td class="image-cell"><%= rscat.getInt("avg_rating") %> </td>
                                <td class="image-cell"><a href="viewfeedbackdetails.jsp?id=<%= rscat.getInt("category_id") %>">View FeedBacks</a> </td>
                            </tr>
                            <% } %>
                      </table>
                      <!-- End Table with stripped rows -->

                    </div>
                  </div>

                </div>
              </div>
            </section>

          </main><!-- End #main -->
        <%@include file="resfooter.jsp" %>


    </body>

