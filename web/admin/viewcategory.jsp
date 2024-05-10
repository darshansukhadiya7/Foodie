<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String ausername = (String)session.getAttribute("adminname");
    int rid = Integer.parseInt(request.getParameter("id"));
    String quevc = "select c.category_id as cid, c.image as image, c.name as category_name, c.active as status "
            + "from category c "
            + "where c.restaurant_id = ? group by c.category_id";
    PreparedStatement stmtvc = con.prepareStatement(quevc);
    stmtvc.setInt(1, rid);
    ResultSet rsvc = stmtvc.executeQuery();
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
                                <th scope="col" class="item">Category Name</th>
                                <th scope="col" class="item">Status</th>
                                <th scope="col" class="item"></th>
                              </tr>
                            </thead>
                            <tbody>
                              <% while(rsvc.next()) { %>
                              <tr>
                                <th scope="row" class="item"><%= ++count %></th>
                                <td class="item"><img src="../resimages/categoryimg/<%= rsvc.getString("image") %>" alt="" style="height: 50px; width: 50px;"></td>
                                <td class="item" style="color: #2b5c93; font-weight: bolder;"><%= rsvc.getString("category_name") %></td>
                                <td class="item"><%= rsvc.getString("status") %></td>
                                <td class="item"><a href="viewproduct.jsp?&id=<%= rid %>&id1=<%= rsvc.getString("cid") %>">View Products</a></td> 
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