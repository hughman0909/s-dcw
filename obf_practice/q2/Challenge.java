public class Challenge {
    static String trace(String input) {
        if (!input.matches("[0-9]{8}")) throw new IllegalArgumentException("8 digits required");
        int[] digits = new int[8];
        for (int i = 0; i < 8; i++) digits[i] = input.charAt(i) - '0';
        int state = digits[0] + 2;
        StringBuilder result = new StringBuilder();
        int limit = 30;
        while (state != -1 && limit-- > 0) {
            switch (state) {
                case 5:
                    result.append('B');
                    state = ((digits[0] * (digits[0] - 1)) % 2 == 0) ? 12 : 9;
                    break;
                case 9:
                    result.append('K');
                    state = -1;
                    break;
                case 2:
                    result.append('Z');
                    state = 8;
                    break;
                case 15:
                    result.append('M');
                    state = -1;
                    break;
                case 3:
                    result.append('A');
                    state = ((digits[2] * (digits[2] - 1)) % 2 == 0) ? 19 : 9;
                    break;
                case 11:
                    result.append('Q');
                    state = -1;
                    break;
                case 19:
                    result.append('N');
                    state = ((digits[3] * (digits[3] - 1)) % 2 == 0) ? 7 : 9;
                    break;
                case 4:
                    result.append('W');
                    state = 11;
                    break;
                case 8:
                    result.append('T');
                    state = -1;
                    break;
                case 7:
                    result.append('C');
                    state = ((digits[4] * (digits[4] - 1)) % 2 == 0) ? 14 : 9;
                    break;
                case 22:
                    result.append('Y');
                    state = -1;
                    break;
                case 14:
                    result.append('H');
                    state = ((digits[5] * (digits[5] - 1)) % 2 == 0) ? -1 : 17;
                    break;
                case 6:
                    result.append('X');
                    state = 15;
                    break;
                case 17:
                    result.append('D');
                    state = -1;
                    break;
                case 12:
                    result.append('R');
                    state = ((digits[1] * (digits[1] - 1)) % 2 == 0) ? 3 : 9;
                    break;
                case 10:
                    result.append('P');
                    state = -1;
                    break;
                default:
                    throw new IllegalStateException("Unknown state: " + state);
            }
        }
        if (limit <= 0) throw new IllegalStateException("Too many steps");
        return result.toString();
    }

    public static void main(String[] args) {
        System.out.println("Input: 32456784");
        System.out.println("Q2: Follow the real states and concatenate their letters.");
    }
}
