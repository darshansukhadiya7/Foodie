<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    String msg1 = request.getParameter("msg1");
    String fc = null;
    if(msg1 != null)
    {
            fc = "select * from menu m "
            + "inner join restaurant r on m.restaurant_id = r.restaurant_id "
            + "inner join category c on m.category_id = c.category_id "
            + "where m.active = 'yes' and c.active='yes' and r.active='yes' and c.name ='"+msg1+"'";
    }
    else
    {
            fc = "select * from menu m "
            + "inner join restaurant r on m.restaurant_id = r.restaurant_id "
            + "inner join category c on m.category_id = c.category_id "
            + "where m.active = 'yes' and c.active='yes' and r.active='yes' ";
    }
    PreparedStatement stmtfc = con.prepareStatement(fc);
    ResultSet rsfc = stmtfc.executeQuery();
    String msg = request.getParameter("msg");

%>
<head>
    <style>
        .featured__item__text {
	text-align: center;
	padding-top: 15px;
    }

    .featured__item__text h4 {
            margin-bottom: 10px;
    }

    .featured__item__text h4 a {
            color: #252525;
    }

    .featured__item__text h4 {
            color: #252525;
            font-weight: 700;
    }
    
    .featured__item__text h4 {
            margin-bottom: 10px;
    }
    </style>
</head>
    <body>
        <%@include file="header.jsp" %>
        <% if(msg != null)
        { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= msg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Foodie</h2>
                            <div class="breadcrumb__option">
                                <a href="index.jsp">Home</a>
                                <span>Products</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Featured Section Begin -->
        <section class="featured spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>All Product</h2>
                        </div>
                    </div>
                </div>
                <% int count = 0;
                    while (rsfc.next()) {
                    if (count % 4 == 0) { %>
                    <div class="row featured__filter">
               <% } %>
                    <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                        <div class="featured__item">
                            <div class="featured__item__pic set-bg" data-setbg="<%= "../resimages/productimg/" + rsfc.getString("image") %>">
                                <ul class="featured__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="productdetails.jsp?id=<%= rsfc.getInt("restaurant_id") %>&id1=<%= rsfc.getInt("category_id") %>&id2=<%= rsfc.getInt("menu_id") %>"><i class="fa fa-retweet"></i></a></li>
                                    <% if(username != null) { %>
                                    <li><a  href="../customeraction/addcartitem.jsp?qty=1&id=<%= rsfc.getInt("restaurant_id") %>&id1=<%= rsfc.getInt("category_id") %>&id2=<%= rsfc.getInt("menu_id") %>" ><i class="fa fa-shopping-cart"></i></a></li>
                                    <% } %>
                                </ul>
                            </div>
                            <div class="featured__item__text">
                                <h4><a href="productdetails.jsp?id=<%= rsfc.getInt("restaurant_id") %>&id1=<%= rsfc.getInt("category_id") %>&id2=<%= rsfc.getInt("menu_id") %>"><%= rsfc.getString("name") %></a></h4>
                                <h5>₹<%= rsfc.getInt("price") %></h5>
                            </div>
                        </div>
                    </div>
                <% count++;
                  if (count % 4 == 0) { %>
                    </div>
                <% }
                } %>
                <% if (count % 4 != 0) { %>
             </div>
             <% } %>
        </section>
        <!-- Featured Section End -->
        <%@include file="footer.jsp" %>
        
    </body>
