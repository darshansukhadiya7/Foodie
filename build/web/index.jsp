<%-- 
    Document   : index.jsp
    Created on : 21-Mar-2024, 3:44:24 pm
    Author     : darshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    // Check some condition
            boolean condition = true; // for example
            if (condition) {
                response.sendRedirect("customer/index.jsp"); // Redirect to newPage.jsp
            }
        %>
    </body>
</html>
