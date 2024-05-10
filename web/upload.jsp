<%@page import="java.nio.file.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@page import="Connection.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
        Connection con = ConnectionProvider.getcon();
        String msg = request.getParameter("msg");
        String restaurantname = (String)session.getAttribute("restaurantname");
        PreparedStatement stmtid = con.prepareStatement("SELECT restaurant_id FROM restaurant WHERE username = ?");
        stmtid.setString(1, restaurantname);
        ResultSet rsid = stmtid.executeQuery();
        int id = -1;
        int catid = -1;
        if(rsid.next())
        {
            id = rsid.getInt("restaurant_id");
        }
        if("radddetails".equals(msg))
        {
            try
            {
                String rname = request.getParameter("rname");
                String rabout = request.getParameter("rabout");
                String rusername = request.getParameter("rusername");
                String rimg = request.getParameter("rimg");
                String radd = request.getParameter("raddress");
                String rcity = request.getParameter("rcity");
                String rstate = request.getParameter("rstate");
                String rphno = request.getParameter("rphone");
                String remail = request.getParameter("remail");
                String ractive = "yes";

                String queer = "select username from restaurant where username = '"+rusername+"'";
                PreparedStatement stmter = con.prepareStatement(queer);
                ResultSet rser = stmter.executeQuery();
                
                String queer1 = "select name from restaurant where name = '"+rname+"'";
                PreparedStatement stmter1 = con.prepareStatement(queer1);
                ResultSet rser1 = stmter1.executeQuery();
                if(rser.next())
                {
                    response.sendRedirect("./restaurant/resprofile.jsp?msg=Username exist...");
                }
                else if(rser1.next())
                {
                    response.sendRedirect("./restaurant/resprofile.jsp?msg=Restaurant name exist...");
                }
                else
                {
                    String editdet = "UPDATE restaurant SET username = ?,name = ?,description = ?,image = ?,email = ?,phno = ?,address = ?,city = ?,state = ?,active = ? WHERE restaurant_id = ?";
                    PreparedStatement stmt = con.prepareStatement(editdet);
                    stmt.setString(1, rusername);
                    stmt.setString(2, rname);
                    stmt.setString(3, rabout);
                    stmt.setString(4, rimg); 
                    stmt.setString(5, remail);
                    stmt.setString(6, rphno);
                    stmt.setString(7, radd);
                    stmt.setString(8, rcity);
                    stmt.setString(9, rstate);
                    stmt.setString(10, ractive);
                    stmt.setInt(11, id);
                    int r2 = stmt.executeUpdate();
                    if(r2>0)
                    {
                        session.setAttribute("restaurantname", rusername);
                        response.sendRedirect("./restaurant/resprofile.jsp?msg=Update data Successfully...");
                    }
                    else
                    {
                        response.sendRedirect("./restaurant/resprofile.jsp?msg=Not update data Successfully...");
                    }
                }  
            }
            catch(Exception e)
            {
                out.println("error :  "+e.getMessage());
            }
        }
        // add category action
        else if("addcategory".equals(msg))
        {
            try
            {
                String catname = request.getParameter("catname");
                String catimg = request.getParameter("catimg");
                String catdes = request.getParameter("catdes");
                String catactive = request.getParameter("catactive");
                
                String quecf = "select name from category where name=? and restaurant_id=?";
                PreparedStatement stmtcf = con.prepareStatement(quecf);
                stmtcf.setString(1, catname);
                stmtcf.setInt(2, id);
                ResultSet rscf = stmtcf.executeQuery();
                if(rscf.next())
                {
                    response.sendRedirect("./restaurant/addcategory.jsp?msg=Category Exist..");
                }
                else
                {
                    String addcat = "insert into category(restaurant_id,name,image,description,active) values(?,?,?,?,?);";
                    PreparedStatement stmt = con.prepareStatement(addcat);
                    stmt.setInt(1, id);
                    stmt.setString(2, catname);
                    stmt.setString(3, catimg);
                    stmt.setString(4, catdes);
                    stmt.setString(5, catactive);
                    int r = stmt.executeUpdate();
                    if(r>0)
                    {
                        response.sendRedirect("./restaurant/addcategory.jsp?msg=Category Added..");
                    }
                    else
                    {
                        response.sendRedirect("./restaurant/addcategory.jsp?msg=Category not Added..");
                    }
                }
            }
            catch(Exception e)
            {
                out.println("error :  "+e.getMessage());
            }
        }
        // add product restaurant wise action
        else if("addproduct".equals(msg))
        {
            try
            {
                
                String pname = request.getParameter("pname");
                String pcat = request.getParameter("catname");
                String pimg = request.getParameter("pimg");
                String pdes = request.getParameter("pdes");
                String pactive = request.getParameter("pactive");
                int pprice = Integer.parseInt(request.getParameter("pprice"));
                
                String fpro = "select name from menu where name=? and restaurant_id=?";
                PreparedStatement stmtfpro = con.prepareStatement(fpro);
                stmtfpro.setString(1, pname);
                stmtfpro.setInt(2, id);
                ResultSet rsfpro = stmtfpro.executeQuery();
                
                if(rsfpro.next())
                {
                    response.sendRedirect("./restaurant/additem.jsp?msg=Product exist..");
                }
                else
                {
                    PreparedStatement stmtcatid = con.prepareStatement("SELECT category_id FROM category WHERE restaurant_id = ? and name=?");
                    stmtcatid.setInt(1, id);
                    stmtcatid.setString(2, pcat);
                    ResultSet rscatid = stmtcatid.executeQuery();
                    if(rscatid.next())
                    {
                        catid = rscatid.getInt("category_id");
                    }
                        String productque = "insert into menu(restaurant_id,category_id,name,image,description,price,active) values(?,?,?,?,?,?,?)";
                        PreparedStatement stmtproduct = con.prepareStatement(productque);
                        stmtproduct.setInt(1, id);
                        stmtproduct.setInt(2, catid);
                        stmtproduct.setString(3, pname);
                        stmtproduct.setString(4, pimg);
                        stmtproduct.setString(5, pdes);
                        stmtproduct.setInt(6, pprice);
                        stmtproduct.setString(7, pactive);
                        int r = stmtproduct.executeUpdate();
                        if(r>0)
                        {
                            response.sendRedirect("./restaurant/additem.jsp?msg=Product Added..");
                        }
                        else
                        {
                            response.sendRedirect("./restaurant/additem.jsp?msg=Product not Added..");
                        }
                    
                }
                
            }
            catch(Exception e)
            {
                out.println("error :  "+e.getMessage());
            }
        }
        // category edit action
        else if("catedit".equals(msg))
        {
            try
            {
                int cat_id = Integer.parseInt(request.getParameter("catidu"));
                String catname = request.getParameter("catname");
                String catimg = request.getParameter("catimg");
                String catdes = request.getParameter("catdes");
                String catactive = request.getParameter("catactive");
                
                    String updatecat = "update category set name = ?, image = ?, description = ?, active = ? where restaurant_id = ? and category_id = ?";
                    PreparedStatement stmtupcat = con.prepareStatement(updatecat);
                    stmtupcat.setString(1, catname);
                    stmtupcat.setString(2, catimg);
                    stmtupcat.setString(3, catdes);
                    stmtupcat.setString(4, catactive);
                    stmtupcat.setInt(5, id);
                    stmtupcat.setInt(6, cat_id);
                    stmtupcat.executeUpdate();
                    response.sendRedirect("./restaurant/editcatdetail.jsp?msg=Edit category successfully..&id="+cat_id+"&id1="+id);
            }   
            catch(Exception e)
            {
                out.println("error :  "+e.getMessage());
            }
        }
        // product edit action
        else if("editproducts".equals(msg))
        {
            try
            {
                int cat_id = Integer.parseInt(request.getParameter("id1"));
                int pro_id = Integer.parseInt(request.getParameter("id2")); 
                
                int cid = Integer.parseInt(request.getParameter("cat_name"));
                String pname = request.getParameter("proname");
                String pimg = request.getParameter("proimg");
                String pdes = request.getParameter("prodes");
                int pprice = Integer.parseInt(request.getParameter("proprice"));
                String pactive = request.getParameter("proactive");
                
                String queep = "select name from menu where name=? and category_id = ? and restaurant_id = ?";
                PreparedStatement stmtep = con.prepareStatement(queep);
                stmtep.setString(1, pname);
                stmtep.setInt(2, cid);
                stmtep.setInt(3, id);
                ResultSet rsep = stmtep.executeQuery();
                if(rsep.next())
                {
                    response.sendRedirect("./restaurant/editproductdetails.jsp?msg=product exist..&id1="+id+"&id="+cat_id+"&id2="+pro_id);
                }
                else
                {
                    String puque = "update menu set category_id=?,name=?,image=?,description=?,price=?,active=? where restaurant_id=? and menu_id=?";
                    PreparedStatement psup = con.prepareStatement(puque);
                    psup.setInt(1, cid);
                    psup.setString(2, pname);
                    psup.setString(3, pimg);
                    psup.setString(4, pdes);
                    psup.setInt(5, pprice);
                    psup.setString(6, pactive);
                    psup.setInt(7, id);
                    psup.setInt(8, pro_id);
                    psup.executeUpdate();
                    response.sendRedirect("./restaurant/editproductdetails.jsp?msg=Edit product successfully...&id1="+id+"&id="+cat_id+"&id2="+pro_id);
                }
                
            }
            catch(Exception e)
            {
                out.println("error :  "+e.getMessage());
            }
        }
       
        
    
%>