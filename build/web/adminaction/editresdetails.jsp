<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String msg = null;
    msg = request.getParameter("msg");
    
    try
    {
        if("add".equals(msg))
        {
            int rid = Integer.parseInt(request.getParameter("id"));
            con.setAutoCommit(false);
            String status = request.getParameter("status");
            String queru = "update restaurant set active = ? where restaurant_id = ?";
            PreparedStatement stmtru = con.prepareStatement(queru);
            stmtru.setString(1, status);
            stmtru.setInt(2, rid);
            stmtru.executeUpdate();
            response.sendRedirect("../admin/editresdetails.jsp?msg=Status Updated..&id="+rid);
            con.commit();
        }
        else if("res".equals(msg))
        {
            con.setAutoCommit(false);
            String username = request.getParameter("username");
            String pass = request.getParameter("pass");
            String status = request.getParameter("status");
            
            String quear = "select username from restaurant where username='"+username+"'";
            PreparedStatement stmtar = con.prepareStatement(quear);
            ResultSet rsar = stmtar.executeQuery();
            if(rsar.next())
            {
                response.sendRedirect("../admin/addrestaurant.jsp?msg=Username exist..");
            }
            else
            {
                String quera = "insert into restaurant(username,pass,active) values(?,?,?)";
                PreparedStatement stmtra = con.prepareStatement(quera);
                stmtra.setString(1, username);
                stmtra.setString(2, pass);
                stmtra.setString(3, status);
                stmtra.executeUpdate();
                response.sendRedirect("../admin/addrestaurant.jsp?msg=Restaurant added..");
                con.commit();
            }
        }
    }
    catch(Exception e)
    {
        con.rollback();
        out.println("error : "+e);
    }

%>
