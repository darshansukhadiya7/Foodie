<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String ausername = (String)session.getAttribute("adminname");
    
    String quevr = "select r.restaurant_id as rid, r.name as rname, r.image as image, r.active, r.city as city "
            + "from restaurant r "
            + "group by r.restaurant_id";
    PreparedStatement stmtvr = con.prepareStatement(quevr);
    ResultSet rsvr = stmtvr.executeQuery();
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
                  <li class="breadcrumb-item active">View Restaurants</li>
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
                                <th scope="col" class="item">Restaurant Name</th>
                                <th scope="col" class="item">City</th>
<!--                                <th scope="col" class="item">Total Category</th>-->
                                <th scope="col" class="item">Status</th>
                                <th scope="col" class="item"></th>
                                <th scope="col" class="item"></th>
                              </tr>
                            </thead>
                            <tbody>
                              <% while(rsvr.next()) { %>
                              <tr>
                                <th scope="row" class="item"><%= ++count %></th>
                                <td class="item"><img src="../resimages/resimageslogo/<%= rsvr.getString("image") %>" alt="" style="height: 50px; width: 50px;"></td>
                                <td class="item" style="color: #2b5c93; font-weight: bolder;"><%= rsvr.getString("rname") %></td>
                                <td class="item"><%= rsvr.getString("city") %></td>
                                <td class="item"><%= rsvr.getString("active") %></td>
                                <td class="item"><a href="./editresdetails.jsp?id=<%= rsvr.getString("rid") %>">Edit</a></td>
                                <td class="item"><a href="viewcategory.jsp?id=<%= rsvr.getString("rid") %>">View Categories</a></td> 
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