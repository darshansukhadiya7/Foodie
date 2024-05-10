<%@page import="java.nio.file.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@page import="Connection.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Connection con = ConnectionProvider.getcon();
    try
    {
        con.setAutoCommit(false);
        int order_id = Integer.parseInt(request.getParameter("id"));
        int checkout_id = Integer.parseInt(request.getParameter("id1"));
        String pname = request.getParameter("pname");
        String status = request.getParameter("status");
        String queo = "update order2 set status1 = ? where order_id = ? and pname = ? and checkout_id = ?";
        PreparedStatement stmto = con.prepareStatement(queo);
        stmto.setString(1, status);
        stmto.setInt(2, order_id);
        stmto.setString(3, pname);
        stmto.setInt(4, checkout_id);
        stmto.executeUpdate();
        response.sendRedirect("./restaurant/vieworderdetails.jsp?msg=Status Updated...&id="+checkout_id+"&pname='"+pname+"'&id2="+order_id);
        con.commit();
    }
    catch(Exception e)
    {
        con.rollback();
        out.println("error : "+e);   
    }
%>
