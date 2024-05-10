<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String ausername = (String)session.getAttribute("adminname");
    int rid = Integer.parseInt(request.getParameter("id"));
    int cid = Integer.parseInt(request.getParameter("id1"));
    String quevp = "select * from menu where restaurant_id = ? and category_id = ?";
    PreparedStatement stmtvp = con.prepareStatement(quevp);
    stmtvp.setInt(1, rid);
    stmtvp.setInt(2, cid);
    ResultSet rsvp = stmtvp.executeQuery();
    int count = 0;
%>
<head>
    <style>
        .item{
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>  
    <body>
        <%@include file="./adminheader.jsp" %>
        
        <main id="main" class="main">

            <div class="pagetitle">
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="./admindashboard.jsp">Home</a></li>
                  <li class="breadcrumb-item active">View Categories</li>
                </ol>
              </nav>
            </div>
            <section class="section">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                          <table class="table table-hover">
                            <thead>
                              
                              <tr>
                                <th class="item"></th>
                                <th scope="col" class="item"></th>
                                <th scope="col" class="item">Product Name</th>
                                <th scope="col" class="item">Price</th>
                                <th scope="col" class="item">Status</th>
                              </tr>
                            </thead>
                            <tbody>
                              <% while(rsvp.next()) { %>
                              <tr>
                                <th scope="row" class="item"><%= ++count %></th>
                                <td class="item"><img src="../resimages/productimg/<%= rsvp.getString("image") %>" alt="" style="height: 50px; width: 50px;"></td>
                                <td class="item" style="color: #2b5c93; font-weight: bolder;"><%= rsvp.getString("name") %></td>
                                <td class="item"><%= rsvp.getString("price") %></td>
                                <td class="item"><%= rsvp.getString("active") %></td>
                              </tr>
                              <% } %>
                            </tbody>
                          </table>
                          <!-- End Table with hoverable rows -->

                        </div>
                    </div>
                  </div>
                </div>
            </section>
        </main>
        
        <%@include file="./adminfooter.jsp" %>
    </body>