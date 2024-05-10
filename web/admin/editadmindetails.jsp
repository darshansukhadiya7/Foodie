<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    Connection con = ConnectionProvider.getcon();
    String msg = null;
    msg = request.getParameter("msg");
    String name = (String)session.getAttribute("adminname");
    try
    {
        con.setAutoCommit(false);
        if("editdetails".equals(msg))
        {
            int aid = Integer.parseInt(request.getParameter("aid"));
            String aname = request.getParameter("aname");
            String ausername = request.getParameter("ausername");
            String aphno = request.getParameter("aphone");
            String aemail = request.getParameter("aemail");

            String que = "select username from admin where username='"+ausername+"'";
            PreparedStatement stmtq = con.prepareStatement(que);
            ResultSet rsq = stmtq.executeQuery();
            if(rsq.next())
            {
                response.sendRedirect("adminprofile.jsp?msg=Username exist...");
            }
            else
            {
                String queed = "update admin set username = ?,email = ?,phno = ?,name = ? where admin_id = ?";
                PreparedStatement stmted = con.prepareStatement(queed);
                stmted.setString(1, ausername);
                stmted.setString(2, aemail);
                stmted.setString(3, aphno);
                stmted.setString(4, aname);
                stmted.setInt(5, aid);
                stmted.executeUpdate();
                con.commit();
                session.setAttribute("adminname", ausername);
                response.sendRedirect("adminprofile.jsp?msg=Profile Updated..");
            }
        }
    }
    catch(Exception e)
    {
        con.rollback();
        out.println("error :- "+e);
    }


    
    
 

%>
