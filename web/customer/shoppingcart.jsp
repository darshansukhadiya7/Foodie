<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    boolean hasItemsInCart = false;
    String query = "SELECT ca.cart_id, m.menu_id, m.image, m.name, m.price, ca.quantity " +
                   "FROM menu m " +
                   "INNER JOIN addtocard ca ON m.menu_id = ca.menu_id " +
                   "WHERE ca.customer_id = (SELECT customer_id FROM customer WHERE username = ?)";
    

    PreparedStatement stmtc = con.prepareStatement(query);
    stmtc.setString(1, username);
    ResultSet rsc = stmtc.executeQuery();   
    int d_charg = 40;
%>
    <body>
        <%@include file="header.jsp" %>
        
        <% if(session.getAttribute("username") != null) { %>
        <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Foodie</h2>
                            <div class="breadcrumb__option">
                                <a href="index.jsp">Home</a>
                                <span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        

        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% while(rsc.next()) { 
                                        int product_price = rsc.getInt("price");
                                        int qty = rsc.getInt("quantity");
                                        int total = product_price * qty;
                                        hasItemsInCart = true;
                                    %>
                                        <tr>
                                            <td class="shoping__cart__item">
                                                <img src="../resimages/productimg/<%= rsc.getString("image") %>" style="height: 60px; width: 60px;" alt="">
                                                <h5><%= rsc.getString("name") %></h5>
                                            </td>
                                            <td class="shoping__cart__price">
                                                ₹<%= product_price  %>
                                            </td>
                                            <td class="shoping__cart__quantity">
                                                <div class="quantity">
                                                     <%= qty %>
                                                </div>
                                            </td>
                                            <td class="shoping__cart__total">
                                                ₹<%= total %>
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                <a href="../customeraction/removecartitem.jsp?id=<%= rsc.getInt("cart_id") %>"><span class="icon_close"></span></a>
                                            </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="index.jsp" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                            <% if(hasItemsInCart) { %>
                                <a href="checkout.jsp" class="primary-btn cart-btn cart-btn-right" >Proceed to Checkout</a>
                            <% } %>
                        </div>
                    </div>
                    <div class="col-lg-6">
                    </div>
                </div>
            </div>
        </section>
        
        <% } else { response.sendRedirect("../customer/login.jsp"); }  %>
        <!-- Shoping Cart Section End -->
        
        
    </body>
    <%@include file="footer.jsp" %>