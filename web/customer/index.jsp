<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Connection con = ConnectionProvider.getcon();
    String username = (String)session.getAttribute("username");
    String fc = "select c.* from category c "
            + "inner join restaurant r on c.restaurant_id = r.restaurant_id "
            + "where c.active='yes' and r.active='yes' limit 7";
    PreparedStatement stmtfc = con.prepareStatement(fc);
    ResultSet rsfc = stmtfc.executeQuery();
    
    String fr = "select * from restaurant where active='yes'";
    PreparedStatement stmtfr = con.prepareStatement(fr);
    ResultSet rsfr = stmtfr.executeQuery();

%>
<head>
    <style>
        .featured__item__text {
	text-align: center;
	padding-top: 15px;
    }

    .featured__item__text h3 {
            margin-bottom: 10px;
    }

    .featured__item__text h3 a {
            color: #252525;
    }

    .featured__item__text h3 {
            color: #252525;
            font-weight: 700;
    }
    .featured__item {
    text-align: center; /* Center align content */
    margin-bottom: 30px; /* Adjust as needed */
}

.featured__item__pic {
    height: 300px; /* Adjust height as needed */
    width: 100%; /* Ensure full width */
    background-size: cover; /* Cover the entire container */
    background-position: center; /* Center the background image */
}

.featured__item__text {
    padding: 20px 0; /* Add padding to the text container */
}

    </style>
</head>
    <body>
        <%@include file="header.jsp" %>
        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>All Category</span>
                            </div>
                            <% while(rsfc.next()) { %>
                            <ul>
                                <li><a href="products.jsp?msg1=<%= rsfc.getString("name") %>"><%= rsfc.getString("name") %></a></li>
                            </ul>
                            <% } %>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="#">
                                    <div class="hero__search__categories">
                                        All Categories
                                        <span class="arrow_carrot-down"></span>
                                    </div>
                                    <input type="text" placeholder="What do yo u need?">
                                    <button type="submit" class="site-btn">SEARCH</button>
                                </form>
                            </div>
                            <div class="hero__search__phone">
                                <div class="hero__search__phone__icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="hero__search__phone__text">
                                    <h5>+91 9999999999</h5>
                                    <span>support 24/7 time</span>
                                </div>
                            </div>
                        </div>
                        <div class="hero__item set-bg" data-setbg="../img/hero/banner.jpg">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="categories">
            <div class="container">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>All Restaurant</h2>
                    </div>
                </div>
                <% int count = 0; while (rsfr.next()) { 
                    if (count % 4 == 0) { %>
                    <div class="row">
                <% } %>
                
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <div class="featured__item__pic" style="background-image: url('<%= "../resimages/resimageslogo/" + rsfr.getString("image") %>');"></div>
                        <div class="featured__item__text">
                            <h3><a href="viewcategory.jsp?id=<%= rsfr.getInt("restaurant_id") %>"><b><%= rsfr.getString("name") %></b></a></h3>
                        </div>
                    </div>
                </div>


                   
                
                <% count++;
                    if (count % 4 == 0) { 
                %>
                </div> 
                <% } } %>
                <% if (count % 4 != 0) { %>
                </div> 
                <% } %>
            <div>
        </section>



        <%@include file="footer.jsp" %>
    </body>
