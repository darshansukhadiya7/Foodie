<%@page import="Connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phno = request.getParameter("phno");
    String username = request.getParameter("username");
    String password = request.getParameter("pass");
    
    Connection con = ConnectionProvider.getcon();
    try
    {
        String queu = "select username from customer where username='"+username+"'";
        PreparedStatement psu = con.prepareStatement(queu);
        ResultSet rsu = psu.executeQuery();
        if(rsu.next())
        {
            response.sendRedirect("../customer/register.jsp?msg=exist");
        }
        else
        {
            PreparedStatement ps = con.prepareStatement("insert into customer (username,pass,firstname,lastname,email,phno) values(?,?,?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fname);
            ps.setString(4, lname);
            ps.setString(5, email);
            ps.setString(6, phno);
            int r = ps.executeUpdate();
            if(r>0)
            {
                response.sendRedirect("../customer/login.jsp");
            }
            else
            {
                response.sendRedirect("../customer/register.jsp?msg=invalidquery");
            }
        }
    }
    catch (Exception e)
    {
        out.println(e);
    }
%>
