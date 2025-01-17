<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>EL式の例</title>
</head>
<body>
    <h1>EL式の例</h1>

    <h2>1. 暗黙オブジェクト</h2>
    <!-- リクエストパラメータ -->
    <p>リクエストパラメータ（param）: ${param.paramExample}</p>
    <p>ユーザー名: ${param.username}</p>
    
    <c:forEach var="value" items="${paramValues.colors}">
    <p>色: ${value}</p>
	</c:forEach>

    <!-- ヘッダー -->
    <p>ヘッダー値（header）: ${header['Custom-Header']}</p>
    <p>ユーザーエージェント: ${header['User-Agent']}</p>

	<c:forEach var="header" items="${headerValues['Accept-Language']}">
    <p>言語: ${header}</p>
	</c:forEach>

    <!-- クッキー -->
    <p>クッキー値（cookie）: ${cookie.testCookie.value}</p>
    
    
    <!-- スコープ変数 -->    
    <p>ページスコープの値: ${pageScope.someVar}</p>
    <p>リクエストスコープ: ${requestScope.requestScopeVar}</p>
	<p>セッションスコープの値: ${sessionScope.someVar}</p>
    <p>アプリケーションスコープ: ${applicationScope.applicationScopeVar}</p>

    <h2>2. 演算子の例</h2>
    <!-- 算術演算子 -->
    <p>加算: ${10 + 5}</p>
    <p>減算: ${10 - 5}</p>
    <p>乗算: ${10 * 5}</p>
    <p>除算: ${10 / 2}</p>
    <p>剰余: ${10 % 3}</p>

    <!-- 比較演算子 -->
    <p>等しい: ${10 == 10}</p>
    <p>等しくない: ${10 != 5}</p>
    <p>小さい: ${5 < 10}</p>
    <p>大きい: ${10 > 5}</p>
    <p>以下: ${5 <= 5}</p>
    <p>以上: ${10 >= 5}</p>

    <!-- 論理演算子 -->
    <p>論理積: ${true && false}</p>
    <p>論理和: ${true || false}</p>
    <p>否定: ${!true}</p>

    <!-- 特殊演算子 -->
    <p>empty: ${empty ''}</p>
    <p>三項演算子: ${10 > 5 ? '大きい' : '小さい'}</p>

    <h2>3. オブジェクト参照</h2>
    <!-- ダミーオブジェクトの例 -->
    <p>参照例: ${requestScope['requestScopeVar']}</p>
</body>
</html>