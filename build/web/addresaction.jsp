<%@page import="java.nio.file.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@page import="Connection.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Connection con = ConnectionProvider.getcon();
    try
    {
        String name = request.getParameter("rname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phno = request.getParameter("phno");
        String des = request.getParameter("des");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String status = "yes";
        
        
        String quer = "select username, name from restaurant";
        PreparedStatement psr = con.prepareStatement(quer);
        ResultSet rsr = psr.executeQuery();
        if(rsr.next())
        {
            String rname = rsr.getString("name");
            String uname = rsr.getString("username");
            if(rname.equals(name))
            {
                response.sendRedirect("./customer/addres.jsp?msg=Restaurant name exist...");
            }
            else if(uname.equals(username))
            {
                response.sendRedirect("./customer/addres.jsp?msg=Username already exist...");
            }
            else
            {
                String quear = "insert into restaurant(username,pass,name,description,email,phno,address,city,state,active) value(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement stmtar = con.prepareStatement(quear);
                stmtar.setString(1, username);
                stmtar.setString(2, password);
                stmtar.setString(3, name);
                stmtar.setString(4, des);
                stmtar.setString(5, email);
                stmtar.setString(6, phno);
                stmtar.setString(7, address);
                stmtar.setString(8, city);
                stmtar.setString(9, state);
                stmtar.setString(10, status);
                stmtar.executeUpdate();
                response.sendRedirect("./customer/addres.jsp?msg=Restaurant Added...");
            }
        }

    }
    catch(Exception e)
    {
        out.println("error :- "+e);
    }
%>
