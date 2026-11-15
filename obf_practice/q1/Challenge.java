public class Challenge {
    static int[] data = {90, 76, 74, 89, 76, 91};

    static int mix(int a, int b) {
        return (a ^ b) + 2 * (a & b);
    }

    static char decode(int value) {
        return (char) mix(value, -7);
    }

    public static void main(String[] args) {
        System.out.println("Q1: Find the six-character answer.");
    }
}
