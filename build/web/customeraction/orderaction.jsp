<%@page import="java.util.Random"%>
<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Time" %>


    
<%!
    // Define the method to generate the order ID
    String generateOrderID() {
        Random random = new Random();
        StringBuilder orderId = new StringBuilder();
        for (int i = 0; i < 1; i++) { 
            orderId.append(random.nextInt(1010303203)); 
        }
        return orderId.toString();
    }
    
    String generatecheckoutid() {
        Random random = new Random();
        StringBuilder checkoutid = new StringBuilder();
        for (int i = 0; i < 1; i++) { 
            checkoutid.append(random.nextInt(101010200)); 
        }
        return checkoutid.toString();
    }
%>
    
<%
    Connection con = ConnectionProvider.getcon();
    try
    {
        con.setAutoCommit(false);
        String username = (String)session.getAttribute("username");
        int order_id = Integer.parseInt(generateOrderID());
        int checkout_id = Integer.parseInt(generatecheckoutid());
        int i = 0;
        int customer_id = 0;

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String phno = request.getParameter("phno");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
        String ptype = request.getParameter("ptype");

        String fullname = fname + " " + lname;

        // insert checkout data
        String que_ins_checkout = "insert into checkout(checkout_id,name,pno,email,address,city,state,pincode) values(?,?,?,?,?,?,?,?)";
        PreparedStatement stmtqic = con.prepareStatement(que_ins_checkout);
        stmtqic.setInt(1, checkout_id);
        stmtqic.setString(2, fullname);
        stmtqic.setString(3, phno);
        stmtqic.setString(4, email);
        stmtqic.setString(5, address);
        stmtqic.setString(6, city);
        stmtqic.setString(7, state);
        stmtqic.setString(8, postcode);
        stmtqic.executeUpdate();

        // fetch product data
        String que_fetch_product = "SELECT ca.customer_id, ca.restaurant_id, m.name, m.price, ca.quantity, (m.price * ca.quantity) as total " +
                       "FROM menu m " +
                       "INNER JOIN addtocard ca ON m.menu_id = ca.menu_id " +
                       "WHERE ca.customer_id = (SELECT customer_id FROM customer WHERE username = ?)";
        PreparedStatement stmtqfp = con.prepareStatement(que_fetch_product);
        stmtqfp.setString(1, username);
        ResultSet rs = stmtqfp.executeQuery();
        while(rs.next())
        {
            customer_id = rs.getInt("customer_id");
            int restaurant_id = rs.getInt("restaurant_id");
            String pname = rs.getString("name");
            int price = rs.getInt("price");
            int quantity = rs.getInt("quantity");
            int total = rs.getInt("total");
            i = i + total;
            String que_ins_menu = "insert into order2(order_id,customer_id,restaurant_id,pname,checkout_id,price,quantity,total,status1) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement stmtqim = con.prepareStatement(que_ins_menu);
            stmtqim.setInt(1, order_id);
            stmtqim.setInt(2, customer_id);
            stmtqim.setInt(3, restaurant_id);
            stmtqim.setString(4, pname);
            stmtqim.setInt(5, checkout_id);
            stmtqim.setInt(6, price);
            stmtqim.setInt(7, quantity);
            stmtqim.setInt(8, total);
            stmtqim.setString(9, "Pending");
            stmtqim.executeUpdate();
        }
        
        // insert order total data
            String order_total_ins = "INSERT INTO order_total (order_id, order_total_price, date, time, customer_id) VALUES (?, ?, CURDATE(), CURTIME(), ?)";
            PreparedStatement stmtoti = con.prepareStatement(order_total_ins);
            stmtoti.setInt(1, order_id);
            stmtoti.setString(2, Integer.toString(i));
            stmtoti.setInt(3, customer_id);
            stmtoti.executeUpdate();
        
        // remove data into cart
        String que_rem_cart_data = "delete from addtocard where customer_id=(select customer_id from customer where username=?)";
        PreparedStatement stmtqrcd = con.prepareStatement(que_rem_cart_data);
        stmtqrcd.setString(1, username);
        stmtqrcd.executeUpdate();
        
        con.commit();
        response.sendRedirect("../customer/orders.jsp");
        
        
    }
    catch(Exception e)
    {
        con.rollback();
        out.println("error : "+e);
    }
    
    
%>