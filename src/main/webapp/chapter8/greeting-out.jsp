<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<% request.setCharacterEncoding("UTF-8"); %>
 <h1>ようこそ！</h1>
<p>こんにちは、<%=request.getParameter("user") %>さん！</p>

<%@include file="../footer.html" %>
