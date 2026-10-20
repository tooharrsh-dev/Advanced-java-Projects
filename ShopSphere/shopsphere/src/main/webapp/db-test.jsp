
<%@ page import="com.shopsphere.DBConnection" %>
<%@ page import="java.sql.Connection" %>

<html>
<head>
    <title>Database Connection Test</title>
</head>
<body>
    <h2>ShopSphere Database Test</h2>

    <%
        try (Connection con = DBConnection.getConnection()) {
    %>
        <h3 style="color: green;">SUCCESS: MySQL Connected!</h3>
        <p>ShopSphere database se Java successfully connect ho gaya.</p>
    <%
        } catch (Exception e) {
    %>
        <h3 style="color: red;">Connection Failed!</h3>
        <p><%= e.getMessage() %></p>
    <%
        }
    %>
</body>
</html>
