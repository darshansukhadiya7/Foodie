    <%@page import="java.nio.file.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@page import="Connection.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
        Connection con = ConnectionProvider.getcon();
        String msg = request.getParameter("msg");
        String restaurantname = (String)session.getAttribute("restaurantname");
        int cat_id = Integer.parseInt(request.getParameter("id"));
        
        if("rcat".equals(msg))
        {
            try
            {
            
                // delete review related product
                String quedrc = "delete from review where category_id = ? and restaurant_id = (select restaurant_id from restaurant where username = ?)";
                PreparedStatement stmtdc = con.prepareStatement(quedrc); 
                stmtdc.setInt(1, cat_id);
                stmtdc.setString(2, restaurantname);
                stmtdc.executeUpdate();
                
                // delete product record
                String rpro = "delete from menu where category_id=? and restaurant_id=(select restaurant_id from restaurant where username=?)";
                PreparedStatement stmtrpro = con.prepareStatement(rpro);
                stmtrpro.setInt(1, cat_id);
                stmtrpro.setString(2, restaurantname);
                stmtrpro.executeUpdate();
                
                // delete addtocard record
                String rap = "delete from addtocard where category_id=? and restaurant_id=(select restaurant_id from restaurant where username=?)";
                PreparedStatement psrap = con.prepareStatement(rap);
                psrap.setInt(1, cat_id);
                psrap.setString(2, restaurantname);
                psrap.executeUpdate();
                
                //delete category record
                String rcat = "delete from category where category_id=? and restaurant_id=(select restaurant_id from restaurant where username=?)";
                PreparedStatement stmtrcat = con.prepareStatement(rcat);
                stmtrcat.setInt(1, cat_id);
                stmtrcat.setString(2, restaurantname);               
                stmtrcat.executeUpdate();
                String msg11 = "Category deleted successfully..";
                response.sendRedirect("./restaurant/viewcategory.jsp?msg="+msg11);

                
            }
            catch(Exception e)
            {
                out.println("error :  "+e.getMessage());
            }
        }
        else if("rpro".equals(msg))
        {
            try
            {
                int menu_id = Integer.parseInt(request.getParameter("id1"));
                String quedr = "delete from review where category_id=? and menu_id=? and restaurant_id=(select restaurant_id from restaurant where username=?)";
                PreparedStatement stmtdr = con.prepareStatement(quedr);
                stmtdr.setInt(1, cat_id);
                stmtdr.setInt(2, menu_id);
                stmtdr.setString(3, restaurantname);
                stmtdr.executeUpdate();
                
                // delete addtocard record
                String rap = "delete from addtocard where category_id=? and restaurant_id=(select restaurant_id from restaurant where username=?)";
                PreparedStatement psrap = con.prepareStatement(rap);
                psrap.setInt(1, cat_id);
                psrap.setString(2, restaurantname);
                psrap.executeUpdate();
                
                // delete poducts record
                String rpro = "delete from menu where category_id=? and menu_id = ? and restaurant_id=(select restaurant_id from restaurant where username=?)";
                PreparedStatement stmtrpro = con.prepareStatement(rpro);
                stmtrpro.setInt(1, cat_id);
                stmtrpro.setInt(2, menu_id);
                stmtrpro.setString(3, restaurantname);
                stmtrpro.executeUpdate();
                
                response.sendRedirect("./restaurant/viewproducts.jsp?msg=Product deleted successfully..&id="+cat_id);
                
            }
            catch(Exception e)
            {
                out.println("error :  "+e.getMessage());
            }
        
        }
%>