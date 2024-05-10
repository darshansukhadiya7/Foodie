<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    int id = Integer.parseInt(request.getParameter("id"));
    String rusername = (String)session.getAttribute("restaurantname");
    Statement stmtfb = con.createStatement();
    String que = "SELECT c.username, m.name, r.rating, r.message " +
                         "FROM review r " +
                         "INNER JOIN customer c ON r.customer_id = c.customer_id " +
                         "INNER JOIN menu m ON r.menu_id = m.menu_id " +
                         "WHERE m.category_id ="+id;
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
                                <th class="image-cell">Username</th>
                                <th class="image-cell">Product Name</th>
                                <th class="image-cell">Rating</th>
                                <th class="image-cell">Message</th>
                          </tr>
                        </thead>
                        <tbody>
                            <% while(rscat.next()) { count++; %>
                            <tr>
                                <td class="image-cell"><%= count %></td>
                                <td class="image-cell"><%= rscat.getString("username") %></td>
                                <td class="image-cell"><%= rscat.getString("name") %> </td>
                                <td class="image-cell"><%= rscat.getInt("rating") %> </td>
                                <td class="image-cell"><%= rscat.getString("message") %> </td>
                                
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

