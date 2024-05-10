<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>

<%  
    String msg = request.getParameter("msg");
    Connection con = ConnectionProvider.getcon();
    PreparedStatement data = con.prepareStatement("select * from admin where username=?");
    String name = (String)session.getAttribute("adminname");
    data.setString(1,name);
    ResultSet rs = data.executeQuery();
    String aimg = null;
    String aname = null;
    String ausername = null;
    String apass = null;
    String aemail = null;
    String aphno = null;
    int aid = 0;
    
    while(rs.next())
    {
        aimg = "./admin.jpg";
        aname = rs.getString("name");
        ausername = rs.getString("username");
        apass = rs.getString("password");
        aemail = rs.getString("email");
        aphno = rs.getString("phno");
        aid = rs.getInt("admin_id");
    }
    
%>

<body>
        <%@include file="./adminheader.jsp" %>  
        <main id="main" class="main">
            <%
                if(msg != null)
                { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= msg %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
               <% }
               %>
            <div class="pagetitle"> 
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
                  <li class="breadcrumb-item active">Admin Profile</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->

            <section class="section profile">
              <div class="row">
                <div class="col-xl-4">

                  <div class="card">
                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                      <img src="<%= aimg %>" alt="Profile" class="rounded-circle">
                      <h2><%= session.getAttribute("adminname") %></h2>
                      <h3>Admin</h3>
                      <div class="social-links mt-2">
                        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                      </div>
                    </div>
                  </div>

                </div>

                <div class="col-xl-8">

                  <div class="card">
                    <div class="card-body pt-3">
                      <!-- Bordered Tabs -->
                      <ul class="nav nav-tabs nav-tabs-bordered">

                        <li class="nav-item">
                          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                        </li>
                      </ul> 
                      <div class="tab-pane fade show profile-edit pt-3" id="profile-edit">
                          <form method="post" action="editadmindetails.jsp?msg=editdetails">
                            <div class="row mb-3">
                              <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Admin Name</label>
                              <div class="col-md-8 col-lg-9">
                                  <input name="aname" type="text" required="" class="form-control" minlength="5" maxlength="20" value="<%= aname %>">
                                  <input name="aid" type="hidden" value="<%= aid %>">
                              </div>
                            </div>


                            <div class="row mb-3">
                              <label for="company" class="col-md-4 col-lg-3 col-form-label">Username</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="ausername" type="text" class="form-control" minlength="6" maxlength="15" required=""  value="<%= ausername %>">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone No.</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="aphone" type="text" class="form-control" minlength="10" maxlength="10" required=""  value="<%= aphno %>">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="aemail" type="email" class="form-control" minlength="7" maxlength="70" required="" value="<%= aemail %>">
                              </div>
                            </div>

                            <div class="text-center">
                              <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                          </form>
                      </div>

                        
                    </div>
                  </div>
                </div>

              </div>
            </section>

          </main>
        <%@include file="./adminfooter.jsp" %>
        

    </body>

