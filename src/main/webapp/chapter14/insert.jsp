
<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html"%>
<p>追加する商品を入力してください。</p>
<form action="insert" method="post" id="insertForm">
	商品名<input type="text" name="name"  id="name"> 価格 <input type="text" name="price"> 産地 <input type="text" name="area"> <input type="submit" value="追加">
</form>


<p>削除する商品IDを入力してください。</p>
<form action="delete" method="post">
    商品ID<input type="text" name="id"> <input type="submit" value="削除">
</form>

<p>更新する商品の情報を入力してください。</p>
<form action="update" method="post">
    商品ID<input type="text" name="id">
    新しい商品名<input type="text" name="name">
    <input type="submit" value="更新">
</form>
<form action="update2" method="post">
    商品ID<input type="text" name="id">
    新しい価格　<input type="text" name="price">
    <input type="submit" value="更新">
</form>
<form action="update3" method="post">
    商品ID<input type="text" name="id">
    新しい産地　<input type="text" name="area">
    <input type="submit" value="更新">
</form>

<script>
document.getElementById('insertForm').addEventListener('submit', function(event) {
  var name = document.getElementById('name').value;
  if (name.trim().length > 10) {
    alert('商品名は10文字以内で入力してください。');
    event.preventDefault();  // フォームの送信を防止
  }
});
</script>


<%@include file="../footer.html"%>

