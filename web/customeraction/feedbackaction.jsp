<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int customer_id = 0;
    Connection con = ConnectionProvider.getcon();
    int res_id = Integer.parseInt(request.getParameter("id"));
    int cat_id = Integer.parseInt(request.getParameter("id1"));
    int menu_id = Integer.parseInt(request.getParameter("id2"));
    String username = (String)session.getAttribute("username");
    
    String customer_idque = "select customer_id from customer where username="+username;
    PreparedStatement stmtc = con.prepareStatement(customer_idque);
    ResultSet rsc = stmtc.executeQuery();
    if(rsc.next())
    {
        customer_id = rsc.getInt("customer_id");
    }
    
    String rating = request.getParameter("rating");
    String message = request.getParameter("message");
    String insfeedbackque = "insert into review(customer_id,restaurant_id,category_id,menu_id,rating,message) value(?,?,?,?,?,?)";
    PreparedStatement stmtfi = con.prepareStatement(insfeedbackque);
    stmtfi.setInt(1, customer_id);
    stmtfi.setInt(2, res_id);
    stmtfi.setInt(3, cat_id);
    stmtfi.setInt(4, menu_id);
    stmtfi.setString(5, rating);
    stmtfi.setString(6, message);
    stmtfi.executeUpdate();
    response.sendRedirect("../customer/productdetails.jsp?id="+res_id+"&id1="+cat_id+"&id2="+menu_id+"&msg=Your feedback added successfully..");


%>

<div class="contact-form spad">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="contact__form__title">
                                        <h2>Product Feedback</h2>
                                    </div>
                                </div>
                            </div>
                            <form action="../customeraction/feedbackaction.jsp?id=<%= res_id %>&id1=<%= cat_id %>&id2=<%= menu_id %>">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <input type="text" readonly="" value="<%= session.getAttribute("username") %>">
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <input type="text" placeholder="enter your email" required="">
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <input type="number"name="rating" placeholder="Enter Rating between 1 to 5" min="1" max="5" required="">
                                    </div>                        
                                    <div class="col-lg-12 text-center">
                                        <textarea placeholder="Your message" name="message" required="" minlength="5" maxlength="240"></textarea>
                                        <% if(username == null) { response.sendRedirect("login.jsp"); } else { %>
                                            <button type="submit" class="site-btn">SEND MESSAGE </button> <% } %>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
