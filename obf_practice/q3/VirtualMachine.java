public class VirtualMachine {
    static String execute(int[] code, int[] memory) {
        int pc = 0;
        int value = 0;
        StringBuilder output = new StringBuilder();
        while (pc < code.length) {
            int opcode = code[pc++];
            switch (opcode) {
                case 0x10:
                    value = memory[code[pc++]];
                    break;
                case 0x20:
                    value = value ^ code[pc++];
                    break;
                case 0x30:
                    output.append((char) value);
                    break;
                case 0xFF:
                    return output.toString();
                default:
                    throw new IllegalArgumentException("Unknown opcode: " + opcode);
            }
        }
        return output.toString();
    }
}
