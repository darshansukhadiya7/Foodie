<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String msg = null;
    msg = request.getParameter("msg");
    int rid = Integer.parseInt(request.getParameter("id"));

    String quer = "select * from restaurant where restaurant_id = ?";
    PreparedStatement stmtr = con.prepareStatement(quer);
    stmtr.setInt(1, rid);
    ResultSet rsr = stmtr.executeQuery();

%>
<body>        
    <%@include file="./adminheader.jsp" %>
    
    <main id="main" class="main">

                <div class="pagetitle">
                  <nav>
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="./admindashboard.jsp">Home</a></li>
                      <li class="breadcrumb-item active">Edit Restaurant Details</li>
                    </ol>
                  </nav>
                </div><!-- End Page Title -->
        
        <section class="section">
            <div class="row">
                <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <% if(rsr.next())
                        { 
                            String status = rsr.getString("active");
                        %>
                                                       
                        <form action="../adminaction/editresdetails.jsp?msg=add&id=<%= rid %>" method="post">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Edit Status & View Details</h5>
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
                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">Name</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsr.getString("name") %>" readonly="" class="form-control">
                                    </div>
                                  </div>

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">Phone No.</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsr.getString("phno") %>" readonly="" class="form-control">
                                    </div>
                                  </div>

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">Email</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsr.getString("email") %>" readonly="" class="form-control">
                                    </div>
                                  </div>                              

                                  <div class="row mb-3">
                                    <label for="inputPassword" class="col-sm-4 col-form-label">Address</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control"  style="height: 100px"><%= rsr.getString("address") %></textarea>
                                    </div>
                                  </div>

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">City</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsr.getString("city") %>" readonly="" class="form-control">
                                    </div>
                                  </div>    

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">State</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsr.getString("state") %>" readonly="" class="form-control">
                                    </div>
                                  </div>
                                    
                                  <div class="row mb-3">
                                    <label class="col-sm-4 col-form-label">Status</label>
                                    <div class="col-sm-8">

                                      <select class="form-select" name="status" aria-label="Default select example">
                                       <% if("yes".equals(status))
                                        { 
                                       %>
                                       <option value="<%= status %>" Selected="">Yes</option>
                                       <option value="no">No</option>
                                       <% } else { %>
                                       <option value="<%= status %>" Selected="">No</option>
                                       <option value="yes">Yes</option>
                                       <% }%>
                                      </select>
                                    </div>
                                  </div>                                   

                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-sm-5"></div>
                             <div class="col-sm-2">
                                 <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                            <div class="col-sm-5"></div>
                        </div>
                        </form>
                    <% } %>
                        
                    </div>
                        

                    </div>
            <div class="col-lg-3"></div>
        </section>
    </main>
    <%@include file="./adminfooter.jsp" %>
    
    </body>


