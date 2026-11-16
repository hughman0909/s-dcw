import java.util.Stack;

public class VirtualizationObfuscationDemo {

    // 1. 独自定義した仮想オペコード (V-Opcodes)
    // 解析を難しくするため、実際のツールではこれらをランダムな数値や暗号化された値にします
    private static final byte OP_HALT  = 0x00; // 終了
    private static final byte OP_PUSH  = 0x01; // スタックに値を積む
    private static final byte OP_ADD   = 0x02; // スタックから2つ取り出して加算し、結果を積む
    private static final byte OP_PRINT = 0x03; // スタックの先頭を表示する

    // 2. 仮想マシンのインタプリタ（ディスパッチャとハンドラー）
    public static void executeVM(byte[] bytecode) {
        Stack<Integer> vStack = new Stack<>(); // 仮想スタック
        int ip = 0; // 仮想インストラクションポインタ (VIP)
        boolean running = true;

        while (running && ip < bytecode.length) {
            // バイトコードからオペコードを1バイト読み込み
            byte opcode = bytecode[ip++];

            switch (opcode) {
                case OP_PUSH: {
                    // 次の4バイトからint値を復元（ビッグエンディアン）
                    int value = ((bytecode[ip] & 0xFF) << 24) |
                                ((bytecode[ip + 1] & 0xFF) << 16) |
                                ((bytecode[ip + 2] & 0xFF) << 8) |
                                (bytecode[ip + 3] & 0xFF);
                    ip += 4;
                    vStack.push(value);
                    break;
                }
                case OP_ADD: {
                    int b = vStack.pop();
                    int a = vStack.pop();
                    vStack.push(a + b);
                    break;
                }
                case OP_PRINT: {
                    System.out.println("VM Result: " + vStack.peek());
                    break;
                }
                case OP_HALT:
                default:
                    running = false;
                    break;
            }
        }
    }

    public static void main(String[] args) {
        // 元のロジック: System.out.println(10 + 20);
        // これを独自のバイトコード配列（データ）に変換して隠蔽する
        byte[] protectedCode = new byte[] {
            OP_PUSH,  0x00, 0x00, 0x00, 0x0A, // PUSH 10 (0x0A)
            OP_PUSH,  0x00, 0x00, 0x00, 0x14, // PUSH 20 (0x14)
            OP_ADD,                           // 10 + 20
            OP_PRINT,                         // 結果を出力
            OP_HALT                           // 終了
        };

        System.out.println("Starting custom VM...");
        executeVM(protectedCode);
    }
}

