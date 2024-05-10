<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    
    String query = "SELECT m.name, sum(m.price * ca.quantity) as item_price " +
                   "FROM menu m " +
                   "INNER JOIN addtocard ca ON m.menu_id = ca.menu_id " +
                   "WHERE ca.customer_id = (SELECT customer_id FROM customer WHERE username = ?) " +
                   "group by m.name order by ca.cart_id asc";

    PreparedStatement stmtc = con.prepareStatement(query);
    stmtc.setString(1, username);
    ResultSet rsc = stmtc.executeQuery(); 

    String query1 = "SELECT sum(m.price * ca.quantity) as total_price " +
                   "FROM menu m " +
                   "INNER JOIN addtocard ca ON m.menu_id = ca.menu_id " +
                   "WHERE ca.customer_id = (SELECT customer_id FROM customer WHERE username = ?)";

    PreparedStatement stmtc2 = con.prepareStatement(query1);
    stmtc2.setString(1, username);
    ResultSet rsc2 = stmtc2.executeQuery(); 
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
                                <span>Checkout</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="checkout spad">
            <div class="container">
                <div class="checkout__form">
                    <h4>Billing Details</h4>
                    <form action="../customeraction/orderaction.jsp">
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Fist Name<span>*</span></p>
                                            <input type="text" name="fname" minlength="1" maxlength="15" required="">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Last Name<span>*</span></p>
                                            <input type="text" name="lname" minlength="1" maxlength="12" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="checkout__input">
                                    <p>Phone No.<span>*</span></p>
                                    <input type="text" name="phno" minlength="10" maxlength="10" required="">
                                </div>
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input type="email" name="email" minlength="7" maxlength="70" required="">
                                </div>
                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    <input type="text" class="checkout__input__add" name="address" minlength="5" maxlength="70" required="">
                                </div>
                                <div class="checkout__input">
                                    <p>Town/City<span>*</span></p>
                                    <input type="text" name="city" minlength="1" maxlength="20" required="">
                                </div>
                                <div class="checkout__input">
                                    <p>State<span>*</span></p>
                                    <input type="text" name="state" minlength="1" maxlength="20" required="">
                                </div>
                                <div class="checkout__input">
                                    <p>Pincode / Zipcode<span>*</span></p>
                                    <input type="text" name="postcode" minlength="1" maxlength="6" required="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="checkout__order">
                                    <h4>Your Order</h4>
                                    <div class="checkout__order__products">Products <span>Total</span></div>
                                    <% while(rsc.next()) { %>
                                    <ul>
                                        <li> <%= rsc.getString("name") %> <span>₹<%= rsc.getInt("item_price") %></span></li>
                                    </ul>
                                    <% } %>
                                    
                                    <div class="checkout__order__subtotal"></div> 
                                    <% if(rsc2.next()) { %>
                                    <div class="checkout__order__total">Total <span>₹<%= rsc2.getInt("total_price") %></span></div> <% } %>
                                    
                                    <div class="checkout__input__checkbox">
                                        <label for="payment">
                                            Cash On Delivery *
                                            <input type="checkbox" value="Cash On Delivery" required="" name="ptype" id="payment">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <button type="submit" class="site-btn">PLACE ORDER</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <% } else { response.sendRedirect("../customer/login.jsp"); } %>
        <!-- Checkout Section End -->
        
        <%@include file="footer.jsp" %>
    </body>