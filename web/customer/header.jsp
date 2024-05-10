<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>

<% 
    Connection con1 = ConnectionProvider.getcon();
    String username1 = (String)session.getAttribute("username");
    
        String query12 = "SELECT count(*) as total_item, sum(m.price * ca.quantity) as total_price " +
                   "FROM menu m " +
                   "INNER JOIN addtocard ca ON m.menu_id = ca.menu_id " +
                   "WHERE ca.customer_id = (SELECT customer_id FROM customer WHERE username = ?)";

    PreparedStatement stmtc1 = con1.prepareStatement(query12);
    stmtc1.setString(1, username1);
    ResultSet rsc1 = stmtc1.executeQuery(); 
    
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Foodie</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">


    </head>
    <body>
        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> foodie@gmail.com</li>
                                    <li>Free Shipping for above order ₹499</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                   <% if(session.getAttribute("username") != null) { %>
                                    <% if(session.getAttribute("username") == null) { %>
                                        <div class="header__top__right__auth">
                                            <a href="login.jsp"><i class="fa fa-user"></i> Login</a>
                                        </div>
                                    <% } else { %>
                                    
                                        <div class="header__top__right__social">
                                            <h6>Welcome <%= session.getAttribute("username") %> </h6>
                                        </div>
                                        <div class="header__top__right__auth">
                                            <a href="../auth/loginaction.jsp?msg=logout" onclick=""><i class="fa fa-user"></i>Log Out</a>
                                        </div>
                                        
                                    <% } %>
                                <% } else { %>
                                    <div class="header__top__right__auth">
                                        <a href="login.jsp"><i class="fa fa-user"></i> Login</a>
                                    </div>
                                <% } %>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="header__logo">
                            
                            <a href="index.jsp"><img src="../img/logo1.png" alt=""/></a>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="addres.jsp">Add Restaurant</a></li>
                                <li><a href="products.jsp">Products</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="header__menu__dropdown">
                                        <li><a href="shoppingcart.jsp">Shoping Cart</a></li>
                                        <li><a href="orders.jsp">Orders</a></li>
                                    </ul>
                                </li>
                                <li><a href="contactus.jsp">Contact-us</a></li>
                                <% if(session.getAttribute("username") != null) { %>
                                <li><a href="userprofile.jsp">Profile</a></li>
                                <% } %>
                            </ul>
                        </nav>
                    </div>
                    <% while(rsc1.next()) { %>
                    <div class="col-lg-1">
                        <div class="header__cart">
                            <ul>
                                <li><a href="shoppingcart.jsp"><i class="fa fa-shopping-bag"></i> <span><%= rsc1.getInt("total_item") %></span></a></li>
                            </ul>
                                <div class="header__cart__price">item: <span>₹<%= rsc1.getInt("total_price") %></span></div>
                        </div>
                    </div>
                    <% } %>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->
        <!-- Js Plugins -->
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.nice-select.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
        <script src="../js/jquery.slicknav.js"></script>
        <script src="../js/mixitup.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/main.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
