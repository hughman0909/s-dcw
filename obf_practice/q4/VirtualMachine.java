public class VirtualMachine {
    public static String execute(int[] code) {
        int a = 0;
        int b = 0;
        int pc = 0;
        StringBuilder output = new StringBuilder();

        while (pc < code.length) {
            int op = code[pc++] ^ 0x55;
            switch (op) {
                case 0x10:
                    a = code[pc++];
                    break;
                case 0x20:
                    b = code[pc++];
                    break;
                case 0x30:
                    a = a ^ b;
                    break;
                case 0x40:
                    a = a + b;
                    break;
                case 0x60:
                    a = a - b;
                    break;
                case 0x50:
                    output.append((char) a);
                    break;
                case 0xFF:
                    return output.toString();
                default:
                    throw new IllegalArgumentException("Invalid opcode at " + (pc - 1));
            }
        }
        throw new IllegalArgumentException("No halt instruction");
    }
}
