<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String msg = null;
    msg = request.getParameter("msg");
%>

    <body>
        <%@include file="./adminheader.jsp" %>
        
        <main id="main" class="main">

                <div class="pagetitle">
                  <nav>
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="./admindashboard.jsp">Home</a></li>
                      <li class="breadcrumb-item active">Add Restaurant</li>
                    </ol>
                  </nav>
                </div><!-- End Page Title -->
        
                <section class="section">
                    <div class="row">
                      <div class="col-lg-3"></div>
                      <div class="col-lg-6">

                        <div class="card">
                          
                          <div class="card-body">
                            <h5 class="card-title">Add Restaurant</h5>
                          <% if(msg != null) { %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <%= msg %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                          <% } %>
                            <!-- General Form Elements -->
                            <form method="post" action="../adminaction/editresdetails.jsp?msg=res">
                              <div class="row mb-3">
                               <label for="inputPassword" class="col-sm-4 col-form-label">Restaurant Username</label>
                                <div class="col-sm-8">
                                    <input type="text" name="username" minlength="6" maxlength="15" required="" class="form-control">
                                </div>
                              </div>
                              <div class="row mb-3">
                                <label for="inputPassword" class="col-sm-4 col-form-label">Restaurant Password</label>
                                <div class="col-sm-8">
                                  <input type="password" name="pass" minlength="6" maxlength="15" required="" class="form-control">
                                </div>
                              </div>
                              <div class="row mb-5">
                                <label class="col-sm-4 col-form-label">Active?</label>
                                <div class="col-sm-8">
                                  <select class="form-select" name="status" aria-label="Default select example">
                                    <option value="yes" selected="">Yes</option>
                                    <option value="no">No</option>
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

                          </div>
                        </div>

                      </div>
                      <div class="col-lg-3"></div>
                      </div>
                  </section>
        </main>
        
        <%@include file="./adminfooter.jsp" %>
    </body>