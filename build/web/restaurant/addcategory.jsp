<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String msg = null;
    msg = request.getParameter("msg");
%>

    <body>
            
        <%@include file="resheader.jsp" %>
            <main id="main" class="main">

                <div class="pagetitle">
                  <nav>
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="./dashboard.jsp">Home</a></li>
                      <li class="breadcrumb-item active">Add Category</li>
                    </ol>
                  </nav>
                </div><!-- End Page Title -->
        
                <section class="section">
                    <div class="row">
                      <div class="col-lg-3"></div>
                      <div class="col-lg-6">

                        <div class="card">
                          <div class="card-body">
                            <h5 class="card-title">Add Categories</h5>
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
                            <form action="../upload.jsp?msg=addcategory" method="post">

                              <div class="row mb-3">
                                <label for="inputText" class="col-sm-4 col-form-label">Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="catname" required="" minlength="5" maxlength="50">
                                </div>
                              </div>

                              <div class="row mb-3">
                                <label for="inputNumber" class="col-sm-4 col-form-label">Image</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="file" name="catimg"  accept=".jpg, .jpeg, .png">
                                </div>
                              </div>



                              <div class="row mb-3">
                                <label for="inputPassword" class="col-sm-4 col-form-label">Description</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" name="catdes" style="height: 100px" required="" minlength="20" maxlength="200"></textarea>
                                </div>
                              </div>
                              <div class="row mb-5">
                                <label class="col-sm-4 col-form-label">Active?</label>
                                <div class="col-sm-8">
                                  <select class="form-select" name="catactive" aria-label="Default select example">
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
        <%@include file="resfooter.jsp" %>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

          <script src="./assets/vendor/apexcharts/apexcharts.min.js"></script>
          <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
          <script src="./assets/vendor/chart.js/chart.umd.js"></script>
          <script src="./assets/vendor/echarts/echarts.min.js"></script>
          <script src="./assets/vendor/quill/quill.min.js"></script>
          <script src="./assets/vendor/simple-datatables/simple-datatables.js"></script>
          <script src="./assets/vendor/tinymce/tinymce.min.js"></script>
          <script src="./assets/vendor/php-email-form/validate.js"></script>
          <script src="./assets/js/main.js"></script>

    </body>

