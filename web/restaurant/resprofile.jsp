<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>

<%  
    String msg = request.getParameter("msg");
    Connection con = ConnectionProvider.getcon();
    PreparedStatement data = con.prepareStatement("select * from restaurant where username=?");
    String name = (String)session.getAttribute("restaurantname");
    data.setString(1,name);
    ResultSet rs = data.executeQuery();
    while(rs.next())
    {
        String rimg = "../resimages/resimageslogo/" + rs.getString("image");
        session.setAttribute("rimg", rimg);
        String rname = rs.getString("name");
        String rabout = rs.getString("description");
        String rusername = rs.getString("username");
        String radd = rs.getString("address");
        String rcity = rs.getString("city");
        String rstate = rs.getString("state");
        String rphno = rs.getString("phno");
        String remail = rs.getString("email");
        String rpass = rs.getString("pass");
    
%>

        
        <%@include file="./resheader.jsp" %>  
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
                  <li class="breadcrumb-item active">Restaurant Profile</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->

            <section class="section profile">
              <div class="row">
                <div class="col-xl-4">

                  <div class="card">
                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                      <img src="<%= rimg %>" alt="Profile" class="rounded-circle">
                      <h2><%= session.getAttribute("restaurantname") %></h2>
                      <h3>Restaurant Admin</h3>
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
                          <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                        </li>

                        <li class="nav-item">
                          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                        </li>
                      </ul>
                      <div class="tab-content pt-2">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">
                          <h5 class="card-title">About Restaurant</h5>
                          <p class="small fst-italic"><%= rabout %></p>

                          <h5 class="card-title">Profile Details</h5>

                          <div class="row">
                            <div class="col-lg-3 col-md-4 label ">Restaurant Name</div>
                            <div class="col-lg-9 col-md-8"><%= rname %></div>
                          </div>

                          <div class="row">
                            <div class="col-lg-3 col-md-4 label">Username</div>
                            <div class="col-lg-9 col-md-8"><%= rusername %></div>
                          </div>

                          <div class="row">
                            <div class="col-lg-3 col-md-4 label">Address</div>
                            <div class="col-lg-9 col-md-8"><%= radd %></div>
                          </div>
                          
                          <div class="row">
                            <div class="col-lg-3 col-md-4 label">City</div>
                            <div class="col-lg-9 col-md-8"><%= rcity %></div>
                          </div>
                          
                          <div class="row">
                            <div class="col-lg-3 col-md-4 label">State</div>
                            <div class="col-lg-9 col-md-8"><%= rstate %></div>
                          </div>
                          
                          <div class="row">
                            <div class="col-lg-3 col-md-4 label">Email</div>
                            <div class="col-lg-9 col-md-8"><%= remail %></div>
                          </div>
                          
                          <div class="row">
                            <div class="col-lg-3 col-md-4 label">Phone No.</div>
                            <div class="col-lg-9 col-md-8"><%= rphno %></div>
                          </div>

                        </div>

                        <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
                          <form method="post" action="../upload.jsp?msg=radddetails">
                            <div class="row mb-3">
                              <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                              <div class="col-md-8 col-lg-9">
                                  <img src="<%= rimg %>" alt="Profile">
                                <div class="pt-2">
                                  <input type="file"  name="rimg" accept="image/jpeg, image/png">
                                </div>
                              </div>
                            </div>
                            <div class="row mb-3">
                                <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Restaurant Name</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="rname" type="text" required="" class="form-control" minlength="5" maxlength="20" value="<%= rname %>">
                                </div>
                            </div>

                            <div class="row mb-3">
                              <label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
                              <div class="col-md-8 col-lg-9">
                                <textarea name="rabout" class="form-control" minlength="20" maxlength="240" required=""  style="height: 100px"><%= rabout %></textarea>
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="company" class="col-md-4 col-lg-3 col-form-label">Username</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="rusername" type="text" class="form-control" minlength="6" maxlength="15" required=""  value="<%= rusername %>">
                              </div>
                            </div>


                            <div class="row mb-3">
                              <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="raddress" type="text" class="form-control" required="" minlength="20" maxlength="150" value="<%= radd %>">
                              </div>
                            </div>
                              
                            <div class="row mb-3">
                              <label for="Address" class="col-md-4 col-lg-3 col-form-label">City</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="rcity" type="text" class="form-control" minlength="2" required="" maxlength="20" value="<%= rcity %>">
                              </div>
                            </div>
                              
                            <div class="row mb-3">
                              <label for="Address" class="col-md-4 col-lg-3 col-form-label">State</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="rstate" type="text" minlength="4" maxlength="20" class="form-control" required="" value="<%= rstate %>">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="rphone" type="text" class="form-control" minlength="10" maxlength="10" required=""  value="<%= rphno %>">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="remail" type="email" class="form-control" minlength="10" maxlength="70" required="" value="<%= remail %>">
                              </div>
                            </div>

                            <div class="text-center">
                              <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                            </form>
                            <% } %>
                        </div>
                     </div>

                    </div>
                  </div>
                </div>
              </div>
            </section>

          </main><!-- End #main -->
        <%@include file="./resfooter.jsp" %>
        

    </body>

