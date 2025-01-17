<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<%@taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach var="p" items="${list}">
	${p.id}：${p.name}：${p.price}<br>
</c:forEach>

<!-- 例1: 配列をループ -->
<ul>
    <c:forEach var="name" items="${names}">
        <li>${name}</li>
    </c:forEach>
</ul>
<!-- 例2: リストをループ -->
<table>
    <c:forEach var="fruit" items="${fruits}">
        <tr><td>${fruit}</td></tr>
    </c:forEach>
</table>
<!-- 例3: begin と end 属性を使用 -->
<c:forEach var="i" begin="1" end="5">
    <p>Number: ${i}</p>
</c:forEach>
<!-- 例4: Mapをループ -->
<table>
    <c:forEach var="entry" items="${capitals}">
        <tr>
            <td>${entry.key}</td><td>${entry.value}</td>
        </tr>
    </c:forEach>
</table>

<!-- 例1: 単純な条件分岐 -->
<c:if test="${isAdmin}">
    <p>管理者メニューが表示されます。</p>
</c:if>
<!-- 例2: 値の比較 -->
<c:if test="${userRole == 'admin'}">
    <p>ようこそ、管理者。</p>
</c:if>
<!-- 3: 複数条件を使用 -->
AND条件（&&）
<c:if test="${userRole == 'admin' && isLoggedIn}">
    <p>管理者メニューが利用可能です。</p>
</c:if>
OR条件（||）
<c:if test="${userRole == 'admin' || userRole == 'editor'}">
    <p>編集メニューが利用可能です。</p>
</c:if>
<!-- 例4: 否定条件 -->
<c:if test="${!isLoggedIn}">
    <p>ログインしてください。</p>
</c:if>
<!-- 例5: 数値の比較 -->
<c:if test="${age >= 18}">
    <p>成人です。</p>
</c:if>
<c:if test="${age < 18}">
    <p>未成年です。</p>
</c:if>
<!-- 3. elseの代替（通常はchooseを使用） -->
<c:if test="${userRole == 'admin'}">
    <p>管理者メニュー</p>
</c:if>
<c:if test="${userRole == 'editor'}">
    <p>編集者メニュー</p>
</c:if>
<c:if test="${userRole != 'admin' && userRole != 'editor'}">
    <p>一般ユーザーメニュー</p>
</c:if>
<!-- nullの扱い -->
<c:if test="${value == null}">
    <p>値がありません。</p>
</c:if>
<!-- (1) test（必須）例: 条件がtrueの場合のみ表示 -->
<c:if test="${userRole == 'admin'}">
    <p>管理者メニューが表示されます。</p>
</c:if>
<!-- (2) var（任意）例: 条件結果を変数に格納 -->
<c:if test="${age >= 18}" var="isAdult">
    <p>このコンテンツは表示されます。</p>
</c:if>
<p>成人: ${isAdult}</p>
<!-- (3) scope（任意）例: 変数をセッションスコープで設定 -->
<c:if test="${userRole == 'admin'}" var="isAdmin" scope="session">
    <p>管理者用のコンテンツを表示します。</p>
</c:if>
<!-- 例: test, var, scopeを組み合わせて利用 -->
<c:if test="${points >= 100}" var="hasReward" scope="request">
    <p>おめでとうございます！ ボーナスポイントが付与されます。</p>
</c:if>
<p>ボーナス対象: ${requestScope.hasReward}</p>
<!-- testのみ使用 -->
<c:if test="${user.isLoggedIn}">
    <p>ログイン済みです。</p>
</c:if>
<!-- varとscopeを使用 -->
<c:if test="${totalPrice > 10000}" var="hasDiscount" scope="request">
    <p>割引が適用されます。</p>
</c:if>
<p>割引対象: ${requestScope.hasDiscount}</p>
<!-- JSTL：choose -->
<!-- 例1: シンプルな条件分岐 -->
<c:choose>
    <c:when test="${userRole == 'admin'}">
        <p>管理者用メニューを表示します。</p>
    </c:when>
    <c:when test="${userRole == 'editor'}">
        <p>編集者用メニューを表示します。</p>
    </c:when>
    <c:otherwise>
        <p>一般ユーザー用メニューを表示します。</p>
    </c:otherwise>
</c:choose>
<!-- 例2: 数値の条件分岐 -->
<c:choose>
    <c:when test="${points >= 90}">
        <p>評価: 優秀</p>
    </c:when>
    <c:when test="${points >= 70}">
        <p>評価: 良好</p>
    </c:when>
    <c:otherwise>
        <p>評価: 要改善</p>
    </c:otherwise>
</c:choose>
<!-- 3. otherwiseの省略 -->
<c:choose>
    <c:when test="${userRole == 'admin'}">
        <p>管理者用メニューを表示します。</p>
    </c:when>
    <c:when test="${userRole == 'editor'}">
        <p>編集者用メニューを表示します。</p>
    </c:when>
</c:choose>









<%@include file="../footer.html" %>
