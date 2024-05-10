<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Connection con = ConnectionProvider.getcon();
    int res_id = Integer.parseInt(request.getParameter("id"));
    int cat_id = Integer.parseInt(request.getParameter("id1"));
    int menu_id = Integer.parseInt(request.getParameter("id2"));
    String username = (String)session.getAttribute("username");
    String fpd = "select * from menu where active = 'yes' and restaurant_id="+res_id+" and category_id="+cat_id+" and menu_id="+menu_id;
    PreparedStatement stmtfpd = con.prepareStatement(fpd);
    ResultSet rsfpd = stmtfpd.executeQuery();
    

%>
    <head>
        <script>
            function checkLogin() {
                <% if(session.getAttribute("username") == null) { %>
                    alert("Please log in to add this item to your cart.");
                    window.location.href = "login.jsp?msg=login&id=<%= res_id %>&id1=<%= cat_id %>&id2=<%= menu_id %>";
                <% } else { %>
                    document.querySelector('form').submit(); // Submit the form
                <% } %>
            } 
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Product Details</h2>
                            <div class="breadcrumb__option">
                                <a href="index.jsp">Home</a>
                                <span>Product Details</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>       
        <section class="product-details">
            <div class="container">
                <form action="../customeraction/addcartitem.jsp?id=<%= res_id %>&id1=<%= cat_id %>&id2=<%= menu_id %>" method="post">

                <% String msg = request.getParameter("msg"); if(msg != null)
                { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= msg %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                        <% } %>

                <% while(rsfpd.next()) {  %>
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item">
                                <img class="product__details__pic__item--large" style="height: 450px; width: 400px;"
                                    src="../resimages/productimg/<%= rsfpd.getString("image") %>" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <h3><%= rsfpd.getString("name") %></h3>
                            <div class="product__details__rating">
                                <span class="fa fa-star"></span> <!-- Use smaller star icon -->
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star-half-o"></span> <!-- Adjust spacing or size -->
                                <span>(18 reviews)</span>
                            </div>
                            <div class="product__details__price">₹<%= rsfpd.getInt("price") %></div> <!-- Compact price display -->
                            <p><%= rsfpd.getString("description") %></p> <!-- Optimize description display -->
                            <div class="product__details__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" name="qty" value="1">
                                    </div>
                                </div>
                            </div>
                            <button type="button" onclick="checkLogin()" class="primary-btn">Add to Cart</button>
                            
                            <ul>
                                <li><b>Availability:</b> <span>In Stock</span></li> <!-- Correct typo -->
                                <li><b>Share on:</b>
                                    <div class="share">
                                        <a href="#"><i class="fa fa-facebook" style="font-size: 16px;"></i></a> <!-- Reduce icon size -->
                                        <a href="#"><i class="fa fa-twitter" style="font-size: 16px;"></i></a>
                                        <a href="#"><i class="fa fa-instagram" style="font-size: 16px;"></i></a>
                                        <a href="#"><i class="fa fa-pinterest" style="font-size: 16px;"></i></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                </form>
                <% } %>
            </div>
        </section>
        <div class="contact-form spad">
            <div class="container">
                <% if(session.getAttribute("username") != null) { %>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="contact__form__title">
                            <h2>Feedback for this product </h2>
                        </div>
                    </div>
                </div>
                
                <form action="../customeraction/review.jsp" method="post">
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <input type="text" placeholder="Your name" name="uname" value="<%= username %>" readonly="">
                            <input type="hidden" name="resid" value="<%= res_id %>">
                            <input type="hidden" name="catid" value="<%= cat_id %>">
                            <input type="hidden" name="menuid" value="<%= menu_id %>">
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <input type="text" placeholder="Your Email" name="email">
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <input type="number" placeholder="Enter Rating between 1 to 5" name="rating" min="1" max="5" required="">
                        </div>                        
                        <div class="col-lg-12 text-center">
                            <textarea placeholder="Your message" minlength="2" maxlength="240" name="message" required=""></textarea>
                            <button type="submit" class="site-btn">SEND MESSAGE</button>
                        </div>
                    </div>
                </form>
                <% } %>
            </div>
        </div>
       <%@include file="footer.jsp" %>
       
        
                
    </body>
