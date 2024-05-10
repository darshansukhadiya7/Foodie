<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>


<%
    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    int order_id = Integer.parseInt(request.getParameter("id"));
    String que_fetch_item = "select c.checkout_id as cid,  o.pname as name, o.price as price, "
            + "o.quantity as qty, o.total as total, o.status1 as status "
            + "from order2 o "
            + "inner join checkout c on o.checkout_id = c.checkout_id "
            + "where o.order_id = ? and o.customer_id = (select customer_id from customer where username=?)";
    PreparedStatement stmtqfi = con.prepareStatement(que_fetch_item);
    stmtqfi.setInt(1, order_id);
    stmtqfi.setString(2, username);
    ResultSet rsqfi = stmtqfi.executeQuery();

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
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% while(rsqfi.next()) { String status = rsqfi.getString("status"); %>
                                    <tr>
                                        <td class="shoping__cart__quantity" style="color: #003c81; font-weight: bolder;">
                                            <%= rsqfi.getString("name") %>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                               ₹<%= rsqfi.getInt("price") %>
                                            </div>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                               <%= rsqfi.getInt("qty") %>
                                            </div>
                                        </td>     
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                               ₹<%= rsqfi.getInt("total") %>
                                            </div>
                                        </td>
                                        <% if("Pending".equals(status)) { %>
                                        <td class="shoping__cart__quantity" style="color: white;"><span class="badge bg-warning">Pending</span></td>
                                            <% } else { %>
                                            <td class="shoping__cart__quantity" style="color: white;"><span class="badge bg-success">Approved</span></td>
                                        <% } %>
                                        <td>
                                            <a href="ordercheckoutdetails.jsp?id=<%= rsqfi.getInt("cid") %>">
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