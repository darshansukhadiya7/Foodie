<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
        String msg = null;
        String res_id = null;
        String cat_id = null;
        String menu_id = null;
        msg = request.getParameter("msg");
        res_id = request.getParameter("id");
        cat_id = request.getParameter("id1");
        menu_id = request.getParameter("id2");
%>
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
                        <h2 class="fw-normal mb-3 pb-3">Login...</h2>
                <% if("login".equals(msg)) { %>
                    <form method="post" action="../auth/loginaction.jsp?msg=login&id=<%= res_id %>&id1=<%= cat_id %>&id2=<%= menu_id%>">

                        <div class="form-outline mb-4">
                            <input type="text" name="username" minlength="6" maxlength="15" placeholder="enter your username" class="form-control" required/>
                        </div>
                        <!-- Password input -->
                        <div class="form-outline mb-4">
                          <input type="password" placeholder="enter your password" minlength="6" maxlength="15" name="pass" class="form-control" required/>
                        </div>
                        
                        <input type="submit" class="btn btn-primary btn-block mb-2" value="SIGN IN">
                        <br>    
                            <%
                            if("invalid".equals(msg))
                            { %>
                            <p class="mb-2 pb-lg-2" style="color: #f00">enter valid username....</p>
                            <% } %>
                        <p class="mb-2 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="register.jsp"
                      style="color: #003eff">Register</a></p>

                        <!-- Register buttons -->
                        
                    </form>
                <% } else { %>
                
                    <form method="post" action="../auth/loginaction.jsp">

                        <div class="form-outline mb-4">
                            <input type="text" name="username" minlength="6" maxlength="15" placeholder="enter your username" class="form-control" required/>
                        </div>
                        <!-- Password input -->
                        <div class="form-outline mb-4">
                          <input type="password" placeholder="enter your password" minlength="6" maxlength="15" name="pass" class="form-control" required/>
                        </div>
                        
                        <input type="submit" class="btn btn-primary btn-block mb-2" value="SIGN IN">
                        <br>    
                            <%
                            if("invalid".equals(msg))
                            { %>
                            <p class="mb-2 pb-lg-2" style="color: #f00">enter valid username....</p>
                            <% } %>
                        <p class="mb-2 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="register.jsp"
                        style="color: #003eff">Register</a></p>

                        <!-- Register buttons -->
                        
                    </form>
                <% } %>
                
                        
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
<!-- Section: Design Block -->
        <%@include file="footer.jsp" %>
        
    </body>