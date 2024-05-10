<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    
    String rusername = (String)session.getAttribute("restaurantname");
    Statement stmtcat = con.createStatement();
    ResultSet rscat = stmtcat.executeQuery("select DISTINCT name from category where restaurant_id=(select restaurant_id from restaurant where username='" + rusername + "')");
    String msg = request.getParameter("msg");
%>

    <body>
            <%@include file="resheader.jsp" %>
            
            <main id="main" class="main">

                <div class="pagetitle">
                  <nav>
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                      <li class="breadcrumb-item active">Add Products</li>
                    </ol>
                  </nav>
                </div><!-- End Page Title -->
        
                <section class="section">
                    <div class="row">
                      <div class="col-lg-3"></div>
                      <div class="col-lg-6">

                        <div class="card">
                          <div class="card-body">
                            <h5 class="card-title">Add Products</h5>
                            <%
                                if(msg != null)
                                { %>
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <%= msg %>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                               <% 
                                }
                             %>
                            <!-- General Form Elements -->
                            <form action="../upload.jsp?msg=addproduct" method="post">
                              <div class="row mb-3">
                                <label for="inputText" class="col-sm-4 col-form-label">Name</label>
                                <div class="col-sm-8">
                                    <input type="text" name="pname" class="form-control" required="" minlength="5" maxlength="100">
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Category</label>
                                <div class="col-sm-8">
                                  <select class="form-select" name="catname" aria-label="Default select example">
                                    <% 
                                        while(rscat.next()) 
                                        {
                                            String catnamefetch = rscat.getString("name");
                                            
                                    %>
                                    <option value="<%= catnamefetch %>"><%= catnamefetch %></option>
                                    <% } %>
                                  </select>
                                  
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label for="inputNumber" class="col-sm-4 col-form-label">Image</label>
                                <div class="col-sm-8">
                                    <input class="form-control" name="pimg" type="file" id="formFile"  accept=".jpg, .jpeg, .png">
                                </div>
                              </div>

                              <div class="row mb-3">
                                <label for="inputPassword" class="col-sm-4 col-form-label">Description</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" style="height: 100px" name="pdes" required="" minlength="20" maxlength="240"></textarea>
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Active?</label>
                                <div class="col-sm-8">
                                  <select class="form-select" name="pactive" aria-label="Default select example">
                                    <option value="yes" selected="">Yes</option>
                                    <option value="no">No</option>
                                  </select>
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label for="inputText" class="col-sm-4 col-form-label">Price</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="pprice" required="">
                                </div>
                              </div>
                              <div class="row mb-3">
                                <div class="col-sm-5"></div>
                                <div class="col-sm-2">
                                  <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                                <div class="col-sm-5"></div>
                              </div>

                            </form><!-- End General Form Elements -->

                          </div>
                        </div>

                      </div>
                      <div class="col-lg-3"></div>
                      </div>
                  </section>
            </main>
            <%@include file="resfooter.jsp" %>


    </body>


