<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    
    int res_id = Integer.parseInt(request.getParameter("id1"));
    int cat_id = Integer.parseInt(request.getParameter("id"));
    int pro_id = Integer.parseInt(request.getParameter("id2"));
    String msg = request.getParameter("msg");
    String rusername = (String)session.getAttribute("restaurantname");
    Statement stmtpro = con.createStatement();
    String pque = "select * from menu where restaurant_id="+res_id+" and category_id="+cat_id+" and menu_id="+pro_id;
    ResultSet rspro = stmtpro.executeQuery(pque);
    
    Statement stmtcatname = con.createStatement();
    String quecatname = "select name,category_id from category where restaurant_id="+res_id;
    ResultSet rscatname = stmtcatname.executeQuery(quecatname);
    int count = 0;
%>

            
    <%@include file="resheader.jsp" %>
    
    <main id="main" class="main">

                <div class="pagetitle">
                  <nav>
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                      <li class="breadcrumb-item active">Edit Products</li>
                    </ol>
                  </nav>
                </div><!-- End Page Title -->
        
                <section class="section">
                    <div class="row">
                      <div class="col-lg-3"></div>
                      <div class="col-lg-6">

                        <div class="card">
                          <div class="card-body">
                            <h5 class="card-title">Edit Product</h5>
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
                            <%
                                while(rspro.next())
                                { 
                                    String pcatname = rspro.getString("name");
                            %>
                            <form action="../upload.jsp?msg=editproducts&id1=<%= cat_id %>&id2=<%= pro_id %>" method="post">
                              <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Category</label>
                                <div class="col-sm-8">
                                  
                                  <select class="form-select" name="cat_name" aria-label="Default select example">
                                   <% while(rscatname.next())
                                    { if((rscatname.getString("name").equals(pcatname)))
                                    { 
                                   %>
                                   <option value="<%= rscatname.getInt("category_id") %>" Selected=""><%= rscatname.getString("name") %></option>
                                   <% } else { %>
                                    <option value="<%= rscatname.getInt("category_id") %>"><%= rscatname.getString("name") %></option>
                                   <% }}%>
                                  </select>
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label for="inputText" class="col-sm-4 col-form-label">Name</label>
                                <div class="col-sm-8">
                                    <input type="text" name="proname" required="" minlength="5" maxlength="100" value="<%= rspro.getString("name") %>" class="form-control">
                                </div>
                              </div>

                              <div class="row mb-3">
                                <label for="inputNumber" class="col-sm-4 col-form-label">Image</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="file" name="proimg"  accept=".jpg, .jpeg, .png">
                                </div>
                              </div>



                              <div class="row mb-3">
                                <label for="inputPassword" class="col-sm-4 col-form-label">Description</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" required="" minlength="20" maxlength="240" name="prodes" style="height: 100px"><%= rspro.getString("description") %></textarea>
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label for="inputText" class="col-sm-4 col-form-label">Price</label>
                                <div class="col-sm-8">
                                    <input type="text" name="proprice" required="" value="<%= rspro.getString("price") %>" class="form-control">
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Active?</label>
                                <div class="col-sm-8">
                                  <select class="form-select" name="proactive" aria-label="Default select example">
                                    <% if("yes".equals(rspro.getString("active"))) { %>
                                    <option value="yes" selected="">Yes</option>
                                    <option value="no">No</option>
                                    <% } else { %>
                                    <option value="no" selected="">No</option>
                                    <option value="yes">Yes</option>
                                    <% } %>
                                  </select>
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
                            <% } %>

                          </div>
                        </div>

                      </div>
                      <div class="col-lg-3"></div>
                      </div>
                  </section>
            </main>
            <%@include file="resfooter.jsp" %>
    
    </body>


