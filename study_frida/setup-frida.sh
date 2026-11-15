#!/usr/bin/env bash
# =====================================================================
#  frida-server をエミュに自動設置するスクリプト
#  - ホストの frida のバージョンに合わせて frida-server を取得（不一致を防ぐ）
#  - エミュのアーキを自動判定
#  - push → chmod → 起動 → 疎通確認 まで一気に
#
#  使い方（エミュが起動している状態で）:
#    ./setup-frida.sh
# =====================================================================
set -u

echo "==> 前提チェック"
command -v adb   >/dev/null || { echo "adb が無い。PATHを確認（~/.zshrc）"; exit 1; }
command -v frida >/dev/null || { echo "frida が無い。pip install frida-tools"; exit 1; }

# エミュが繋がっているか
if ! adb get-state 1>/dev/null 2>&1; then
    echo "エミュが見つからない。先に emulator -avd <名前> で起動してください。"
    exit 1
fi

# ホストの frida バージョン（例 17.24.3）
VER="$(frida --version | tr -d '[:space:]')"
echo "==> host frida version: $VER"

# エミュのアーキ
ABI="$(adb shell getprop ro.product.cpu.abi | tr -d '[:space:]')"
case "$ABI" in
    arm64-v8a) ARCH="arm64" ;;
    armeabi*)  ARCH="arm"   ;;
    x86_64)    ARCH="x86_64" ;;
    x86)       ARCH="x86"   ;;
    *) echo "未知のABI: $ABI"; exit 1 ;;
esac
echo "==> device ABI: $ABI -> frida-server arch: $ARCH"

# root化（google_apisイメージなら通る）
adb root >/dev/null 2>&1
sleep 1

# --- 既にエミュに入っている frida-server のバージョンを確認 ---
# ホストの frida と一致していれば DL も転送もスキップする。
echo "==> エミュ上の既存 frida-server を確認"
DEV_VER="$(adb shell '[ -x /data/local/tmp/frida-server ] && /data/local/tmp/frida-server --version 2>/dev/null' | tr -d '[:space:]')"

if [ "$DEV_VER" = "$VER" ]; then
    echo "    既に frida-server $DEV_VER があります（host $VER と一致）→ DLスキップ"
else
    if [ -n "$DEV_VER" ]; then
        echo "    既存 frida-server は $DEV_VER（host $VER と不一致）→ 入れ直します"
    else
        echo "    frida-server が無い → ダウンロードします"
    fi

    FS="frida-server-${VER}-android-${ARCH}"
    URL="https://github.com/frida/frida/releases/download/${VER}/${FS}.xz"

    # ローカルキャッシュ（解凍済みバイナリを貯めておき、2回目以降は再DLしない）
    CACHE="$HOME/.frida-cache"
    mkdir -p "$CACHE"
    BIN="$CACHE/$FS"                     # 解凍後のバイナリ

    if [ -x "$BIN" ]; then
        echo "    キャッシュ利用: $BIN （DLスキップ）"
    else
        # Downloads に手動で置いた xz があればそれを使う（無ければDL）
        SRC_XZ=""
        for cand in "$CACHE/${FS}.xz" "$HOME/Downloads/${FS}.xz"; do
            [ -f "$cand" ] && SRC_XZ="$cand" && break
        done

        if [ -z "$SRC_XZ" ]; then
            echo "==> ダウンロード: $URL"
            if ! curl -fL -o "$CACHE/${FS}.xz" "$URL"; then
                echo "DL失敗。手動で落として ~/Downloads に置いてください:"
                echo "   https://github.com/frida/frida/releases/tag/${VER}"
                exit 1
            fi
            SRC_XZ="$CACHE/${FS}.xz"
        else
            echo "    既存の xz を利用: $SRC_XZ （DLスキップ）"
        fi

        echo "==> 解凍 -> キャッシュ"
        # -k で元xzを残す。出力をキャッシュのバイナリ名に固定
        unxz -kc "$SRC_XZ" > "$BIN"
        chmod 755 "$BIN"
    fi

    echo "==> エミュへ転送"
    adb push "$BIN" /data/local/tmp/frida-server >/dev/null
    adb shell "chmod 755 /data/local/tmp/frida-server"
fi

echo "==> 既存の frida-server を停止して起動"
adb shell "pkill frida-server" 2>/dev/null
sleep 1
# nohup でエミュ側に切り離し、さらに Mac 側の adb shell も background 化する。
# （これをしないと adb shell が frida-server の終了を待ち続けてスクリプトが固まる）
adb shell "nohup /data/local/tmp/frida-server >/dev/null 2>&1 &" >/dev/null 2>&1 &
sleep 3

echo "==> 疎通確認 (frida-ps -U)"
if frida-ps -U >/dev/null 2>&1; then
    echo ""
    echo "✅ 成功。frida-server が動いています。"
    echo "   次: frida -U -f com.kithub.ransomlock.easy -l frida/hook.js"
else
    echo ""
    echo "❌ frida-ps -U が通りません。よくある原因:"
    echo "   - バージョン不一致（host: $VER）"
    echo "   - frida-server が起動していない: adb shell \"/data/local/tmp/frida-server &\""
    echo "   - root が取れていない: adb root"
fi
