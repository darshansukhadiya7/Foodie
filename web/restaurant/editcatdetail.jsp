<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    int cat_id = Integer.parseInt(request.getParameter("id"));
    int res_id = Integer.parseInt(request.getParameter("id1"));
    String msg = request.getParameter("msg");
    String rusername = (String)session.getAttribute("restaurantname");
    Statement stmtcatname = con.createStatement();
    String quecatname = "select name from category where restaurant_id="+res_id;
    ResultSet rscatname = stmtcatname.executeQuery(quecatname);

    Statement stmtcatdetails = con.createStatement();
    String quecatdetails = "select * from category where category_id = " + cat_id + " and restaurant_id = " + res_id;
    ResultSet rscatdetails = stmtcatdetails.executeQuery(quecatdetails);
%>

            
    <%@include file="resheader.jsp" %>
    
    <main id="main" class="main">

                <div class="pagetitle">
                  <nav>
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                      <li class="breadcrumb-item active">Edit Category</li>
                    </ol>
                  </nav>
                </div><!-- End Page Title -->
        
                <section class="section">
                    <div class="row">
                      <div class="col-lg-3"></div>
                      <div class="col-lg-6">

                        <div class="card">
                          <div class="card-body">
                            <h5 class="card-title">Edit Category</h5>
                            <%
                                if(msg != null)
                                { %>
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <%= msg %>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                               <% }
                            %>
                            <% while(rscatdetails.next()) 
                            { 
                                String catname1 = rscatdetails.getString("name");
                                String catactive1 = rscatdetails.getString("active");
                            %>
                            <form action="../upload.jsp?msg=catedit&catidu=<%= cat_id %>" method="post">
                              <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Category</label>
                                <div class="col-sm-8">
                                  <select class="form-select" name="catname" aria-label="Default select example">
                                    <% while(rscatname.next()) 
                                    { 
                                        String name = rscatname.getString("name");
                                        if(catname1.equals(name))
                                        { 
                                     %>
                                     <option value="<%= name %>" selected=""><%= name %></option>
                                    <% } else
                                    { %>
                                     <option value="<%= name %>"><%= name %></option>   
                                    <% } }%>
                                  </select>
                                </div>
                              </div>

                              <div class="row mb-3">
                                <label for="inputNumber" class="col-sm-4 col-form-label">Image</label>
                                <div class="col-sm-8">
                                    <input class="form-control" name="catimg" type="file" id="formFile"  accept=".jpg, .jpeg, .png" minlength="5" maxlength="100">
                                </div>
                              </div>

                              <div class="row mb-3">
                                <label for="inputPassword" class="col-sm-4 col-form-label">Description</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" style="height: 100px" name="catdes" required="" minlength="20" maxlength="200"><%= rscatdetails.getString("description") %></textarea>
                                </div>
                              </div>
                              <div class="row mb-5">
                                <label class="col-sm-4 col-form-label">Active?</label>
                                <div class="col-sm-8">
                                  <select class="form-select" name="catactive" aria-label="Default select example">
                                     <%
                                        if(catactive1.equals("yes"))
                                        { 
                                     %>
                                     <option value="yes" selected="">Yes</option>
                                     <option value="no">No</option>
                                    <% } else
                                    { %>
                                     <option value="no" selected="">No</option>
                                     <option value="yes">Yes</option>
                                    <% }%>
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


