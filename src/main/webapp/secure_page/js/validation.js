// ボタンクリック時の処理を追加
const submitButton = document.getElementById("submit");

submitButton.addEventListener("click", function (event) {
    // 入力フィールドの値を取得
    const userInput = document.getElementById("username").value;

    // 入力が空白または未入力の場合はエラーメッセージを表示して送信をキャンセル
    if (userInput.trim() === "") {
        alert("ユーザー名を入力してください。");
        event.preventDefault(); // フォーム送信をキャンセル
    }
});
