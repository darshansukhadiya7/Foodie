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
    int qty = Integer.parseInt(request.getParameter("qty"));
    
    String quec = "select customer_id from customer where username='" + username + "'";
    PreparedStatement stmtc = con.prepareStatement(quec);
    ResultSet rsc = stmtc.executeQuery();   
    while(rsc.next())
    {
        customer_id = rsc.getInt("customer_id");
    }
    
    String queaddtocart = "insert into addtocard(customer_id,restaurant_id,category_id,menu_id,quantity) values(?,?,?,?,?)";
    PreparedStatement stmtatc = con.prepareStatement(queaddtocart);
    stmtatc.setInt(1, customer_id);
    stmtatc.setInt(2, res_id);
    stmtatc.setInt(3, cat_id);
    stmtatc.setInt(4, menu_id);
    stmtatc.setInt(5, qty);
    stmtatc.executeUpdate();
    response.sendRedirect("../customer/productdetails.jsp?id="+res_id+"&id1="+cat_id+"&id2="+menu_id+"&msg=Product added in cart");
%>
