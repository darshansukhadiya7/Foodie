<%@page import="Connection.ConnectionProvider" %>
<%@ page import="java.io.*, java.sql.*, java.nio.file.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Connection con = ConnectionProvider.getcon();
    int res_id = Integer.parseInt(request.getParameter("id"));
    String username = (String)session.getAttribute("username");
    String fc = "select distinct * from category where active = 'yes' and restaurant_id="+res_id;
    PreparedStatement stmtfc = con.prepareStatement(fc);
    ResultSet rsfc = stmtfc.executeQuery();
    

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
    </style>
</head>
<body>
        <%@include file="header.jsp" %>
        
        <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Foodie</h2>
                            <div class="breadcrumb__option">
                                <a href="index.jsp">Home</a>
                                <span>View Categories</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="categories">
        <div class="container">
        <div class="col-lg-12 mt-5">
            <div class="section-title">
                <h2>All Categories</h2>
            </div>
        </div>
        <% int count = 0;
           while (rsfc.next()) {
               if (count % 4 == 0) { %>
                   <div class="row">
               <% } %>

               <div class="col-lg-3 col-md-4 col-sm-6">
                   <div class="featured__item">
                       <div class="featured__item__pic set-bg" data-setbg="<%= "../resimages/categoryimg/" + rsfc.getString("image") %>"></div>
                       <div class="featured__item__text">
                           <h3><a href="viewproduct.jsp?id=<%= rsfc.getInt("restaurant_id") %>&id1=<%= rsfc.getInt("category_id") %>"><b><%= rsfc.getString("name") %></b></a></h3>
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

        <%@include file="footer.jsp" %>
</body>
