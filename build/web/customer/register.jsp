<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <body>
        <%@include file="header.jsp" %>
        
        <!-- Section: Design Block -->
        <section class="">  
          <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
            <div class="container">
              <div class="row gx-lg-5 align-items-center">
                <div class="col-lg-3 mb-5 mb-lg-0">
                  <h1 class="my-5 display-3 fw-bold ls-tight">
                    <span class="text-primary"></span>
                  </h1>
                  <p style="color: hsl(217, 10%, 50.8%)">
                  </p>
                </div>

                <div class="col-lg-6 mb-5 mb-lg-0">
                  <div class="card">
                    <div class="card-body py-5 px-md-5">
                        <h2 class="fw-normal mb-3 pb-3">Register your account</h2>
                        <form action="../auth/registeraction.jsp" method="post">
                        <!-- 2 column grid layout with text inputs for the first and last names -->
                        <div class="row">
                          <div class="col-md-6 mb-4">
                            <div class="form-outline">
                              <input type="text" placeholder="enter your firstname" minlength="2" maxlength="15" name="fname" class="form-control" required/>
                            </div>
                          </div>
                          <div class="col-md-6 mb-4">
                            <div class="form-outline">
                              <input type="text" placeholder="enter your lastname" name="lname" minlength="2" maxlength="12" class="form-control" required/>
                            </div>
                          </div>
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" name="email" placeholder="enter your email" minlength="7" maxlength="70" class="form-control" required/>
                        </div>
                        
                        <div class="form-outline mb-4">
                            <input type="text" name="phno" placeholder="enter your Phone no." minlength="10" maxlength="10" class="form-control" required/>
                        </div>
                        <div class="form-outline mb-4">
                            <input type="text" name="username" placeholder="enter your username" minlength="6" maxlength="15" class="form-control" required/>
                        </div>
                        <!-- Password input -->
                        <div class="form-outline mb-4">
                          <input type="password" placeholder="enter your password" name="pass" minlength="6" maxlength="15" class="form-control" required/>
                        </div>
                        <%
                            String msg = null;
                            msg = request.getParameter("msg");
                            if("invalidquery".equals(msg))
                            { %>
                                <p class="mb-2 pb-lg-2" style="color: #f00">Some thing went wrong in query..| try again</p>
                            <% } if("invalid".equals(msg)){ %>
                                <p class="mb-2 pb-lg-2" style="color: #f00">Some thing went wrong..| try again</p>
                            <% } %>
                            <% if("exist".equals(msg)){ %>
                                <p class="mb-2 pb-lg-2" style="color: #f00">Username already exist..| try again</p>
                            <% } %>

                        <input type="submit" class="btn btn-primary btn-block mb-2" value="SIGN UP">
                        <br> 
                        <p class="mb-2 pb-lg-2" style="color: #393f81;">have an account? <a href="login.jsp"
                      style="color: #003eff"> Login</a></p>

                        <!-- Register buttons -->
                        
                      </form>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 mb-5 mb-lg-0">
                  <h1 class="my-5 display-3 fw-bold ls-tight">
                    <span class="text-primary"></span>
                  </h1>
                  <p style="color: hsl(217, 10%, 50.8%)">
                  </p>
                </div>
              </div>
            </div>
          </div>
          <!-- Jumbotron -->
        </section>
        <%@include file="footer.jsp" %>
        
    </body>