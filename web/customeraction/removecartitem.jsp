<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    int cart_id = Integer.parseInt(request.getParameter("id"));
    Connection con = ConnectionProvider.getcon();
    String que = "delete from addtocard where cart_id ="+cart_id;
    PreparedStatement stmt = con.prepareStatement(que);
    stmt.executeUpdate();
    response.sendRedirect("../customer/shoppingcart.jsp");
    
%>