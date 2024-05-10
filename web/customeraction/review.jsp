<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Connection con = ConnectionProvider.getcon();
    try
    {
        con.setAutoCommit(false);
        int res_id = Integer.parseInt(request.getParameter("resid"));
        int cat_id = Integer.parseInt(request.getParameter("catid"));
        int menu_id = Integer.parseInt(request.getParameter("menuid"));
        String username = request.getParameter("uname");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String message = request.getParameter("message");
        int customer_id1 = 0;
        
        // fetch customer_id
        String queu = "select customer_id from customer where username = ?";
        PreparedStatement stmtu = con.prepareStatement(queu);
        stmtu.setString(1, username);
        ResultSet rsu = stmtu.executeQuery();
        if(rsu.next())
        {
            customer_id1 = rsu.getInt("customer_id");
        }
        
        //insert review 
        String quei = "insert into review(customer_id,restaurant_id,category_id,menu_id,rating,message) values(?,?,?,?,?,?)";
        PreparedStatement stmti = con.prepareStatement(quei);
        stmti.setInt(1, customer_id1);
        stmti.setInt(2, res_id);
        stmti.setInt(3, cat_id);
        stmti.setInt(4, menu_id);
        stmti.setInt(5, rating);
        stmti.setString(6, message);
        int r = stmti.executeUpdate();
        response.sendRedirect("../customer/productdetails.jsp?msg=Feedback Submited..&id="+res_id+"&id1="+cat_id+"&id2="+menu_id);
        con.commit();
    }
    catch(Exception e)
    {
        con.rollback();
        out.println("error :- "+e);
    }
%>
