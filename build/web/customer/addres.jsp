<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String msg = null;
    msg = request.getParameter("msg");
%>
    <body>
        <%@include file="header.jsp" %>
        <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Foodie</h2>
                            <div class="breadcrumb__option">
                                <a href="index.jsp">Home</a>
                                <span>Add Restaurant</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <div class="contact-form spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="contact__form__title">
                            <h2>Add Restaurant</h2>
                        </div>
                    </div>
                </div>
                <% if(msg != null)
                { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= msg %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                <form action="../addresaction.jsp" method="post">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <input type="text" placeholder="enter restaurant name" name="rname" minlength="3" maxlength="20" required="">
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <input type="text" placeholder="enter restaurant username" name="username" minlength="6" maxlength="15" required="">
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <input type="password" placeholder="enter restaurant password" name="password" minlength="6" maxlength="15" required="">
                        </div>                        
                        <div class="col-lg-4 col-md-6">
                            <input type="email" placeholder="enter restaurant email" name="email" minlength="7" maxlength="70" required="">
                        </div> 
                        <div class="col-lg-12 text-center">
                            <input type="text" placeholder="enter restaurant phone no." name="phno" minlength="10" maxlength="10" required="">
                        </div>
                        <div class="col-lg-12 text-center">
                            <textarea placeholder="enter restaurant description" name="des" minlength="10" maxlength="240" required=""></textarea>
                        </div>
                        <div class="col-lg-12 text-center">
                            <textarea placeholder="enter restaurant address" name="address" minlength="20" maxlength="150" required=""></textarea>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <input type="text" placeholder="enter restaurant city" name="city" minlength="5" maxlength="20" required="">
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <input type="text" placeholder="enter restaurant state" name="state" minlength="5" maxlength="20" required="">
                        </div>
                         <div class="col-lg-12 text-center">
                            <button type="submit" class="site-btn">SEND MESSAGE</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>   
        <%@include file="footer.jsp" %>
        

    </body>
