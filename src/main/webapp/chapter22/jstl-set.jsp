<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="message" value="Hello" />
<p>message : ${message}</p>

<c:set var="message2">Welcome</c:set>
<p>message2 : ${message2}</p>

<c:set var="result" value="${1+2}" />
<p>result : ${result}</p>

<jsp:useBean id="product" class="bean.Product" />
<c:set target="${product}" property="name" value="さんま" />
<p>product.name : ${product.name}</p>

<!--
下記のuseBeanに対するEclipseの警告を消すためには、
[ウィンドウ]メニュー->[設定]->[Java]->[コンパイラー]->[エラー/警告]->[総称型]->[raw型の使用]
を[無視]に設定してください。
-->
<jsp:useBean id="map" class="java.util.HashMap" />
<c:set target="${map}" property="apple" value="りんご" />
<p>map.apple : ${map.apple}</p>


<c:set var="message" value="Hello" />
<p>message:${message} </p>

<c:remove var="message" />
<p>message:${message} </p>
-----
<c:forTokens items="apple,banana,cherry" delims="," var="fruit">
    <p>${fruit}</p>
</c:forTokens>
-----
<c:forTokens items="dog;cat:bird" delims=";:" var="animal">
    <p>${animal}</p>
</c:forTokens>
-----
<c:forTokens items="red,green,blue" delims="," var="color" varStatus="status">
    <p>${status.index}: ${color}</p>
</c:forTokens>
-----
<%-- <c:forTokens items="黒,青,赤,緑,黄,白" delims="," var="color"> --%>
<%--     <p>${color}</p> --%>
<%-- </c:forTokens> --%>
-----
<c:forTokens items="red,green,blue" delims="," var="colors" varStatus="status" begin="2" end="15">
    <p>${status.index}: ${colors}</p>
</c:forTokens>

<c:import url="test.jsp" />

<%-- <c:import url="https://www.google.co.jp" var="importedContent" charEncoding="UTF-8" /> --%>
<%-- <c:out value="${importedContent}" /> --%>

<%-- <c:import url="/chapter21/el.jsp" var="responseData"> --%>
<%--     <c:param name="id" value="12345" /> --%>
<%--     <c:param name="name" value="view" /> --%>
<%--     <c:param name="price" value="500" />    --%>
<%-- </c:import> --%>
<%-- <c:out value="${responseData}" /> --%>

<%-- <c:redirect url="https://yahoo.co.jp" /> --%>

<!-- <form action="select" method="post"> -->
<!-- <select name="count"> -->
<!-- 	<option value="1">1</option> -->
<!-- 	<option value="2">2</option> -->
<!-- 	<option value="3">3</option> -->
<!-- 	<option value="4">4</option> -->
<!-- 	<option value="5">5</option> -->
<!-- </select> -->
<!-- </form> -->

<c:url value="https://www.google.co.jp/search" var="searchUrl" >
    <c:param name="q" value="neko" />

</c:url>
<a href="${searchUrl}">nekoを探す</a><p>


<b>JSTLの c:catch タグ</b><br>
1. 例外をキャッチして変数に格納
<c:catch var="exception">
    <c:set var="result" value="${1 / 0}" />
</c:catch>

<c:if test="${not empty exception}">
    <p>例外が発生しました: ${exception.message}</p>
</c:if>

2. 例外が発生しても処理を続行
<c:catch var="exception1">
    <c:set var="value" value="${10 / 0}" />
</c:catch>

<p>続行します: 例外がキャッチされました。</p>
3. 例外を無視
<c:catch>
    <c:set var="value" value="${5 / 0}" />
</c:catch>

<p>例外はキャッチされましたが、処理を続行します。</p>

4. 複雑な処理での例外キャッチ
<c:catch var="exception">
    <c:forEach var="item" items="${null}">
        <p>${item}</p>
    </c:forEach>
</c:catch>

<c:if test="${not empty exception}">
    <p>エラーが発生しました: ${exception.message}</p>
</c:if>

<p>
<c:set var="message" value="a<b && a>c"/>
<c:out value="${message }" />
<p>


<b>fmt:formatNumberタグ</b><p>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
1. 単純な数値フォーマット
<fmt:formatNumber value="12345.6789" /><p>
<!-- 結果: 12,345.679 -->
2. 通貨フォーマット
<fmt:setLocale value="ja-JP"/>
<fmt:formatNumber value="12345.6789" type="currency" /><p>
<!-- 結果: $12,345.68 （ロケールに基づく） -->
3. パーセントフォーマット
<fmt:formatNumber value="0.875" type="percent" /><p>
<!-- 結果: 87% -->
4. カスタムパターン
<fmt:formatNumber value="12345.6789" pattern="#,##0.00" /><p>
<!-- 結果: 12,345.68 -->
5. 小数点桁数の制限
<fmt:formatNumber value="12345.6789" maxFractionDigits="3" /><p>
<!-- 結果: 12,345.68 -->
6. 結果を変数に格納
<fmt:formatNumber value="12345.6789" var="formattedValue" />
<p>フォーマットされた値: ${formattedValue}</p>

<b>fmt:formatDateタグ</b><p>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    // 現在の日時を設定
    java.util.Date now = new java.util.Date();
    request.setAttribute("now", now);
%>
1. 単純な日付フォーマット
<fmt:formatDate value="${now}" /></p>
<!-- 結果: 2024/12/23（ロケールによる） -->
2. 日付と時刻の両方
<fmt:formatDate value="${now}" type="both" /></p>
<!-- 結果: 2024/12/23 10:30:45（ロケールによる） -->
3. スタイル指定（dateStyle と timeStyle）
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="short" /></p>
<!-- 結果: 2024年12月23日 月曜日 10:30 -->
4. カスタムフォーマット（pattern）
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /><p>
<!-- 結果: 2024-12-23 10:30:45 -->
5. タイムゾーンの指定
<fmt:formatDate value="${now}" type="both" timeZone="Asia/Tokyo" /><p>
<!-- 結果: タイムゾーンに基づいた日付と時刻 -->
6. 結果を変数に保存
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="formattedDate" />
フォーマットされた日付: ${formattedDate}</p>

<b>functionsタグについて</b><p>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
1. 文字列が含まれるかを判定 (fn:contains)
<c:if test="${fn:contains('hello world', 'world')}">
含まれています。</p>
</c:if><p>
2. 大文字小文字を無視して判定 (fn:containsIgnoreCase)
<c:if test="${fn:containsIgnoreCase('Hello', 'hello')}">
含まれています（大文字小文字無視）。</p>
</c:if><p>
3. 文字列の長さを取得 (fn:length)
文字列の長さ: ${fn:length('abcdef')}</p>
4. 文字列の一部を置き換え (fn:replace)
置換後の文字列: ${fn:replace('hello world', 'world', 'JSTL')}</p>
5. 文字列の一部を切り出す (fn:substring)
切り出し: ${fn:substring('abcdef', 1, 4)}</p>
6. 配列を結合 (fn:join)
<%
String[] fruits = {"りんご", "みかん", "バナナ"};
pageContext.setAttribute("fruits", fruits);
%>
${fn:join(fruits, '、')}</p>

<%@ page import="java.util.List, java.util.ArrayList" %>
<%
	List<String> fruitsList = new ArrayList<>();
	fruitsList.add("りんご");
	fruitsList.add("みかん");
	fruitsList.add("バナナ");
	String[] fruitsArray = fruitsList.toArray(new String[0]);
	pageContext.setAttribute("fruits", fruitsArray);
%>
<c:out value="${fruits}" /><p>

${fn:join(fruits, '、')}








<%@include file="../footer.html" %>
