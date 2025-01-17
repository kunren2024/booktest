<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<p>検索したいユーザー名を入力してください。</p>
<form action="SearchCust.action" method="post">
<input type="text" name="keyword">
<input type="submit" value="検索">
</form>

<%@include file="../footer.html" %>
