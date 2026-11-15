/*
 * ============================================================
 *  Frida フック: ransom.apk の判定を動的に突破する
 * ============================================================
 *  対象: com.kithub.ransomlock.CryptoChecker.checkKey(String): boolean
 *
 *  静的解析（jadx/パッチング）は「ファイルを読む・書き換える」。
 *  Frida は「動いているアプリに実行時に割り込む」= 動的解析。
 *  同じ判定を、APK を一切書き換えずに乗っ取る。
 *
 *  使い方（アプリ起動済みのエミュで）:
 *    frida -U -f com.kithub.ransomlock.easy -l hook.js
 *      -U: USB/エミュ接続のデバイス
 *      -f: アプリを spawn（起動の瞬間から掴む）
 *    プロンプトが出たら  %resume  で再開
 */

Java.perform(function () {
    console.log("[*] hooking CryptoChecker.checkKey ...");

    var CryptoChecker = Java.use("com.kithub.ransomlock.CryptoChecker");

    // checkKey(String): boolean を上書き
    CryptoChecker.checkKey.overload('java.lang.String').implementation = function (input) {
        // --- ① 盗み見: 入力と、本来の判定結果をログに出す ---
        var realResult = this.checkKey(input);   // 本来の判定を一度呼ぶ
        console.log("[*] checkKey(\"" + input + "\") = " + realResult);

        // --- ② 突破: 本来の結果に関係なく常に true を返す ---
        //     → どんな入力でも「解除成功」画面になる
        console.log("[+] forcing return TRUE (bypass)");
        return true;
    };

    console.log("[*] hook installed. どんなキーを入れても突破します。");
});
