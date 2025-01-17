<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.naming.InitialContext, javax.sql.DataSource, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<%@include file="../header.html" %>

<p>検索キーワードを入力してください。</p>
<form action="search" method="post">
<!-- <input type="text" name="keyword"> -->
<select name="keyword">
<option></option>
<!-- <option>まぐろ</option> -->
<!-- <option>サーモン</option> -->
<!-- <option>えび</option> -->
<%
   out.println("");

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
<select name="priceRange">
  <option value=""></option>
  <option value="100-200">100-200円</option>
  <option value="200-300">200-300円</option>
  <option value="300-400">300-400円</option>
  <!-- 他の範囲も追加 -->
</select>

<input type="submit" value="検索">
</form>

<%@include file="../footer.html" %>
