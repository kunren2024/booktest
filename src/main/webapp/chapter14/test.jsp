<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.naming.InitialContext, javax.sql.DataSource, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
</head>
<body>
    <select name="products">
        <%
                InitialContext ic = new InitialContext();
                DataSource ds = (DataSource) ic.lookup("java:/comp/env/jdbc/book");
                Connection con = ds.getConnection();

                PreparedStatement st = con.prepareStatement("select * from product");
                ResultSet rs = st.executeQuery();

                while (rs.next()) {
                    out.println("<option>");
                    out.println(rs.getString("name"));
                    out.println("</option>");
                }

                st.close();
                con.close();

        %>
    </select>
</body>
</html>
