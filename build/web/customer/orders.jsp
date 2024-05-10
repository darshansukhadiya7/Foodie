<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>


<%
    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    String query_fetch_ordertotal = "select * from order_total where customer_id=(select customer_id from customer where username=?)";
    PreparedStatement stmtqfot = con.prepareStatement(query_fetch_ordertotal);
    stmtqfot.setString(1, username);
    ResultSet rsqfot = stmtqfot.executeQuery();

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
                                <span>Orders</span>
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
                                        <th class="shoping__product">Order Id</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% while(rsqfot.next()) { %>
                                    <tr>
                                        <td style="color: #003c81; font-weight: bolder;">
                                            <%= rsqfot.getInt("order_id") %>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <%= rsqfot.getDate("date") %>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                                <%= rsqfot.getTime("time") %>
                                            </div>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            ₹<%= rsqfot.getString("order_total_price") %>
                                        </td>
                                        <td>
                                            <a href="orderdetail.jsp?id=<%= rsqfot.getInt("order_id") %>">
                                                <span class="bi bi-eye" style="color: black;" aria-hidden="true"></span> <!-- Bootstrap Eye Icon -->
                                            </a>
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
                        </div>
                    </div>
                </div>
            </div>
        </section>        
        <% } else { response.sendRedirect("../customer/login.jsp"); } %>
        <%@include file="footer.jsp" %>
        
    </body>