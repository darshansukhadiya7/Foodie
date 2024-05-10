<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String msg = null;
    msg = request.getParameter("msg");
    int order_id = Integer.parseInt(request.getParameter("id2"));
    int checkout_id = Integer.parseInt(request.getParameter("id"));
    String pname = request.getParameter("pname");
    String rusername = (String)session.getAttribute("restaurantname");
    String quec = "select c.checkout_id, c.name, c.pno, c.email, c.address, c.city, c.state, c.pincode, o.order_id as order_id, o.status1 as status "
            + "from order2 o "
            + "inner join checkout c on o.checkout_id = c.checkout_id "
            + "where o.order_id = ?";
    PreparedStatement stmtc = con.prepareStatement(quec);
    stmtc.setInt(1, order_id);
    ResultSet rsc = stmtc.executeQuery();

%>

<body>        
    <%@include file="resheader.jsp" %>
    
    <main id="main" class="main">

                <div class="pagetitle">
                  <nav>
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                      <li class="breadcrumb-item active">Edit Details</li>
                    </ol>
                  </nav>
                </div><!-- End Page Title -->
        
        <section class="section">
            <div class="row">
                <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <% if(rsc.next())
                        { 
                            String status = rsc.getString("status");
                        %>
                                                       
                        <form action="../statusedit.jsp?id=<%= order_id %>&id1=<%= checkout_id %>&pname=<%= pname %>" method="post">
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
                                        <input type="text"  value="<%= rsc.getString("name") %>" readonly="" class="form-control">
                                    </div>
                                  </div>

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">Phone No.</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsc.getString("pno") %>" readonly="" class="form-control">
                                    </div>
                                  </div>

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">Email</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsc.getString("email") %>" readonly="" class="form-control">
                                    </div>
                                  </div>                              

                                  <div class="row mb-3">
                                    <label for="inputPassword" class="col-sm-4 col-form-label">Address</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control"  style="height: 100px"><%= rsc.getString("address") %></textarea>
                                    </div>
                                  </div>

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">City</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsc.getString("city") %>" readonly="" class="form-control">
                                    </div>
                                  </div>    

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">State</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsc.getString("state") %>" readonly="" class="form-control">
                                    </div>
                                  </div>

                                  <div class="row mb-3">
                                    <label for="inputText" class="col-sm-4 col-form-label">Pincode / Postcode</label>
                                    <div class="col-sm-8">
                                        <input type="text"  value="<%= rsc.getString("pincode") %>" readonly="" class="form-control">
                                    </div>
                                  </div>
                                  <div class="row mb-3">
                                    <label class="col-sm-4 col-form-label">Status</label>
                                    <div class="col-sm-8">

                                      <select class="form-select" name="status" aria-label="Default select example">
                                       <% if("Pending".equals(status))
                                        { 
                                       %>
                                       <option value="<%= status %>" Selected=""><%= status %></option>
                                       <option value="Approved">Approved</option>
                                       <% } else { %>
                                       <option value="<%= status %>" Selected=""><%= status %></option>
                                       <option value="Pending">Pending</option>
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
    <%@include file="resfooter.jsp" %>
    
    </body>


