<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    int cid = Integer.parseInt(request.getParameter("id"));
    String que_che_det = "select * from checkout where checkout_id="+cid;
    PreparedStatement stmtqcd = con.prepareStatement(que_che_det);
    ResultSet rsqcd = stmtqcd.executeQuery();
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
                                <span>Address Details</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="checkout spad">
            <div class="container">
                <div class="checkout__form">
                    <h4>Address Details</h4>
                        <div class="row">
                            <% while(rsqcd.next()) { %>
                            <div class="col-lg-12 col-md-6">
                                <div class="checkout__input">
                                    <p>Name</p>
                                    <input type="text"  value="<%= rsqcd.getString("name") %>" readonly="">
                                </div>
                                <div class="checkout__input">
                                    <p>Phone No.</p>
                                    <input type="text" value="<%= rsqcd.getString("pno") %>" readonly="">
                                </div>
                                <div class="checkout__input">
                                    <p>Email</p>
                                    <input type="email" value="<%= rsqcd.getString("email") %>" readonly="">
                                </div>
                                <div class="checkout__input">
                                    <p>Address</p>
                                    <input type="text" class="checkout__input__add" value="<%= rsqcd.getString("address") %>" readonly="">
                                </div>
                                <div class="checkout__input">
                                    <p>Town/City</p>
                                    <input type="text" value="<%= rsqcd.getString("city") %>" readonly="">
                                </div>
                                <div class="checkout__input">
                                    <p>State</p>
                                    <input type="text" value="<%= rsqcd.getString("state") %>" readonly="">
                                </div>
                                <div class="checkout__input">
                                    <p>Pincode / Zipcode</p>
                                    <input type="text" value="<%= rsqcd.getString("pincode") %>" readonly="">
                                </div>
                            </div>
                            <% } %>    
                        </div>
                </div>
            </div>
        </section>
        <% } else { response.sendRedirect("../customer/login.jsp"); } %>
        <!-- Checkout Section End -->
        
        <%@include file="footer.jsp" %>
    </body>