<%@page import="Connection.ConnectionProvider" %>
<%@page import="java.sql.*" %>


<%
    HttpSession username = request.getSession();
    HttpSession adminname = request.getSession();
    HttpSession restaurantname = request.getSession();
    String uname = request.getParameter("username");
    String pass = request.getParameter("pass");
    
    try
    {
        Connection con = ConnectionProvider.getcon();
        PreparedStatement customer = con.prepareStatement("select * from customer where username=? and pass=?");
        customer.setString(1,uname);
        customer.setString(2,pass);
        ResultSet customerrs = customer.executeQuery();
        
        PreparedStatement admin = con.prepareStatement("select * from admin where username=? and password=?");
        admin.setString(1,uname);
        admin.setString(2,pass);
        ResultSet adminrs = admin.executeQuery();
        
        PreparedStatement restaurant = con.prepareStatement("select * from restaurant where username=? and pass=? and active='yes'");
        restaurant.setString(1,uname);
        restaurant.setString(2,pass);
        ResultSet restaurantrs = restaurant.executeQuery();
        
        if(customerrs.next())
        {
            String msg = request.getParameter("msg");
            if("login".equals(msg))
            {
                username.setAttribute("username", uname);
                adminname.setAttribute("adminname", null);
                restaurantname.setAttribute("restaurantname", null);
                int res_id = Integer.parseInt(request.getParameter("id"));
                int cat_id = Integer.parseInt(request.getParameter("id1"));
                int menu_id = Integer.parseInt(request.getParameter("id2"));
                response.sendRedirect("../customer/productdetails.jsp?id="+res_id+"&id1="+cat_id+"&id2="+menu_id);
            }
            else if("login1".equals(msg))
            {
                int res_id = Integer.parseInt(request.getParameter("id"));
                int cat_id = Integer.parseInt(request.getParameter("id1"));
                int menu_id = Integer.parseInt(request.getParameter("id2"));
                username.setAttribute("username", uname);
                adminname.setAttribute("adminname", null);
                restaurantname.setAttribute("restaurantname", null);
                response.sendRedirect("../customeraction/addcartitem.jsp?msg=product&qty=1&id="+res_id+"&id1="+cat_id+"&id2="+menu_id);
            }
            else
            {
                username.setAttribute("username", uname);
                adminname.setAttribute("adminname", null);
                restaurantname.setAttribute("restaurantname", null);
                response.sendRedirect("../customer/index.jsp");
            }
        }
        else if(adminrs.next())
        {
            
            adminname.setAttribute("adminname", uname);
            restaurantname.setAttribute("restaurantname", null);
            username.setAttribute("username", null);
            response.sendRedirect("../admin/admindashboard.jsp");
        }
        else if(restaurantrs.next())
        {
            restaurantname.setAttribute("restaurantname", uname);
            username.setAttribute("username", null);
            adminname.setAttribute("adminname", null);
            response.sendRedirect("../restaurant/dashboard.jsp");
        }
        else
        {
            response.sendRedirect("../customer/login.jsp?msg=invalid");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>

<%
    String msg1 = request.getParameter("msg");
    if("logout".equals(msg1))
    {
        session.setAttribute("username", null);
    }
%>
