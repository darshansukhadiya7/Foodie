<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    int cat_id = 0;
    Connection con = ConnectionProvider.getcon();
    cat_id = Integer.parseInt(request.getParameter("id"));
    String rusername = (String)session.getAttribute("restaurantname");
    Statement stmtcat = con.createStatement();
    ResultSet rscat = stmtcat.executeQuery("select * from menu where category_id = " + cat_id + " and restaurant_id=(select restaurant_id from restaurant where username='" + rusername + "')");
    int count = 0;
    String msg = request.getParameter("msg");
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
                  <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                  <li class="breadcrumb-item active">View Category</li>
                </ol>
              </nav>
            </div>
                <%
                    if(msg != null)
                    { %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <%= msg %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% }
                %>
            <section class="section">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body"> 
                          <table class="table table-hover">  
                            <thead>
                              <tr>
                                <th scope="col" class="image-cell"></th>
                                <th scope="col" class="image-cell"></th>
                                <th scope="col" class="image-cell">Category Name</th>
                                <th scope="col" class="image-cell">Description</th>
                                <th scope="col" class="image-cell">Price</th>
                                <th scope="col" class="image-cell">Active?</th>
                                <th scope="col" class="image-cell"></th>
                                <th scope="col" class="image-cell"></th>
                                
                              </tr>
                            </thead>
                            <tbody>
                                <% while(rscat.next())
                                    {  count++; %>
                                    <tr>
                                      <th scope="row" class="image-cell"><%= count %></th>
                                      <td><img src="../resimages/productimg/<%=rscat.getString("image") %>" class="image-cell" style="width: 50px; height: 50px;"></td>
                                      <td class="image-cell"><%= rscat.getString("name") %></td>
                                      <td class="image-cell"><%= rscat.getString("description").substring(0,20) + "..." %></td>
                                      <td class="image-cell">₹<%= rscat.getString("price") %></td>
                                      <td class="image-cell"><%= rscat.getString("active") %></td>
                                      <td class="image-cell"><a href="./editproductdetails.jsp?id=<%= rscat.getInt("category_id") %>&id1=<%= rscat.getInt("restaurant_id")%>&id2=<%= rscat.getInt("menu_id") %>">Edit</a></td>
                                      <td class="image-cell"><a href="../remove.jsp?msg=rpro&id=<%= rscat.getInt("category_id") %>&id1=<%= rscat.getInt("menu_id") %>">Remove</a></td>
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
        <%@include file="resfooter.jsp" %>
        

    </body>




